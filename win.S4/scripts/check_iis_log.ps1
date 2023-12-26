$LOG_ENABLED = (get-WebConfigurationProperty -PSPath "IIS:\" -filter "system.webServer/httpLogging" -name dontLog).Value
if ( $LOG_ENABLED ) {
    Write-Output ""
    Exit (0)
}
else {
    Write-Output "CRITICAL - Log habilitado"
    Exit (2)
}