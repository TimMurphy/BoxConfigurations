param (
    [parameter(Mandatory=$true)]
    [ValidateNotNullOrEmpty()]
    [ValidateScript({If (Test-Path $_ -PathType Leaf) {Return $true} throw "Cannot find '$_'."})] 
    [string] $BoxstarterPackagePath
)

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

Write-Host "Configuring '$env:ComputerName' with '$BoxstarterPackagePath'..."

Assert-IsAdministrator

Import-Module Boxstarter.Chocolatey -Force
Install-BoxstarterPackage -PackageName $BoxstarterPackagePath