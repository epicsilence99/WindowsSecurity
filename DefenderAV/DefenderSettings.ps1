# Setting log file variables
$systemname = $env:computername 
$fileoutputdir = "C:\Windows\Temp" 
$filename = "DefenderSettings.txt"

# Checking to see if script is being run as administrator

If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`

    [Security.Principal.WindowsBuiltInRole] “Administrator”))

{
    Write-Output "============================================" >> $fileoutputdir\$systemname$filename
    Write-Output "WARNING! WARNING! WARNING! WARNING! WARNING!" >> $fileoutputdir\$systemname$filename
    Write-Output "============================================" >> $fileoutputdir\$systemname$filename
    Write-output “YOU DID NOT RUN THIS SCRIPT AS ADMINISTRATOR. FOR ACCURATE RESULTS WITH MAPS CONNECTIVITY PLEASE RUN SCRIPT AGAIN AS ADMIN " >> $fileoutputdir\$systemname$filename

}

# Set Defender AV Enabled variable and check value to write to file
$DefenderAVEnabled = Get-MpComputerStatus | Select-Object -ExpandProperty AntispywareEnabled

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV Enabled" >> $fileoutputdir\$systemname$filename                           
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVEnabled" >> $fileoutputdir\$systemname$filename
Write-Output "If value false, please see https://docs.microsoft.com/en-us/mem/intune/user-help/turn-on-defender-windows" >> $fileoutputdir\$systemname$filename

# Set Defender Real-time Protection variable and check value to write to file
$DefenderAVRTP = Get-MpComputerStatus | Select-Object -ExpandProperty RealTimeProtectionEnabled

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER Real-time Protection Enabled" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVRTP" >> $fileoutputdir\$systemname$filename
Write-Output "If value false, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-real-time-protection-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV Ioav at variable and check value to write to file
$DefenderAVIoavProtection = Get-MpComputerStatus | Select-Object -ExpandProperty IoavProtectionEnabled

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV Ioav Enabled" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVIoavProtection" >> $fileoutputdir\$systemname$filename
Write-Output "If value false, please see https://docs.microsoft.com/en-us/previous-versions/windows/desktop/defender/msft-mpcomputerstatus" >> $fileoutputdir\$systemname$filename

# Set Defender AV Behavior Monitoring variable and check value to write to file
$DefenderAVBehaviorMonitoring = Get-MpComputerStatus | Select-Object -ExpandProperty BehaviorMonitorEnabled

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV Behavior Monitoring Enabled" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted value can only be true or false,  CURRENT VALUE: $DefenderAVBehaviorMonitoring" >> $fileoutputdir\$systemname$filename
Write-Output "If value false, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-block-at-first-sight-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV Behavior Monitoring variable and check value to write to file
$DefenderAVOnAccessProtection = Get-MpComputerStatus | Select-Object -ExpandProperty OnAccessProtectionEnabled

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV On-access Enabled" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted value can only be true or false,  CURRENT VALUE: $DefenderAVOnAccessProtection" >> $fileoutputdir\$systemname$filename
Write-Output "If false, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-real-time-protection-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV Network Protection variable and check value to write to file
$DefenderAVNetworkProtection = Get-MpPreference | Select-Object -ExpandProperty EnableNetworkProtection

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV Network Inspection" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted values can be 1 (enabled block mode) 2 (Audit mode), 0 (off) CURRENT VALUE: $DefenderAVNetworkProtection" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-atp/network-protection" >> $fileoutputdir\$systemname$filename

# Set Defender AV Tamper Protection variable and check value to write to file
$DefenderAVTP = Get-MpComputerStatus | Select-Object -ExpandProperty IsTamperProtected

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER Tamper Protection" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVTP" >> $fileoutputdir\$systemname$filename
Write-Output "If value false, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/prevent-changes-to-security-settings-with-tamper-protection#:~:text=%20Protect%20security%20settings%20with%20tamper%20protection%20,bigger%20cyberattacks.%20Bad%20actors%20try%20to...%20More%20" >> $fileoutputdir\$systemname$filename

# Set Defender AV PUA variable and check value to write to file
$DefenderAVPUA = Get-MpPreference | Select-Object -ExpandProperty PUAProtection

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER PUA Enabled" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted values can be 0 (not configured or disabled), 1 (block mode), 2 (audit mode) CURRENT VALUE: $DefenderAVPUA" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/detect-block-potentially-unwanted-apps-microsoft-defender-antivirus#:~:text=%20Use%20Group%20Policy%20to%20configure%20PUA%20protection,Block%20to%20block%20potentially%20unwanted%20applications%2C...%20More%20" >> $fileoutputdir\$systemname$filename

# Set Defender AV MAPS variable and check value to write to file
$DefenderAVMAPS = Get-MpPreference | Select-Object -ExpandProperty MAPSReporting

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER MAPS Enabled" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted values can be 0(disabled), 1(basic), 2(advanced) CURRENT VALUE: $DefenderAVMAPS" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV MAPS file submission variable and check value to write to file
$DefenderAVMAPSfiles = Get-MpPreference | Select-Object -ExpandProperty SubmitSamplesConsent

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER MAPS file submissions" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted values can be 0(Always prompt), 1(send safe samples), 2(never send), 3(send all samples) CURRENT VALUE: $DefenderAVMAPSfiles" >> $fileoutputdir\$systemname$filename
Write-Output "For more info see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV Cloud protection level variable and check value to write to file
$DefenderAVCloudBlockLevel = Get-MpPreference | Select-Object -ExpandProperty CloudBlockLevel

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV CloudBlockLevel" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted values can be Default (0), Moderate(1), High (2), High+(4), and Zero teolerance(6) are CURRENT VALUE: $DefenderAVCloudBlockLevel" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/specify-cloud-protection-level-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV ability to connect to MAPS variable and check value to write to file

cd "C:\Program Files\Windows Defender"
$DefenderAVMAPSConnection = .\MpCmdRun.exe -ValidateMapsConnection

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER MAPS Connection" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "CURRENT VALUE: $DefenderAVMAPSConnection" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-network-connections-microsoft-defender-antivirus#validate-connections-between-your-network-and-the-cloud" >> $fileoutputdir\$systemname$filename

# Set Defender AV Block at first sight (BAFS) variable and check value to write to file
$DefenderAVBAFSDisabled = Get-MpPreference | Select-Object -ExpandProperty DisableBlockAtFirstSeen

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV BAFS Disabled" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVBAFSDisabled" >> $fileoutputdir\$systemname$filename
Write-Output "If value true, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-block-at-first-sight-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV Signature Last Updated variable and check value to write to file
$DefenderAVSigRecentlyUpdated = Get-MpComputerStatus | Select-Object -ExpandProperty AntivirusSignatureAge

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV Last Signature Update" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "If updated within last the last day value will show 0, and for every day it hasnt updated the counter will move up from 0 CURRENT VALUE: $DefenderAVSigRecentlyUpdated" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/manage-protection-update-schedule-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV Updating mechanism variable and check value to write to file
$DefenderAVSigUpdateFrequencyDays = Get-MpPreference| Select-Object -ExpandProperty SignatureScheduleDay

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV SigUpdate Scheduled Check Frequency in days" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted values can be Every day(0), 1(Sunday), 2(Monday), 3(Tuesday), 4(Wednesday), 5(Thursday), 6(Friday), 7(Saturday), 8(never) CURRENT VALUE: $DefenderAVSigUpdateFrequencyDays" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/manage-protection-update-schedule-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV Updating mechanism variable and check value to write to file
$DefenderAVSigUpdateInterval = Get-MpPreference| Select-Object -ExpandProperty SignatureUpdateInterval

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV SigUpdate frequency on day specified" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted values can be 1 (every hour) through 24 (once a day), CURRENT VALUE: $DefenderAVSigUpdateInterval" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/manage-protection-update-schedule-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender AV Updating mechanism variable and check value to write to file

$DefenderAVUpdateMechanism = Get-MpPreference| Select-Object -ExpandProperty SignatureFallBackOrder

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV Update Mechanism" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "This value will show the priority of mechanism used to deliver AV updates. CURRENT VALUE: $DefenderAVUpdateMechanism" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/manage-protection-updates-microsoft-defender-antivirus for more information" >> $fileoutputdir\$systemname$filename

# Set Defender Scan variable to see what type of scan is used, and write value to file

$DefenderAVTypeofScan = Get-MpPreference| Select-Object -ExpandProperty ScanParameters

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV Type of Scan" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted value can only be Quick scan which is default(1), or Full scan(2) CURRENT VALUE: $DefenderAVTypeofScan" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/scheduled-catch-up-scans-microsoft-defender-antivirus for more information" >> $fileoutputdir\$systemname$filename

# Set Defender Scan variable to see how often scan is run in days and write value to file

$DefenderAVScanFrequency = Get-MpPreference| Select-Object -ExpandProperty ScanScheduleDay

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV Scan frequency in days" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "Accepted values can be Every day(0), 1(Sunday), 2(Monday), 3(Tuesday), 4(Wednesday), 5(Thursday), 6(Friday), 7(Saturday), 8(never) CURRENT VALUE: $DefenderAVScanFrequency" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/scheduled-catch-up-scans-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename

# Set Defender Scan variable to see how often scan is run in days and write value to file

$DefenderAVScanTime = Get-MpPreference| Select-Object -ExpandProperty ScanScheduleTime

Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "DEFENDER AV Scan Time" >> $fileoutputdir\$systemname$filename
Write-Output "=========================================================================" >> $fileoutputdir\$systemname$filename
Write-Output "The time value is set as the number of minutes past midnight, so for example 120 value would be 02:00 AM scan. CURRENT VALUE: $DefenderAVScanTime" >> $fileoutputdir\$systemname$filename
Write-Output "For more info please see: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/scheduled-catch-up-scans-microsoft-defender-antivirus" >> $fileoutputdir\$systemname$filename
