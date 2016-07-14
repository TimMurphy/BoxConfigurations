# This file can be run as is but it's usually better to run with Boxstarter

$ErrorActionPreference = "Stop"
$WarningPreference = "SilentlyContinue"
$VerbosePreference = "SilentlyContinue"

Function Assert-IsAdministrator
{
    $currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())

    If (-Not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))
    {
        throw "Script must be run in Administrator mode."
    }
}

Assert-IsAdministrator

choco feature enable -n=allowGlobalConfirmation
choco upgrade all
# Installing all packages in one call improves Chocolatey's warnings re existing packages.
choco install Boxstarter Boxstarter.Azure Boxstarter.HyperV git git-credential-manager-for-windows GitPad kdiff3 poshgit SourceTree
