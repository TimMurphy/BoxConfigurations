param (
    [Parameter(Mandatory=$true)]
    [string]
    $boxstarterScript
 )

If (!(Test-Path $boxstarterScript)) {
    throw "Cannot find boxstarterScript '$boxstarterScript'."
}

Remove-Module Boxstarter.Chocolatey -ErrorAction SilentlyContinue
Import-Module C:\Users\Admin\AppData\Roaming\Boxstarter\Boxstarter.Chocolatey -ErrorAction Stop
Install-BoxstarterPackage $boxstarterScript -ErrorAction Stop