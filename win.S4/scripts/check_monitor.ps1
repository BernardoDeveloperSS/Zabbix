param(
    [string]$ServiceName
)

$service = Get-Service -Name $ServiceName

if ($service.Status -eq 'Running') {
    Write-Host ""
}
else {
    Write-Host "Serviço está parado :/"
}