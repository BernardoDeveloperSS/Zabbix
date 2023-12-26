param(
	[String]$dbuser="dss",
	[String]$dbpasswd="dss88340566",
	[String]$procedure="ss_sp_PBX_nagios",
	[String]$dbname="db_discador_ss",
	[String]$arguments="LICENCA"
)

if ($dbpasswd -and $arguments) {
	try {
		$RETURN=Invoke-Sqlcmd -Query "exec $procedure $arguments" -Database $dbname -U $dbuser -Password $dbpasswd -QueryTimeout 2 -ErrorAction 'Stop' 
		$EXITCODE,$STATE,$MSG=$RETURN.status.split("-,_")
		
		if ($STATE -match 'OK') {
			write-output "0"
		} else {
			write-output "1"
		}
	} catch {
		write-output "ERROR"
	}
} else {
	write-output "ERROR"
}
