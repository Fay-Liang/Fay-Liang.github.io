$ErrorActionPreference = 'Stop'
$src = 'D:\Hexo\source\_posts'
$dst = 'D:\Note\docs'
$root = 'D:\Note'
$utf8 = New-Object System.Text.UTF8Encoding($false)

Remove-Item -LiteralPath 'D:\Note\docs\getting-started' -Recurse -Force -EA SilentlyContinue
Remove-Item -LiteralPath 'D:\Note\docs\user-guide' -Recurse -Force -EA SilentlyContinue
Remove-Item -LiteralPath 'D:\Note\docs\about.md' -Force -EA SilentlyContinue
Remove-Item -LiteralPath 'D:\Note\docs\assets\css' -Recurse -Force -EA SilentlyContinue
Remove-Item -LiteralPath 'D:\Note\docs\assets\js' -Recurse -Force -EA SilentlyContinue

$files = Get-ChildItem -LiteralPath $src -Recurse -File
foreach ($f in $files) {
    $rel = $f.FullName.Substring($src.Length).TrimStart('\')
    if ($f.Extension -ne '.md') {
        $target = Join-Path $dst $rel
        $parent = Split-Path $target
        if (-not (Test-Path $parent)) { New-Item -ItemType Directory -Force -Path $parent | Out-Null }
        Copy-Item -LiteralPath $f.FullName -Destination $target -Force
        Write-Host "asset: $rel"
        continue
    }
    if ($f.Length -eq 0) { Write-Host "skip empty: $rel"; continue }
    $text = [System.IO.File]::ReadAllText($f.FullName, $utf8)
    if ([string]::IsNullOrWhiteSpace($text)) { Write-Host "skip blank: $rel"; continue }

    $m = [regex]::Match($text, '^\s*---\r?\n(.*?)\r?\n---\s*\r?\n', 'Singleline')
    if (-not $m.Success) {
        $draftDir = Join-Path $root 'drafts'
        if (-not (Test-Path $draftDir)) { New-Item -ItemType Directory -Force -Path $draftDir | Out-Null }
        [System.IO.File]::WriteAllText((Join-Path $draftDir $f.Name), $text, $utf8)
        Write-Host "draft: $rel"
        continue
    }

    $fm = $m.Groups[1].Value
    $body = $text.Substring($m.Length)
    $title = ''
    $date  = ''
    foreach ($line in $fm -split '\r?\n') {
        if ($line -match '^\s*title:\s*(.+?)\s*$') { $title = $matches[1] }
        if ($line -match '^\s*date:\s*(.+?)\s*$')  { $date  = $matches[1] }
    }
    # skip placeholder title: U+5F85 U+5B9A = "dai ding"
    if ($title -match '[\u5f85\u5b9a]') { Write-Host "skip placeholder: $rel"; continue }
    $newFm = "---`n"
    if ($title) { $newFm += "title: $title`n" }
    if ($date)  { $newFm += "date: $date`n" }
    $newFm += "---`n"
    $parts = $rel -split '\\'
    $targetDir = Join-Path $dst $parts[0]
    if (-not (Test-Path $targetDir)) { New-Item -ItemType Directory -Force -Path $targetDir | Out-Null }
    [System.IO.File]::WriteAllText((Join-Path $targetDir $f.Name), $newFm + $body, $utf8)
    Write-Host "post: $rel"
}

$imgDir = Join-Path $dst 'assets\images'
$sponsorDir = Join-Path $dst 'assets\sponsor'
$avatarDir = Join-Path $dst 'assets\avatar'
$coversDir = Join-Path $dst 'assets\covers'
New-Item -ItemType Directory -Force -Path $imgDir | Out-Null
New-Item -ItemType Directory -Force -Path $sponsorDir | Out-Null
New-Item -ItemType Directory -Force -Path $avatarDir | Out-Null
New-Item -ItemType Directory -Force -Path $coversDir | Out-Null
Copy-Item -Path 'D:\Hexo\source\images\*' -Destination $imgDir -Recurse -Force -EA SilentlyContinue
Copy-Item -Path 'D:\Hexo\source\sponsor\*' -Destination $sponsorDir -Recurse -Force -EA SilentlyContinue
Copy-Item -Path 'D:\Hexo\source\_data\avatar\*' -Destination $avatarDir -Recurse -Force -EA SilentlyContinue
Copy-Item -Path 'D:\Hexo\source\_data\covers\*' -Destination $coversDir -Recurse -Force -EA SilentlyContinue
Write-Host "DONE"