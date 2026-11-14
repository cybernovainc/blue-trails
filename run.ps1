$ErrorActionPreference = 'Stop'
$flutter = Join-Path $env:USERPROFILE 'develop\flutter\bin\flutter.bat'
if (!(Test-Path -LiteralPath $flutter)) {
    throw 'Flutter is missing from your user develop folder.'
}
Push-Location $PSScriptRoot
try {
    & $flutter run -d edge
} finally {
    Pop-Location
}
