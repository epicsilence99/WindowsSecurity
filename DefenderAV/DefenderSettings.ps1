#############################################################################################################
## THIS SCRIPT CHECKS YOUR MICROSOFT DEFENDER SETTINGS AND PROVIDES RELATED URLS FOR FURTHER INFO          ##
## IT WILL OUTPUT RESULTS TO C:\Windows\Temp as DefenderSettings.txt                                       ##
## V1.0                                                                                                    ##
## Author @lkuik                                                                                           ##
#############################################################################################################

# The following is a list of items that will be checked:
#    - Is Defender AV enabled?
#    - Is real-time protection enabled?
#    - Is your defender settings tamper protected?
#    - Is MAPS enabled to get cloud-delivered protection?
#    - Is the MAPS setting and sample submission set to basic, or advanced / submit safe samples or all samples
#    - Is my machine able to talk to MAPS?
#    - IS Block at first site enabled? (BAFS)
#    - Is my signature defintions updating?
#    - Where are the updates coming from?

# Setting log file variables

$filepath = "C:\Windows\Temp"
$filename = "DefenderSettings.txt"

# Set Defender AV Enabled Variable and check value to write to file
$DefenderAVEnabled = Get-MpComputerStatus | Select-Object -ExpandProperty AntispywareEnabled

Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "DEFENDER AV ENABLED" >> $filepath\$filename
Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVEnabled" >> $filepath\$filename
Write-Output "If value false, please see https://docs.microsoft.com/en-us/mem/intune/user-help/turn-on-defender-windows" >> $filepath\$filename

# Set Defender Real-time Protection Variable and check value to write to file
$DefenderAVRTP = Get-MpComputerStatus | Select-Object -ExpandProperty RealTimeProtectionEnabled

Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "DEFENDER Real-time Protection Enabled" >> $filepath\$filename
Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVRTP" >> $filepath\$filename
Write-Output "If not enabled, please see https://docs.microsoft.com/en-us/mem/intune/user-help/turn-on-defender-windows or check if you have 3rd party AV enabled, as if another product is controlling Real-time protection Defender will move RTP into passive mode, see here: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/microsoft-defender-antivirus-compatibility#:~:text=In%20passive%20mode%2C%20you%20can%20still%20manage%20updates,up-to-date%20third-party%20product%20providing%20real-time%20protection%20from%20malware." >> $filepath\$filename

# Set Tamper protection variable and check value to write to file
$DefenderAVTP = Get-MpComputerStatus | Select-Object -ExpandProperty IsTamperProtected

Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "DEFENDER Tamper Protection" >> $filepath\$filename
Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "Accepted value can only be true or false, CURRENT VALUE: $DefenderAVTP" >> $filepath\$filename
Write-Output "If value false, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/prevent-changes-to-security-settings-with-tamper-protection#:~:text=%20Protect%20security%20settings%20with%20tamper%20protection%20,bigger%20cyberattacks.%20Bad%20actors%20try%20to...%20More%20" >> $filepath\$filename

# Set Defender AV MAPS Variable and check value to write to file
$DefenderAVMAPS = Get-MpPreference | Select-Object -ExpandProperty MAPSReporting

Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "DEFENDER MAPS Enabled" >> $filepath\$filename
Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "Accepted values are 0(disabled), 1(basic), 2(advanced) CURRENT VALUE: $DefenderAVMAPS" >> $filepath\$filename
Write-Output "Learn more here: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus" >> $filepath\$filename

# Set Defender AV MAPS file submission Variable and check value to write to file
$DefenderAVMAPSfiles = Get-MpPreference | Select-Object -ExpandProperty SubmitSamplesConsent

Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "DEFENDER MAPS file submissions" >> $filepath\$filename
Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "Accepted values are 0(Always prompt), 1(send safe samples), 2(never send), 3(send all samples) CURRENT VALUE: $DefenderAVMAPSfiles" >> $filepath\$filename
Write-Output "Learn more here: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/enable-cloud-protection-microsoft-defender-antivirus" >> $filepath\$filename

# Set Defender AV ability to connect to MAPS variable and check value to write to file

cd "C:\Program Files\Windows Defender"
$DefenderAVMAPSConnection = .\MpCmdRun.exe -ValidateMapsConnection

Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "DEFENDER MAPS Connection" >> $filepath\$filename
Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "CURRENT VALUE: $DefenderAVMAPSConnection" >> $filepath\$filename
Write-Output "Learn more here: https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-network-connections-microsoft-defender-antivirus#validate-connections-between-your-network-and-the-cloud" >> $filepath\$filename

# Set Defender AV Bock at first sight (BAFS) Variable and check value to write to file
$DefenderAVBAFSEnabled = Get-MpPreference | Select-Object -ExpandProperty DisableBlockAtFirstSeen

Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "DEFENDER AV BAFS" >> $filepath\$filename
Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "Accepted value can only be true or false, false indicating it is enabled CURRENT VALUE: $DefenderAVBAFSEnabled" >> $filepath\$filename
Write-Output "If value true, please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-block-at-first-sight-microsoft-defender-antivirus" >> $filepath\$filename

# Set Defender AV Signature Last Updated Variable and check value to write to file
$DefenderAVSigRecentlyUpdated = Get-MpComputerStatus | Select-Object -ExpandProperty AntivirusSignatureAge

Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "DEFENDER AV Last Signature Update" >> $filepath\$filename
Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "If updated within last the last day value will show 0, and for every day it hasn't updated the counter will move up from 0 CURRENT VALUE: $DefenderAVSigRecentlyUpdated" >> $filepath\$filename

# Set Defender AV Updating mechanism variable and check value to write to file
$DefenderAVUpdateMechanism = Get-MpPreference| Select-Object -ExpandProperty SignatureFallBackOrder

Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "DEFENDER AV Update Mechanism" >> $filepath\$filename
Write-Output "=========================================================================" >> $filepath\$filename
Write-Output "This value will show the priority of mechanism used to deliver AV updates. CURRENT VALUE: $DefenderAVUpdateMechanism" >> $filepath\$filename
Write-Output "Please see https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/manage-protection-updates-microsoft-defender-antivirus for more information" >> $filepath\$filename