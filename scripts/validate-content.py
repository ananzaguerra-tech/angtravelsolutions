#!/usr/bin/env python3
import json
import sys
import unicodedata
from pathlib import Path

REQUIRED_COUNTRY = ("country", "currency", "languages", "voltage", "best_time", "cities")
REQUIRED_CITY = ("name", "summary", "attractions", "premium_experiences")

def slug(value: str) -> str:
    normalized = unicodedata.normalize("NFKD", value)
    ascii_value = "".join(ch for ch in normalized if not unicodedata.combining(ch))
    return "-".join(ascii_value.lower().strip().split())

def require_string(obj, key, location, errors, minimum=1):
    value = obj.get(key)
    if not isinstance(value, str) or len(value.strip()) < minimum:
        errors.append(f"{location}.{key}: string required (minimum {minimum} characters)")

def validate(path: Path) -> list[str]:
    errors = []
    try:
        payload = json.loads(path.read_text(encoding="utf-8"))
    except Exception as exc:
        return [f"{path}: invalid JSON: {exc}"]

    if not isinstance(payload, dict):
        return [f"{path}: root must be an object"]
    if payload.get("status") != "draft_for_staging":
        errors.append(f"{path}.status: must be draft_for_staging")
    if not isinstance(payload.get("schema_version"), str):
        errors.append(f"{path}.schema_version: string required")

    destinations = payload.get("destinations")
    if not isinstance(destinations, list) or not destinations:
        return errors + [f"{path}.destinations: non-empty array required"]

    countries_seen = set()
    paths_seen = set()

    for country_index, country in enumerate(destinations):
        location = f"{path}.destinations[{country_index}]"
        if not isinstance(country, dict):
            errors.append(f"{location}: object required")
            continue
        for key in REQUIRED_COUNTRY:
            if key not in country:
                errors.append(f"{location}.{key}: required")
        require_string(country, "country", location, errors)
        require_string(country, "currency", location, errors)
        require_string(country, "voltage", location, errors)
        require_string(country, "best_time", location, errors)
        if not isinstance(country.get("languages"), list) or not country["languages"]:
            errors.append(f"{location}.languages: non-empty array required")

        country_slug = slug(str(country.get("country", "")))
        if country_slug in countries_seen:
            errors.append(f"{location}: duplicate country slug {country_slug}")
        countries_seen.add(country_slug)

        cities = country.get("cities")
        if not isinstance(cities, list) or not cities:
            errors.append(f"{location}.cities: non-empty array required")
            continue
        for city_index, city in enumerate(cities):
            city_location = f"{location}.cities[{city_index}]"
            if not isinstance(city, dict):
                errors.append(f"{city_location}: object required")
                continue
            for key in REQUIRED_CITY:
                if key not in city:
                    errors.append(f"{city_location}.{key}: required")
            require_string(city, "name", city_location, errors)
            require_string(city, "summary", city_location, errors, minimum=20)
            for key in ("attractions", "premium_experiences"):
                if not isinstance(city.get(key), list) or not city[key]:
                    errors.append(f"{city_location}.{key}: non-empty array required")
            hierarchy = f"{country_slug}/{slug(str(city.get('name', '')))}"
            if hierarchy in paths_seen:
                errors.append(f"{city_location}: duplicate hierarchy {hierarchy}")
            paths_seen.add(hierarchy)

    print(f"{path}: {len(destinations)} countries, {sum(len(x.get('cities', [])) for x in destinations if isinstance(x, dict))} cities")
    return errors

def main() -> int:
    targets = [Path(arg) for arg in sys.argv[1:]]
    if not targets:
        targets = sorted(Path("content/destinations").glob("*.json")) + sorted(Path("plugin/ang-enterprise-suite/data").glob("*.json"))
    errors = []
    for target in targets:
        errors.extend(validate(target))
    if errors:
        print("\n".join(f"ERROR: {error}" for error in errors), file=sys.stderr)
        return 1
    print(f"Validated {len(targets)} destination batch file(s) with no errors.")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
