param(
	[String]$dbuser = "dss",
	[String]$dbpasswd = "dss88340566",
	[String]$procedure = "ss_sp_PBX_nagios",
	[String]$dbname,
	[String]$arguments
)

if (!(Get-Command Invoke-Sqlcmd)) {
	write-output "ALERTA - Atualizar para PowerShell >4"
	Exit(1)
}

if ($dbpasswd -and $arguments) {
	try {
		$RETURN = Invoke-Sqlcmd -Query "exec $procedure '$arguments'" -Database $dbname -U $dbuser -Password $dbpasswd -QueryTimeout 2 -ErrorAction 'Stop' 
		$EXITCODE, $STATE, $MSG = $RETURN.status.split("-,_")
		
		if ($STATE.Trim() -eq "OK") {
			write-output ""
		}
		else {
			write-output "$MSG"
		}
	}
	catch {
		write-output "Falha para executar"
	}
}
else {
	write-output "Usuário e/ou senha inválido"
}