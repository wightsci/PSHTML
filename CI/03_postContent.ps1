#Post Content

$ScriptPath = Split-Path -Path $MyInvocation.MyCommand.Path

New-Alias -Name Include -Value 'Get-PSHTMLTemplate' -Description "Include parts of PSHTML documents using Templates" -Force

$ConfigFile = Join-Path -Path $ScriptPath -ChildPath "pshtml.configuration.json"

#Setting module variables
    $Script:PSHTML_CONFIGURATION = Get-ConfigurationDocument -Path $ConfigFile -Force
    $Script:Logfile = $Script:PSHTML_CONFIGURATION.GetDefaultLogFilePath()
    $Script:Logger = [Logger]::New($Script:LogFile)