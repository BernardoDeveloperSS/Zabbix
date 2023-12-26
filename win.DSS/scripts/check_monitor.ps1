$process = Get-Process -Name DSS_Monitor -ErrorAction SilentlyContinue

if ($null -ne $process) {
    Write-Host "0"
}
else {
    Write-Host "1"
}