# Full path is required when boxstarter decides to reboot machine
$boxstarterScript = Resolve-Path "BuildServer.config"

Remove-Module Boxstarter.Chocolatey -ErrorAction SilentlyContinue
Import-Module Boxstarter.Chocolatey -ErrorAction Stop
Install-BoxstarterPackage $boxstarterScript -ErrorAction Stop