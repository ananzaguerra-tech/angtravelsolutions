param(
  [Parameter(Mandatory=$true)][string]$QueuePath,
  [string]$HistoryPath = '.\ops\social\published-media-history.json',
  [string]$BlockedPath = '.\ops\social\blocked-social-assets.json'
)
$ErrorActionPreference='Stop'
function Norm([string]$s){ if([string]::IsNullOrWhiteSpace($s)){ return '' }; return (($s.ToLowerInvariant() -replace '\s+',' ').Trim()) }
function Pick($a,$b){ if($null -ne $a -and -not [string]::IsNullOrWhiteSpace([string]$a)){ return [string]$a }; return [string]$b }
function AddSeen($set,[string]$value){ $n=Norm $value; if($n){ $set[$n]=$true } }
function HasSeen($set,[string]$value){ $n=Norm $value; if(-not $n){ return $false }; return $set.ContainsKey($n) }
if(!(Test-Path $QueuePath)){ throw ('QUEUE_NOT_FOUND:' + $QueuePath) }
$queue = Get-Content -Raw -Encoding UTF8 $QueuePath | ConvertFrom-Json
$history = if(Test-Path $HistoryPath){ @(Get-Content -Raw -Encoding UTF8 $HistoryPath | ConvertFrom-Json) } else { @() }
$blocked = if(Test-Path $BlockedPath){ Get-Content -Raw -Encoding UTF8 $BlockedPath | ConvertFrom-Json } else { [pscustomobject]@{} }
$seenMedia=@{}; $seenCopy=@{}; $seenTopics=@{}; $seenDesigns=@{}; $seenComposition=@{}
foreach($h in $history){
  foreach($u in @($h.image_url)+@($h.image_urls)+@($h.video_url)+@($h.video_urls)+@($h.media_urls)){ AddSeen $seenMedia ([string]$u) }
  AddSeen $seenCopy (Pick $h.copy $h.caption); AddSeen $seenTopics (Pick $h.topic $h.theme_key)
  AddSeen $seenDesigns ([string]$h.canva_design_id); AddSeen $seenComposition ([string]$h.composition_hash)
}
$errors = New-Object System.Collections.Generic.List[string]
$queueMedia=@{}; $queueCopy=@{}; $queueTopic=@{}; $queueDesign=@{}
foreach($i in @($queue.items)){
  $id=[string]$i.id; $status=[string]$i.status; $copy=Pick $i.copy $i.caption; $topic=Pick $i.topic $i.theme_key
  $design=[string]$i.canva_design_id; $composition=[string]$i.composition_hash
  if(@($blocked.payload_ids) -contains $id){ $errors.Add(('BLOCKED_PAYLOAD:' + $id)) }
  if($status -match '^(HOLD|REJECT|BLOCK)' -or $i.publish_authorized -eq $false){ $errors.Add(('NOT_PUBLISHABLE_STATUS:' + $id + ':' + $status)) }
  $urls=@($i.image_url)+@($i.image_urls)+@($i.video_url)+@($i.video_urls)+@($i.media_urls) | Where-Object { $_ }
  if(@($urls).Count -eq 0){ $errors.Add(('MISSING_REAL_MEDIA:' + $id)) }
  foreach($u in $urls){
    $s=[string]$u; $n=Norm $s
    $dup = ((@($blocked.urls) -contains $s) -or (HasSeen $seenMedia $s) -or ($n -and $queueMedia.ContainsKey($n)))
    if($dup){ $errors.Add(('DUPLICATE_MEDIA:' + $id)) }
    if($n){ $queueMedia[$n]=$id }
  }
  if($copy){ $n=Norm $copy; if((HasSeen $seenCopy $copy) -or $queueCopy.ContainsKey($n)){ $errors.Add(('DUPLICATE_COPY:' + $id)) }; $queueCopy[$n]=$id }
  if($topic){ $n=Norm $topic; if((@($blocked.topics) -contains $topic) -or (HasSeen $seenTopics $topic) -or $queueTopic.ContainsKey($n)){ $errors.Add(('DUPLICATE_TOPIC:' + $id)) }; $queueTopic[$n]=$id }
  if($design){ $n=Norm $design; if((@($blocked.canva_design_ids) -contains $design) -or (HasSeen $seenDesigns $design) -or $queueDesign.ContainsKey($n)){ $errors.Add(('DUPLICATE_DESIGN:' + $id)) }; $queueDesign[$n]=$id }
  if($composition -and ((@($blocked.composition_hashes) -contains $composition) -or (HasSeen $seenComposition $composition))){ $errors.Add(('DUPLICATE_COMPOSITION:' + $id)) }
  if(-not $i.brand_master_id){ $errors.Add(('MISSING_BRAND_MASTER:' + $id)) }
}
if($errors.Count -gt 0){ $errors | Sort-Object -Unique | ForEach-Object { Write-Output $_ }; exit 42 }
Write-Output 'SOCIAL_DEDUPE_PREFLIGHT=PASS'
