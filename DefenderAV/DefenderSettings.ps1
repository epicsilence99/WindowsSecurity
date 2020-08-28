# Set file name variable
$filename = "DefenderSettings.txt"
$filepath = pwd

# Setting ErrorAction Preference
$ErrorActionPreference = "Stop"

# Show execution of script has started
Write-host "Script has started....." -ForegroundColor Green
Start-Sleep -s 2

# Show script is running pre-requisite checks
Write-Host "Running pre-requisite checks....."
Start-Sleep -s 2

# Check to see if script is being run as administrator and error out if script is running as admin
Write-Host "Checking for elevated permissions....."
Start-Sleep -s 2 
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] “Administrator”)) {
Write-Warning "Script is not being run as administrator. Open powershell as administrator and run the script again."
Break
}
else {
Write-Host "Script is being run as administrator." -ForegroundColor Green
}
Start-Sleep -s 2

# Set variable to see if Defender AV is enabled on machine and error out if it's not 
$DefenderAv = Get-MpComputerStatus | Select-Object -ExpandProperty AntispywareEnabled
Write-Host "Checking if Defender AV is enabled....."
Start-Sleep -s 2
If ($DefenderAv -ne 'true') {
Write-Warning "Defender AV is not currently enabled. Please enable Defender AV and run the script again"
Break
}
else {
Write-Host "Defender AV is enabled." -ForegroundColor Green
}

Start-Sleep -Seconds 2

# checks complete
Write-Host "Pre-requisite checks complete" -ForegroundColor Green

Start-Sleep -Seconds 2

# Start checking Defender settings....

Write-host "Starting to write Defender settings to file....."
Start-Sleep -Seconds 10

# Set Defender Real-time Protection variable and check value to write to file
$DefenderAVRTP = Get-MpComputerStatus | Select-Object -ExpandProperty RealTimeProtectionEnabled

Write-Output "Defender Realtime Protection Enabled" >> $filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVRTP" >> $filename 
Write-Output "If value false, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-real-time-protection-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV Ioav at variable and check value to write to file
$DefenderAVIoavProtection = Get-MpComputerStatus | Select-Object -ExpandProperty IoavProtectionEnabled

Write-Output "DEFENDER Ioav Enabled" >> $filename 
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVIoavProtection" >> $filename 
Write-Output "If value false, please see https://docs.microsoft.com/en-us/previous-versions/windows/desktop/defender/msft-mpcomputerstatus" `r`n >> $filename

# Set Defender AV Behavior Monitoring variable and check value to write to file
$DefenderAVBehaviorMonitoring = Get-MpComputerStatus | Select-Object -ExpandProperty BehaviorMonitorEnabled

Write-Output "DEFENDER Behavior Monitoring Enabled" >> $filename  
Write-Output "Accepted value can only be true or false,  CURRENT VALUE: $DefenderAVBehaviorMonitoring" >> $filename  
Write-Output "If value false, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-real-time-protection-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV Behavior Monitoring variable and check value to write to file
$DefenderAVOnAccessProtection = Get-MpComputerStatus | Select-Object -ExpandProperty OnAccessProtectionEnabled

Write-Output "DEFENDER On-access Enabled" >> $filename   
Write-Output "Accepted value can only be true or false,  CURRENT VALUE: $DefenderAVOnAccessProtection" >> $filename
Write-Output "If value false, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-real-time-protection-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV Behavior Monitoring variable and check value to write to file
$DefenderAVNetworkProtection = Get-MpPreference | Select-Object -ExpandProperty EnableNetworkProtection

Write-Output "DEFENDER Network Inspection Enabled" >> $filename 
Write-Output "Accepted values can be 1 (enabled, block mode) 2 (Audit mode), 0 (off) CURRENT VALUE: $DefenderAVNetworkProtection" >> $filename
Write-Output "For more info see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-atp/network-protection" `r`n >> $filename 

# Set Tamper protection variable and check value to write to file
$DefenderAVTP = Get-MpComputerStatus | Select-Object -ExpandProperty IsTamperProtected

Write-Output "DEFENDER Tamper Protection Enabled" >> $filename  
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVTP" >> $filename
Write-Output "If value false, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/prevent-changes-to-security-settings-with-tamper-protection#:~:text=%20Protect%20security%20settings%20with%20tamper%20protection%20,bigger%20cyberattacks.%20Bad%20actors%20try%20to...%20More%20" `r`n >> $filename 

# Set Tamper protection variable and check value to write to file
$DefenderAVPUA = Get-MpPreference | Select-Object -ExpandProperty PUAProtection

Write-Output "DEFENDER PUA Enabled" >> $filename
Write-Output "Accepted values can be 0 (not configured or disabled), 1 (block mode), 2 (audit mode) CURRENT VALUE: $DefenderAVPUA" >> $filename
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/detect-block-potentially-unwanted-apps-microsoft-defender-antivirus#:~:text=%20Use%20Group%20Policy%20to%20configure%20PUA%20protection,Block%20to%20block%20potentially%20unwanted%20applications%2C...%20More%20" `r`n >> $filename 

# Set Defender AV MAPS variable and check value to write to file
$DefenderAVMAPS = Get-MpPreference | Select-Object -ExpandProperty MAPSReporting
 
Write-Output "DEFENDER MAPS Enabled" >> $filename
Write-Output "Accepted values can be 0(disabled), 1(basic), 2(advanced) CURRENT VALUE: $DefenderAVMAPS" >> $filename 
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV MAPS file submission variable and check value to write to file
$DefenderAVMAPSfiles = Get-MpPreference | Select-Object -ExpandProperty SubmitSamplesConsent

Write-Output "DEFENDER MAPS file submissions" >> $filename 
Write-Output "Accepted values can be 0(Always prompt), 1(send safe samples), 2(never send), 3(send all samples) CURRENT VALUE: $DefenderAVMAPSfiles" >> $filename 
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV Cloud protection level variable and check value to write to file
$DefenderAVCloudBlockLevel = Get-MpPreference | Select-Object -ExpandProperty CloudBlockLevel

Write-Output "DEFENDER AV CloudBlockLevel" >> $filename 
Write-Output "Accepted values can be Default (0), Moderate(1), High (2), High+(4), and Zero teolerance(6) are CURRENT VALUE: $DefenderAVCloudBlockLevel" >> $filename
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/specify-cloud-protection-level-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV ability to connect to MAPS variable and check value to write to file
$DefenderAVMAPSConnection = & "C:\Program Files\Windows Defender\MpcmdRun.exe" -validatemapsconnection

Write-Output "DEFENDER MAPS Connection" >> $filename 
Write-Output "CURRENT VALUE: $DefenderAVMAPSConnection" >> $filename 
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-network-connections-microsoft-defender-antivirus#validate-connections-between-your-network-and-the-cloud" `r`n >> $filename 

# Set Defender AV Block at first sight (BAFS) variable and check value to write to file
$DefenderAVBAFSDisabled = Get-MpPreference | Select-Object -ExpandProperty DisableBlockAtFirstSeen

Write-Output "DEFENDER AV BAFS Disabled" >> $filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVBAFSDisabled" >> $filename 
Write-Output "If value true, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-block-at-first-sight-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV Signature Last Updated variable and check value to write to file
$DefenderAVSigRecentlyUpdated = Get-MpComputerStatus | Select-Object -ExpandProperty AntivirusSignatureAge

Write-Output "DEFENDER AV Last Signature Update" >> $filename
Write-Output "If updated within last the last day value will show 0, and for every day it hasn't updated the counter will move up from 0 CURRENT VALUE: $DefenderAVSigRecentlyUpdated" >> $filename 
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/manage-protection-update-schedule-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV Updating mechanism variable and check value to write to file
$DefenderAVSigUpdateFrequencyDays = Get-MpPreference| Select-Object -ExpandProperty SignatureScheduleDay

Write-Output "DEFENDER AV SigUpdate Scheduled Check Frequency in days" >> $filename
Write-Output "Accepted values can be Every day(0), 1(Sunday), 2(Monday), 3(Tuesday), 4(Wednesday), 5(Thursday), 6(Friday), 7(Saturday), 8(never) CURRENT VALUE: $DefenderAVSigUpdateFrequencyDays" >> $filename 
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/manage-protection-update-schedule-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV Updating mechanism variable and check value to write to file
$DefenderAVSigUpdateInterval = Get-MpPreference| Select-Object -ExpandProperty SignatureUpdateInterval

Write-Output "DEFENDER AV SigUpdate frequency on day specified" >> $filename
Write-Output "Accepted values can be 1-24 (1 being check every hour, 24 being once a day, and anything other specified between) CURRENT VALUE: $DefenderAVSigUpdateInterval" >> $filename 
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/manage-protection-update-schedule-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender AV Updating mechanism variable and check value to write to file

$DefenderAVUpdateMechanism = Get-MpPreference| Select-Object -ExpandProperty SignatureFallBackOrder

Write-Output "DEFENDER AV Update Mechanism" >> $filename 
Write-Output "This value will show the priority of mechanism used to deliver AV updates. CURRENT VALUE: $DefenderAVUpdateMechanism" >> $filename 
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/manage-protection-updates-microsoft-defender-antivirus for more information" `r`n >> $filename

# Set Defender Scan variable to see what type of scan is used, and write value to file

$DefenderAVTypeofScan = Get-MpPreference| Select-Object -ExpandProperty ScanParameters

Write-Output "DEFENDER AV Type of Scan" >> $filename
Write-Output "Accepted values are Quick scan which is default(1), or Full scan(2) CURRENT VALUE: $DefenderAVTypeofScan" >> $filename
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/scheduled-catch-up-scans-microsoft-defender-antivirus for more information" `r`n >> $filename 

# Set Defender Scan variable to see how often scan is run in days and write value to file

$DefenderAVScanFrequency = Get-MpPreference| Select-Object -ExpandProperty ScanScheduleDay

Write-Output "DEFENDER AV Scan frequency in days" >> $filename
Write-Output "Accepted values can be Every day(0), 1(Sunday), 2(Monday), 3(Tuesday), 4(Wednesday), 5(Thursday), 6(Friday), 7(Saturday), 8(never) CURRENT VALUE: $DefenderAVScanFrequency" >> $filename 
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/scheduled-catch-up-scans-microsoft-defender-antivirus" `r`n >> $filename 

# Set Defender Scan variable to see how often scan is run in days and write value to file

$DefenderAVScanTime = Get-MpPreference| Select-Object -ExpandProperty ScanScheduleTime

Write-Output "DEFENDER AV Scan Time" >> $filename 
Write-Output "The time value is set as the number of minutes past midnight, so for example 120 value would be 02:00 AM scan. CURRENT VALUE: $DefenderAVScanTime" >> $filename
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/scheduled-catch-up-scans-microsoft-defender-antivirus" >> $filename

# Writing output is complete and where to find the file
Write-host "Script completed, you can find the output of the file located at $pwd\$filename" -ForegroundColor Green