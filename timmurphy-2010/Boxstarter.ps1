param (
    [Parameter(Mandatory=$true)]
    [string]
    $boxstarterScript
 )

If (!(Test-Path $boxstarterScript)) {
    throw "Cannot find boxstarterScript '$boxstarterScript'."
}

# Full path is required when boxstarter decides to reboot machine
$boxstarterScript = Resolve-Path $boxstarterScript

Remove-Module Boxstarter.Chocolatey -ErrorAction SilentlyContinue
Import-Module Boxstarter.Chocolatey -ErrorAction Stop

$credential = Get-Credential tim@26tp.com

Install-BoxstarterPackage $boxstarterScript -Credential $credential -ErrorAction Stop