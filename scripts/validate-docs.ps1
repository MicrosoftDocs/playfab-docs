<#
.SYNOPSIS
    Validates PlayFab documentation files for common authoring issues.

.DESCRIPTION
    Checks changed (or all) Markdown and toc.yml files for:
    - Missing/invalid frontmatter fields (including calendar date validation)
    - Raw HTML usage
    - Broken TOC links (href pointing to non-existent files)
    - Missing image alt-text and broken image paths
    - Heading structure issues (duplicate H1, heading skips, H1/title mismatch)
    - Cross-repo link formatting
    - Broken internal markdown links
    - Broken include references
    - Code blocks without language specifiers
    - Orphaned redirect files (still on disk but listed in redirection JSON)
    - Writing style issues (Latin abbreviations, em dashes, filler words,
      contractions, hyphenated prefixes) — skips inline code and blockquotes

.PARAMETER All
    Validate all files under playfab-docs/ instead of just changed files.

.PARAMETER Path
    Validate a specific file or directory.

.EXAMPLE
    .\scripts\validate-docs.ps1              # changed files vs main
    .\scripts\validate-docs.ps1 -All         # entire docs folder
    .\scripts\validate-docs.ps1 -Path playfab-docs/economy-monetization
#>

param(
    [switch]$All,
    [string]$Path
)

$ErrorActionPreference = "Continue"
$repoRoot = Split-Path -Parent $PSScriptRoot
Push-Location $repoRoot
try { # matched by Pop-Location at script end

# --- Pre-compiled regexes (avoid recompilation per-line) ---

$rxFrontmatter     = [regex]::new('(?s)^---\r?\n(.*?)\r?\n---', 'Compiled')
$rxCodeFence       = [regex]::new('^\s*(`{3,}|~{3,})', 'Compiled')
$rxRawHtml         = [regex]::new('<\s*(div|span|table|tr|td|th|thead|tbody|p|a|img|ul|ol|li|h[1-6]|strong|em|b|i|u|s|hr|pre|code|blockquote|form|input|button|select|style|script)\b[^>]*>', 'Compiled')
$rxEmptyAlt        = [regex]::new('!\[\]\(', 'Compiled')
$rxHeading         = [regex]::new('^(#{1,6})\s+(.+)$', 'Compiled')
$rxCrossRepoMd     = [regex]::new('\]\(/gaming/[^)]+\.md\)', 'Compiled')
$rxMdLink          = [regex]::new('\[([^\]]*)\]\(([^)]+)\)', 'Compiled')
$rxInclude         = [regex]::new('\[!INCLUDE\s+\[[^\]]*\]\(([^)]+)\)', 'Compiled')
$rxLatinAbbrev     = [regex]::new('(?<!\w)(e\.g\.|i\.e\.|etc\.|vs\.)', 'Compiled')
$rxSpacedEmDash    = [regex]::new('\s\u2014|\u2014\s', 'Compiled')
$rxFiller          = [regex]::new('(?i)\b(strongly|very|really)\b', 'Compiled')
$rxContraction     = [regex]::new('(?i)\b(cannot|does not|do not|will not|is not|are not|has not|have not|should not|would not|could not|did not)\b', 'Compiled')
$rxHyphenPrefix    = [regex]::new('(?i)\bre-(authenticate|authorize|configure|connect|create|deploy|enable|establish|evaluate|generate|initialize|install|register|run|send|start|try|use|validate|download|upload|build|load|check|discover|implement|write)\b', 'Compiled')
$rxImageRef        = [regex]::new('!\[([^\]]*)\]\(([^)]+)\)', 'Compiled')
$rxInlineCode      = [regex]::new('`[^`]+`', 'Compiled')

# --- File-existence cache (avoids redundant Test-Path calls) ---

$existsCache = @{}
function Test-PathCached($resolvedPath) {
    if (-not $existsCache.ContainsKey($resolvedPath)) {
        $existsCache[$resolvedPath] = (Test-Path $resolvedPath)
    }
    return $existsCache[$resolvedPath]
}

# --- Collect files to validate ---

$mdFiles = @()
$tocFiles = @()

if ($Path) {
    $resolvedPath = Resolve-Path $Path -ErrorAction SilentlyContinue
    if (-not $resolvedPath) {
        Write-Host "ERROR: Path '$Path' not found." -ForegroundColor Red
        exit 1
    }
    if (Test-Path $resolvedPath -PathType Container) {
        $mdFiles = Get-ChildItem -Path $resolvedPath -Recurse -Filter "*.md" | Select-Object -ExpandProperty FullName
        $tocFiles = Get-ChildItem -Path $resolvedPath -Recurse -Filter "toc.yml" | Select-Object -ExpandProperty FullName
    } else {
        if ($resolvedPath -match '\.md$') { $mdFiles = @($resolvedPath.Path) }
        if ($resolvedPath -match 'toc\.yml$') { $tocFiles = @($resolvedPath.Path) }
    }
} elseif ($All) {
    $docsPath = Join-Path $repoRoot "playfab-docs"
    $mdFiles = Get-ChildItem -Path $docsPath -Recurse -Filter "*.md" | Select-Object -ExpandProperty FullName
    $tocFiles = Get-ChildItem -Path $docsPath -Recurse -Filter "toc.yml" | Select-Object -ExpandProperty FullName
} else {
    # Changed files vs main (with CI support)
    $changedFiles = @()
    $useThreeDotDiff = $false

    if ($env:GITHUB_ACTIONS -and $env:GITHUB_BASE_REF) {
        # CI: use the PR base ref with three-dot diff
        $baseBranch = "origin/$env:GITHUB_BASE_REF"
        $useThreeDotDiff = $true
    } else {
        # Local: try main, then origin/main, then fall back to HEAD
        $baseBranch = $null
        $tryMain = git rev-parse --verify main 2>$null
        if ($tryMain) {
            $baseBranch = "main"
        } else {
            $tryOriginMain = git rev-parse --verify origin/main 2>$null
            if ($tryOriginMain) {
                $baseBranch = "origin/main"
            }
        }
    }

    if ($useThreeDotDiff) {
        $changedFiles = git --no-pager diff --name-only "$baseBranch...HEAD" 2>&1
        if ($LASTEXITCODE -ne 0) {
            Write-Error "ERROR: Failed to detect changed files in CI. 'git diff $baseBranch...HEAD' exited with code $LASTEXITCODE."
            Write-Error "Output: $changedFiles"
            exit 1
        }
    } elseif ($baseBranch) {
        $changedFiles = git --no-pager diff --name-only $baseBranch 2>&1
        if ($LASTEXITCODE -ne 0) {
            Write-Error "ERROR: Failed to detect changed files. 'git diff --name-only $baseBranch' exited with code $LASTEXITCODE."
            Write-Error "Output: $changedFiles"
            exit 1
        }
    } else {
        # No base branch found — check uncommitted changes
        $changedFiles = git --no-pager diff --name-only HEAD 2>$null
        if (-not $changedFiles) {
            $changedFiles = git --no-pager diff --name-only --cached 2>$null
        }
        if (-not $changedFiles) {
            $changedFiles = git --no-pager status --porcelain 2>$null | ForEach-Object { ($_ -replace '^.{3}', '').Trim() }
        }
    }

    if ($changedFiles) {
        $mdFiles = $changedFiles | Where-Object { $_ -match '\.md$' -and $_ -match '^playfab-docs/' } |
            ForEach-Object { Join-Path $repoRoot $_ } |
            Where-Object { Test-Path $_ }
        $tocFiles = $changedFiles | Where-Object { $_ -match 'toc\.yml$' -and $_ -match '^playfab-docs/' } |
            ForEach-Object { Join-Path $repoRoot $_ } |
            Where-Object { Test-Path $_ }
    }
}

if ($mdFiles.Count -eq 0 -and $tocFiles.Count -eq 0) {
    Write-Host "No files to validate." -ForegroundColor Yellow
    Write-Host "Use -All to validate the entire docs folder, or -Path to target a specific path."
    exit 0
}

# --- Issue tracking ---

$errors = [System.Collections.Generic.List[object]]::new()
$warnings = [System.Collections.Generic.List[object]]::new()
$cleanFiles = [System.Collections.Generic.List[string]]::new()

function Add-Error($file, $line, $check, $message) {
    $script:errors.Add([PSCustomObject]@{
        File = $file; Line = $line; Check = $check; Message = $message
    })
}
function Add-Warning($file, $line, $check, $message) {
    $script:warnings.Add([PSCustomObject]@{
        File = $file; Line = $line; Check = $check; Message = $message
    })
}

# --- Frontmatter parser ---

function Get-Frontmatter($rawContent) {
    $m = $rxFrontmatter.Match($rawContent)
    if ($m.Success) { return $m.Groups[1].Value }
    return $null
}

function Get-FrontmatterField($yaml, $fieldName) {
    $escapedFieldName = [regex]::Escape($fieldName)
    if ($yaml -match "(?m)^${escapedFieldName}:\s*(.+)$") {
        return $Matches[1].Trim().Trim('"').Trim("'")
    }
    return $null
}

# --- Validate Markdown files ---

$alwaysRequiredFields = @("author", "ms.author", "ms.topic", "ms.date", "ms.service")
$articleRequiredFields = @("title", "description")
$validTopics = @("article", "conceptual", "reference", "include", "hub-page", "overview", "release-notes", "quickstart", "tutorial")

foreach ($file in $mdFiles) {
    $relPath = [IO.Path]::GetRelativePath($repoRoot, $file) -replace '\\', '/'
    $fileIssues = $false
    $fileDir = Split-Path $file -Parent
    $isApiRef = ($relPath -match '^playfab-docs/api-references/')

    # Read file content (single read, derive both raw and lines)
    try {
        $lines = @(Get-Content $file -ErrorAction Stop)
    } catch {
        Add-Error $relPath 0 "FILE_READ_ERROR" "Could not read file: $($_.Exception.Message)"
        continue
    }
    $rawContent = $lines -join "`n"

    # --- 1. Frontmatter checks ---
    $yaml = Get-Frontmatter $rawContent
    if (-not $yaml) {
        Add-Error $relPath 1 "MISSING_FRONTMATTER" "No YAML frontmatter found"
        # Skip body checks — missing frontmatter causes noisy false positives
        continue
    } else {
        # Read ms.topic first to determine which fields are required
        $topicValue = Get-FrontmatterField $yaml "ms.topic"
        $isInclude = ($topicValue -eq "include")

        $fieldsToCheck = $alwaysRequiredFields
        if (-not $isInclude) {
            $fieldsToCheck = $alwaysRequiredFields + $articleRequiredFields
        }

        foreach ($field in $fieldsToCheck) {
            $value = Get-FrontmatterField $yaml $field
            if (-not $value) {
                Add-Error $relPath 1 "MISSING_FIELD" "Required field '$field' is missing"
                $fileIssues = $true
            } elseif ($field -eq "ms.topic" -and $value -notin $validTopics) {
                Add-Error $relPath 1 "INVALID_VALUE" "ms.topic '$value' is not valid (expected: $($validTopics -join ', '))"
                $fileIssues = $true
            } elseif ($field -eq "ms.service" -and $value -ne "azure-playfab") {
                Add-Error $relPath 1 "INVALID_VALUE" "ms.service must be 'azure-playfab' (got '$value')"
                $fileIssues = $true
            } elseif ($field -eq "ms.date") {
                $datePattern = '^(0?[1-9]|1[0-2])/(0?[1-9]|[12][0-9]|3[01])/\d{4}$'
                if ($value -notmatch $datePattern) {
                    Add-Error $relPath 1 "INVALID_FORMAT" "ms.date must be in MM/DD/YYYY format (got '$value')"
                    $fileIssues = $true
                } else {
                    $parsedDate = [datetime]::MinValue
                    if (-not [datetime]::TryParseExact($value, [string[]]@('M/d/yyyy','MM/dd/yyyy','M/dd/yyyy','MM/d/yyyy'), [System.Globalization.CultureInfo]::InvariantCulture, [System.Globalization.DateTimeStyles]::None, [ref]$parsedDate)) {
                        Add-Error $relPath 1 "INVALID_DATE" "ms.date '$value' is not a valid calendar date"
                        $fileIssues = $true
                    }
                }
            } elseif ($field -eq "description" -and $value.Length -gt 160) {
                if ($isApiRef) {
                    Add-Warning $relPath 1 "TOO_LONG" "description must be 160 characters or fewer (got $($value.Length) characters)"
                } else {
                    Add-Error $relPath 1 "TOO_LONG" "description must be 160 characters or fewer (got $($value.Length) characters)"
                }
                $fileIssues = $true
            }
        }
    }

    # --- Get body (below frontmatter) ---
    $inFrontmatter = $false
    $frontmatterEnd = 0
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match '^---\s*$') {
            if (-not $inFrontmatter) { $inFrontmatter = $true }
            else { $frontmatterEnd = $i + 1; break }
        }
    }

    # If closing --- delimiter wasn't found, skip body checks to avoid noisy false positives
    if ($frontmatterEnd -eq 0) {
        if (-not $fileIssues) { $cleanFiles.Add($relPath) }
        continue
    }

    # --- Body checks (single pass) ---
    $inCodeBlock = $false
    $codeFenceLen = 0
    $codeFenceChar = ''
    $h1Count = 0
    $h1Text = $null
    $h2Set = @{}
    $lastHeadingLevel = 0
    $titleValue = Get-FrontmatterField $yaml "title"

    for ($i = $frontmatterEnd; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]

        # --- Code fence toggle (handles 3+ backticks/tildes, with optional language suffix) ---
        $fenceMatch = $rxCodeFence.Match($line)
        if ($fenceMatch.Success) {
            $fence = $fenceMatch.Groups[1].Value
            if (-not $inCodeBlock) {
                $inCodeBlock = $true
                $codeFenceLen = $fence.Length
                $codeFenceChar = $fence[0]
                # Warn on bare code blocks (no language specifier)
                $afterFence = $line.Substring($fenceMatch.Index + $fenceMatch.Length).Trim()
                if (-not $afterFence) {
                    Add-Warning $relPath ($i + 1) "BARE_CODE_BLOCK" "Code block has no language specifier — add one (e.g., ``````json, ``````csharp)"
                    $fileIssues = $true
                }
            } elseif ($fence[0] -eq $codeFenceChar -and $fence.Length -ge $codeFenceLen) {
                # Only close if same fence character and at least as many
                $inCodeBlock = $false
            }
            continue
        }
        if ($inCodeBlock) { continue }

        # --- Raw HTML detection (excluding <br> which is legitimate in Learn docs) ---
        $htmlMatch = $rxRawHtml.Match($line)
        if ($htmlMatch.Success) {
            $tag = $htmlMatch.Groups[1].Value
            Add-Error $relPath ($i + 1) "RAW_HTML" "HTML tag <$tag> is not permitted — use standard Markdown syntax"
            $fileIssues = $true
        }

        # --- Missing alt-text ---
        if ($rxEmptyAlt.IsMatch($line)) {
            Add-Warning $relPath ($i + 1) "MISSING_ALT_TEXT" "Image has empty alt-text (needed for accessibility)"
            $fileIssues = $true
        }

        # --- Image path validation ---
        foreach ($im in $rxImageRef.Matches($line)) {
            $imgPath = $im.Groups[2].Value.Trim()
            if ($imgPath -match '^(https?://|data:)') { continue }
            $imgPath = $imgPath -replace '[?#].*$', ''
            $resolvedImg = [System.IO.Path]::GetFullPath((Join-Path $fileDir $imgPath))
            if (-not (Test-PathCached $resolvedImg)) {
                Add-Error $relPath ($i + 1) "BROKEN_IMAGE" "Image file not found: $($im.Groups[2].Value)"
                $fileIssues = $true
            }
        }

        # --- Heading structure ---
        $headingMatch = $rxHeading.Match($line)
        if ($headingMatch.Success) {
            $level = $headingMatch.Groups[1].Value.Length
            $text = $headingMatch.Groups[2].Value.Trim()

            if ($level -eq 1) {
                $h1Count++
                if ($h1Count -eq 1) { $h1Text = $text }
                if ($h1Count -gt 1) {
                    Add-Error $relPath ($i + 1) "DUPLICATE_H1" "Multiple H1 headings found"
                    $fileIssues = $true
                }
            }
            if ($level -eq 2) {
                if ($h2Set.ContainsKey($text)) {
                    Add-Warning $relPath ($i + 1) "DUPLICATE_H2" "Duplicate H2 heading: '$text'"
                    $fileIssues = $true
                }
                $h2Set[$text] = $true
            }
            if ($lastHeadingLevel -gt 0 -and $level -gt $lastHeadingLevel + 1) {
                Add-Warning $relPath ($i + 1) "HEADING_SKIP" "Heading level skipped: H$lastHeadingLevel to H$level"
                $fileIssues = $true
            }
            $lastHeadingLevel = $level
        }

        # --- Cross-repo .md extension check ---
        if ($rxCrossRepoMd.IsMatch($line)) {
            Add-Warning $relPath ($i + 1) "CROSS_REPO_MD_EXTENSION" "Cross-repo link should not end with .md"
            $fileIssues = $true
        }

        # --- Broken internal links ---
        foreach ($lm in $rxMdLink.Matches($line)) {
            $linkTarget = $lm.Groups[2].Value.Trim()
            # Skip external URLs, xref links, mailto, anchors-only
            if ($linkTarget -match '^(https?://|xref:|mailto:|#)') { continue }
            # Skip Learn extensions like [!INCLUDE, [!NOTE, [!div
            if ($lm.Groups[1].Value -match '^!') { continue }
            # Only check .md links
            if ($linkTarget -notmatch '\.md(\?|#|$)') { continue }
            # Strip anchor and query string
            $linkPath = $linkTarget -replace '[?#].*$', ''
            $resolvedPath = [System.IO.Path]::GetFullPath((Join-Path $fileDir $linkPath))
            if (-not (Test-PathCached $resolvedPath)) {
                Add-Error $relPath ($i + 1) "BROKEN_INTERNAL_LINK" "File not found: $linkTarget"
                $fileIssues = $true
            }
        }

        # --- Include reference validation ---
        $includeMatch = $rxInclude.Match($line)
        if ($includeMatch.Success) {
            $includePath = $includeMatch.Groups[1].Value
            $resolvedInclude = [System.IO.Path]::GetFullPath((Join-Path $fileDir $includePath))
            if (-not (Test-PathCached $resolvedInclude)) {
                Add-Error $relPath ($i + 1) "BROKEN_INCLUDE" "Include file not found: $includePath"
                $fileIssues = $true
            }
        }

        # --- Writing style checks (skip blockquote/alert lines and strip inline code) ---
        $isBlockquote = $line -match '^\s*>'
        if (-not $isBlockquote) {
            $styleLine = $rxInlineCode.Replace($line, '')

            if ($rxLatinAbbrev.IsMatch($styleLine)) {
                $abbr = $rxLatinAbbrev.Match($styleLine).Value
                Add-Warning $relPath ($i + 1) "LATIN_ABBREVIATION" "Avoid '$abbr' — use 'for example,', 'that is,', 'and so on', or 'compared to'"
                $fileIssues = $true
            }

            if ($rxSpacedEmDash.IsMatch($styleLine)) {
                Add-Warning $relPath ($i + 1) "SPACED_EM_DASH" "Remove spaces around em dashes — use 'word—word' not 'word — word'"
                $fileIssues = $true
            }

            if ($rxFiller.IsMatch($styleLine)) {
                $word = $rxFiller.Match($styleLine).Groups[1].Value
                Add-Warning $relPath ($i + 1) "FILLER_WORD" "Avoid filler word '$word'"
                $fileIssues = $true
            }

            if ($rxContraction.IsMatch($styleLine)) {
                $phrase = $rxContraction.Match($styleLine).Groups[1].Value
                Add-Warning $relPath ($i + 1) "MISSING_CONTRACTION" "Use a contraction instead of '$phrase'"
                $fileIssues = $true
            }

            if ($rxHyphenPrefix.IsMatch($styleLine)) {
                $hpMatch = $rxHyphenPrefix.Match($styleLine)
                $word = $hpMatch.Value
                $corrected = $word -replace '-', ''
                Add-Warning $relPath ($i + 1) "HYPHENATED_PREFIX" "Remove hyphen — use '$corrected' instead of '$word'"
                $fileIssues = $true
            }
        }
    }

    # --- H1 vs title match (after full scan) ---
    if ($titleValue -and $h1Text -and $h1Text -ne $titleValue) {
        Add-Warning $relPath 0 "H1_TITLE_MISMATCH" "H1 heading '$h1Text' does not match frontmatter title '$titleValue'"
        $fileIssues = $true
    }

    if (-not $fileIssues) { $cleanFiles.Add($relPath) }
}

# --- Validate TOC files ---

foreach ($tocFile in $tocFiles) {
    $relPath = [IO.Path]::GetRelativePath($repoRoot, $tocFile) -replace '\\', '/'
    $tocDir = Split-Path $tocFile -Parent
    $fileIssues = $false
    $tocLines = Get-Content $tocFile

    for ($i = 0; $i -lt $tocLines.Count; $i++) {
        if ($tocLines[$i] -match 'href:\s*(.+)\s*$') {
            $href = $Matches[1].Trim().Trim('"').Trim("'")
            # Strip inline YAML comments (# preceded by whitespace)
            $href = $href -replace '\s+#.*$', ''
            # Strip fragment identifiers
            $href = $href -replace '#.*$', ''

            # Skip external URLs, mailto, and other protocol links
            if ($href -match '^https?://') { continue }
            if ($href -match '^[a-zA-Z]+:') { continue }
            # Skip fragment-only links (href was just #anchor, now empty after strip)
            if (-not $href -or $href -match '^#') { continue }

            # Normalize path separators in href to be OS-agnostic
            $normalizedHref = $href -replace '\\', '/'

            # Handle absolute paths
            if ($normalizedHref.StartsWith('/')) {
                # Only validate paths under /playfab-docs/ — others are cross-repo Learn references
                if ($normalizedHref -notmatch '^/playfab-docs/') { continue }
                $targetPath = Join-Path $repoRoot $normalizedHref.TrimStart('/')
            } else {
                $targetPath = Join-Path $tocDir $normalizedHref
            }

            # Validate .md and .yml files exist on disk
            $ext = [System.IO.Path]::GetExtension($normalizedHref).ToLowerInvariant()
            if ($ext -in @('.md', '.yml')) {
                $targetPath = [System.IO.Path]::GetFullPath($targetPath)
                if (-not (Test-PathCached $targetPath)) {
                    Add-Error $relPath ($i + 1) "BROKEN_TOC_LINK" "File not found: $href"
                    $fileIssues = $true
                }
            }
        }
    }

    if (-not $fileIssues) { $cleanFiles.Add($relPath) }
}

# --- Detect orphaned redirect files ---

$redirectFile = Join-Path $repoRoot ".openpublishing.redirection.json"
if (Test-Path $redirectFile) {
    try {
        $redirectData = Get-Content $redirectFile -Raw | ConvertFrom-Json
        foreach ($redir in $redirectData.redirections) {
            $sourcePath = $redir.source_path
            if (-not $sourcePath) { continue }
            $fullSource = Join-Path $repoRoot ($sourcePath -replace '/', [IO.Path]::DirectorySeparatorChar)
            if (Test-Path $fullSource) {
                $relSource = $sourcePath -replace '\\', '/'
                Add-Warning $relSource 0 "ORPHANED_REDIRECT" "File still exists but is listed in .openpublishing.redirection.json — consider deleting it"
            }
        }
    } catch {
        Write-Warning "Could not parse .openpublishing.redirection.json: $($_.Exception.Message)"
    }
}

# --- Report ---

$totalFiles = $mdFiles.Count + $tocFiles.Count
$totalIssues = $errors.Count + $warnings.Count

Write-Host ""
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host " PlayFab Docs Validation Report" -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Files reviewed: $totalFiles ($($mdFiles.Count) markdown, $($tocFiles.Count) TOC)"
Write-Host "Issues found:   $totalIssues ($($errors.Count) errors, $($warnings.Count) warnings)"
Write-Host ""

if ($errors.Count -gt 0) {
    Write-Host "--- ERRORS (must fix) ---" -ForegroundColor Red
    $grouped = $errors | Group-Object File
    foreach ($group in $grouped) {
        Write-Host "  $($group.Name)" -ForegroundColor White
        foreach ($issue in $group.Group) {
            $lineStr = if ($issue.Line -gt 0) { "line $($issue.Line)" } else { "" }
            Write-Host "    X $($issue.Check) ($lineStr): $($issue.Message)" -ForegroundColor Red
        }
    }
    Write-Host ""
}

if ($warnings.Count -gt 0) {
    Write-Host "--- WARNINGS (should fix) ---" -ForegroundColor Yellow
    $grouped = $warnings | Group-Object File
    foreach ($group in $grouped) {
        Write-Host "  $($group.Name)" -ForegroundColor White
        foreach ($issue in $group.Group) {
            $lineStr = if ($issue.Line -gt 0) { "line $($issue.Line)" } else { "" }
            Write-Host "    ! $($issue.Check) ($lineStr): $($issue.Message)" -ForegroundColor Yellow
        }
    }
    Write-Host ""
}

if ($cleanFiles.Count -gt 0) {
    Write-Host "--- CLEAN FILES ---" -ForegroundColor Green
    foreach ($f in $cleanFiles) {
        Write-Host "    OK $f" -ForegroundColor Green
    }
    Write-Host ""
}

# Exit code
if ($errors.Count -gt 0) {
    Write-Host "RESULT: FAILED ($($errors.Count) errors)" -ForegroundColor Red
    exit 1
} elseif ($warnings.Count -gt 0) {
    Write-Host "RESULT: PASSED WITH WARNINGS ($($warnings.Count) warnings)" -ForegroundColor Yellow
    exit 0
} else {
    Write-Host "RESULT: PASSED" -ForegroundColor Green
    exit 0
}

} finally { Pop-Location } # matches Push-Location at script start
