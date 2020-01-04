# https://stefanstranger.github.io/2018/12/30/UseAzurePipelinesToPublishPowerShellModule/
# https://raw.githubusercontent.com/stefanstranger/psjwt/master/bootstrap.ps1

using namespace Microsoft.PowerShell.Commands
[CmdletBinding()]
param(
    #
    [ValidateSet("CurrentUser", "AllUsers")]
    $Scope = "CurrentUser"
)
[ModuleSpecification[]]$RequiredModules = Import-LocalizedData -BaseDirectory $PSScriptRoot -FileName RequiredModules
$Policy = (Get-PSRepository PSGallery).InstallationPolicy
Set-PSRepository PSGallery -InstallationPolicy Trusted
try {
    $RequiredModules | Install-Module -Scope $Scope -Repository PSGallery -SkipPublisherCheck -Verbose
}
finally {
    Set-PSRepository PSGallery -InstallationPolicy $Policy
}
$RequiredModules | Import-Module