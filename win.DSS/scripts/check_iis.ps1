$IIS=get-service w3svc
if ( $IIS -eq $null ) {
	Write-Output "Servico não encontrado"
} else {
	Write-Output ""
}
