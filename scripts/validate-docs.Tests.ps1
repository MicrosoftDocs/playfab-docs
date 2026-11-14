$ErrorActionPreference = 'Stop'
$validator = Join-Path $PSScriptRoot 'validate-docs.ps1'
$fixture = Join-Path $PSScriptRoot ".validate-docs-image-tests-$PID.md"
$image = '../playfab-docs/data-analytics/export-data/media/create-data-connection.png'
$shell = (Get-Process -Id $PID).Path
$header = @'
---
title: Image validation tests
description: Regression tests for image paths with optional quoted titles.
author: test
ms.author: test
ms.date: 11/13/2026
ms.topic: article
ms.service: azure-playfab
---

# Image validation tests

'@

if (Test-Path $fixture) { throw "Fixture already exists: $fixture" }
if (-not (Test-Path (Join-Path $PSScriptRoot $image))) {
    throw 'The existing test image must be checked out before running these tests.'
}

try {
    $valid = @(
        "![Existing image]($image)"
        "![Existing image]($image `"Create Data Connection`")"
        "![Existing image]($image 'Create Data Connection')"
        "![Existing image]($image `"Connection (PNG)`")"
    )
    [IO.File]::WriteAllText($fixture, $header + "`n" + ($valid -join "`n"))
    $output = (& $shell -NoProfile -File $validator -Path $fixture 2>&1) -join "`n"
    if ($LASTEXITCODE -ne 0 -or $output -match 'BROKEN_IMAGE') {
        throw "Existing images with optional titles were rejected:`n$output"
    }

    $missing = @(
        '![Missing image](missing-plain.png)'
        '![Missing image](missing-double.png "Missing image")'
        "![Missing image](missing-single.png 'Missing image')"
    )
    [IO.File]::WriteAllText($fixture, $header + "`n" + (($valid + $missing) -join "`n"))
    $output = (& $shell -NoProfile -File $validator -Path $fixture 2>&1) -join "`n"
    if ($LASTEXITCODE -ne 1 -or ([regex]::Matches($output, 'BROKEN_IMAGE')).Count -ne 3) {
        throw "Expected exactly three genuine missing-image errors:`n$output"
    }
    foreach ($name in @('plain', 'double', 'single')) {
        if ($output -notmatch "Image file not found: missing-$name\.png") {
            throw "Missing $name image was not rejected:`n$output"
        }
    }
    Write-Output 'PASS: four existing-image forms accepted; three missing-image forms rejected.'
} finally {
    if (Test-Path $fixture) { Remove-Item -LiteralPath $fixture -Force }
}
exit 0
