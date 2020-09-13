# Set file name variable
$filename = "DefenderExclusions.txt"
$filepath = pwd

# Setting ErrorAction Preference
$ErrorActionPreference = "Stop"

# Show execution of script has started
Write-host "Script has started....." -ForegroundColor Green
Start-Sleep -s 2

# Show script is running pre-requisite checks
Write-Host "Running pre-requisite checks....."
Start-Sleep -s 2

# Check to see script is being run as administrator to as it's required to see exclusions
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

# Start writing exclusions to file....
Write-host "Starting to write Defender exclusions to file....."

# path exclusions 
$DefenderExclusionsPath = Get-MpPreference | Select-Object -ExpandProperty ExclusionPath
Write-Output "Defender Path Exclusions:" >> $filename
Write-output $DefenderExclusionsPath >> $filename `r`n

# process exclusions
$DefenderExclusionsProcess = Get-MpPreference | Select-Object -ExpandProperty ExclusionProcess
Write-Output "Defender Process Exclusions:" >> $filename
Write-output "$DefenderExclusionsProcess" >> $filename `r`n

# extensions exclusions
$DefenderExclusionsExtension = Get-MpPreference | Select-Object -ExpandProperty ExclusionExtension
Write-Output "Defender Extension Exclusions:" >> $filename
Write-output "$DefenderExclusionsExtension" >> $filename `r`n
Write-host "Exclusions added to file" -ForegroundColor Green

Start-Sleep -Seconds 5

# Where to find how to configure exclusions for Defender AV
Write-Output "Where can I learn more?:" >> $filename 
Write-Output "To learn more how to configure each type of exclusion visit https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-extension-file-exclusions-microsoft-defender-antivirus" >> $filename
Write-Host "To learn more how to configure each type of exclusion visit https://docs.microsoft.com/en-us/windows/security/threat-protection/microsoft-defender-antivirus/configure-extension-file-exclusions-microsoft-defender-antivirus"
Start-Sleep -Seconds 5

# Writing output is complete and where to find the file
Write-host "Script completed, you can find the output of the file located at $pwd\$filename" -ForegroundColor Green
