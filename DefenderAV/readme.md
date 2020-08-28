## Purpose
DefenderAV is a collection of useful powershell scripts relating to Defender AV (local client)

## DefenderSettings.ps1
The purpose of this powershell file is to check your Defender settings and output the values to a file in the directory you run the script from.
It will run interactively so you can track the progress, and has error checking enabled for admin rights, and also will check if Defender AV is enabled. If either the script is not running as admin, or Defender AV is disabled it will terminate the script with a warning.

Download file with powershell:
`Invoke-WebRequest https://raw.githubusercontent.com/lkuik/WindowsSecurity/master/DefenderAV/DefenderSettings.ps1 -OutFile .\defendersettings.ps1`
To run the file in powershell:
`powershell  -ExecutionPolicy Bypass -File .\defendersettings.ps1`

An example of a succesful run will look like the below:
![](./images/SuccessScript.png?)

An example of the script failing the pre-requisite check for admin rights would look like below:
![](./images/AdminCheckFailed.PNG?)
