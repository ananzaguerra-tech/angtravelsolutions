-- ANG social publication idempotency ledger — PostgreSQL reference migration v1
-- C310 / 2026-10-30
-- REFERENCE_ONLY / NOT_APPLIED / NO_CREDENTIALS
-- This migration must be reviewed, applied and tested in a staging database before any n8n import is activated.

BEGIN;

CREATE TABLE IF NOT EXISTS ang_social_publication_ledger (
    ledger_id bigint GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    idempotency_record_id text NOT NULL UNIQUE,
    idempotency_key text NOT NULL UNIQUE,
    state text NOT NULL DEFAULT 'UNUSED'
        CHECK (state IN ('UNUSED', 'RESERVED', 'PUBLISHED', 'FAILED')),
    channel text NOT NULL
        CHECK (channel IN ('facebook', 'instagram')),
    destination_id text NOT NULL,
    payload_id text NOT NULL,
    media_id text NOT NULL,
    media_sha256 text NOT NULL
        CHECK (media_sha256 ~ '^[0-9A-Fa-f]{64}$'),
    visual_hash text NOT NULL,
    theme_key text NOT NULL,
    reservation_execution_id text,
    publication_id text,
    permalink text,
    publication_execution_id text,
    readback_verified boolean NOT NULL DEFAULT false,
    last_error_code text,
    created_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    reserved_at timestamptz,
    published_at timestamptz,
    failed_at timestamptz,
    updated_at timestamptz NOT NULL DEFAULT clock_timestamp(),
    version bigint NOT NULL DEFAULT 0,
    CHECK (length(btrim(idempotency_record_id)) > 0),
    CHECK (length(btrim(idempotency_key)) > 0),
    CHECK (length(btrim(destination_id)) > 0),
    CHECK (length(btrim(payload_id)) > 0),
    CHECK (length(btrim(media_id)) > 0),
    CHECK (length(btrim(visual_hash)) > 0),
    CHECK (length(btrim(theme_key)) > 0),
    CHECK (
        state <> 'PUBLISHED'
        OR (
            publication_id IS NOT NULL
            AND permalink ~ '^https://'
            AND publication_execution_id IS NOT NULL
            AND readback_verified = true
            AND published_at IS NOT NULL
        )
    )
);

CREATE UNIQUE INDEX IF NOT EXISTS ang_social_publication_visual_destination_active_uq
    ON ang_social_publication_ledger (channel, destination_id, visual_hash)
    WHERE state IN ('RESERVED', 'PUBLISHED');

CREATE OR REPLACE FUNCTION ang_register_social_publication(
    p_record_id text,
    p_idempotency_key text,
    p_channel text,
    p_destination_id text,
    p_payload_id text,
    p_media_id text,
    p_media_sha256 text,
    p_visual_hash text,
    p_theme_key text
) RETURNS bigint
LANGUAGE plpgsql
AS $$
DECLARE
    v_ledger_id bigint;
BEGIN
    INSERT INTO ang_social_publication_ledger (
        idempotency_record_id, idempotency_key, state, channel, destination_id,
        payload_id, media_id, media_sha256, visual_hash, theme_key
    ) VALUES (
        p_record_id, p_idempotency_key, 'UNUSED', p_channel, p_destination_id,
        p_payload_id, p_media_id, p_media_sha256, p_visual_hash, p_theme_key
    )
    ON CONFLICT DO NOTHING
    RETURNING ledger_id INTO v_ledger_id;

    IF v_ledger_id IS NULL THEN
        RAISE EXCEPTION 'IDEMPOTENCY_OR_VISUAL_KEY_ALREADY_EXISTS';
    END IF;

    RETURN v_ledger_id;
END;
$$;

CREATE OR REPLACE FUNCTION ang_reserve_social_publication(
    p_record_id text,
    p_idempotency_key text,
    p_execution_id text
) RETURNS bigint
LANGUAGE plpgsql
AS $$
DECLARE
    v_ledger_id bigint;
BEGIN
    UPDATE ang_social_publication_ledger
       SET state = 'RESERVED',
           reservation_execution_id = p_execution_id,
           reserved_at = clock_timestamp(),
           updated_at = clock_timestamp(),
           version = version + 1
     WHERE idempotency_record_id = p_record_id
       AND idempotency_key = p_idempotency_key
       AND state = 'UNUSED'
    RETURNING ledger_id INTO v_ledger_id;

    IF v_ledger_id IS NULL THEN
        RAISE EXCEPTION 'IDEMPOTENCY_KEY_NOT_UNUSED_OR_UNKNOWN';
    END IF;

    RETURN v_ledger_id;
END;
$$;

CREATE OR REPLACE FUNCTION ang_mark_social_publication_published(
    p_record_id text,
    p_reservation_execution_id text,
    p_publication_id text,
    p_permalink text,
    p_publication_execution_id text
) RETURNS bigint
LANGUAGE plpgsql
AS $$
DECLARE
    v_ledger_id bigint;
BEGIN
    IF p_publication_id IS NULL OR btrim(p_publication_id) = ''
       OR p_permalink !~ '^https://'
       OR p_publication_execution_id IS NULL OR btrim(p_publication_execution_id) = '' THEN
        RAISE EXCEPTION 'INVALID_PUBLICATION_RECEIPT';
    END IF;

    UPDATE ang_social_publication_ledger
       SET state = 'PUBLISHED',
           publication_id = p_publication_id,
           permalink = p_permalink,
           publication_execution_id = p_publication_execution_id,
           readback_verified = true,
           published_at = clock_timestamp(),
           updated_at = clock_timestamp(),
           version = version + 1
     WHERE idempotency_record_id = p_record_id
       AND reservation_execution_id = p_reservation_execution_id
       AND state = 'RESERVED'
    RETURNING ledger_id INTO v_ledger_id;

    IF v_ledger_id IS NULL THEN
        RAISE EXCEPTION 'RESERVATION_NOT_FOUND_OR_NOT_ACTIVE';
    END IF;

    RETURN v_ledger_id;
END;
$$;

CREATE OR REPLACE FUNCTION ang_mark_social_publication_failed(
    p_record_id text,
    p_reservation_execution_id text,
    p_error_code text
) RETURNS bigint
LANGUAGE plpgsql
AS $$
DECLARE
    v_ledger_id bigint;
BEGIN
    UPDATE ang_social_publication_ledger
       SET state = 'FAILED',
           last_error_code = left(coalesce(p_error_code, 'UNKNOWN_FAILURE'), 200),
           failed_at = clock_timestamp(),
           updated_at = clock_timestamp(),
           version = version + 1
     WHERE idempotency_record_id = p_record_id
       AND reservation_execution_id = p_reservation_execution_id
       AND state = 'RESERVED'
    RETURNING ledger_id INTO v_ledger_id;

    IF v_ledger_id IS NULL THEN
        RAISE EXCEPTION 'RESERVATION_NOT_FOUND_OR_NOT_ACTIVE';
    END IF;

    RETURN v_ledger_id;
END;
$$;

COMMIT;

-- No reset/reuse function is intentionally provided.
-- FAILED and PUBLISHED keys remain terminal; a new reviewed payload requires a new idempotency key.
