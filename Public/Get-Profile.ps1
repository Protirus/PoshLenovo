<#
.SYNOPSIS
  Gets Profile Object from Lenovo API.

.DESCRIPTION
  Gets Profile Object from Lenovo API.

.PARAMETER <>
    The x of the .

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        0.0.1
  Author:         Alex Hedley
  Creation Date:  11/08/2019
  Release Date:   dd/mm/yyyy
  Purpose/Change: Initial script release
  
.EXAMPLE
  Call '' to

.FUNCTIONALITY
   Get-Profile is intended to function as a mechanism for getting Profile Object from the Lenovo API.
#>

#=================== Dependencies ==========================
. Join-Path $PSScriptRoot ".\Private\logging.ps1"
. Join-Path $PSScriptRoot ".\Private\Invoke-LenovoApiRequest.ps1"
#=================== Dependencies ==========================

#region Initialisations
#---------------------------------------------------------[Initialisations]--------------------------------------------------------
#endregion Initialisations

#region Declarations
#----------------------------------------------------------[Declarations]----------------------------------------------------------
#endregion Declarations

#region Modules
#------------------------------------------------------------[Modules]-------------------------------------------------------------
#endregion Modules

#region Functions
#-----------------------------------------------------------[Functions]------------------------------------------------------------

function Get-Profile
{
  <#
  .PARAMETER Type
      The Type number of the Profile
  
  .EXAMPLE
      Get-Profile -Type "#Type#" eSupport.Domain.Profile+Personal or eSupport.Domain
  #>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [string]$Type
  )

  Begin
  {}
  Process
  {
    try
    {
      $resource += "Profile"
      $method = "GET"
      
      $query = $Type
      #$query = "eSupport.Domain.Profile+Personal"
      #$query = "eSupport.Domain"

      $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
      return $response
    }
    catch
    {
      Write-Error $Error.item(0)
      #Log-Message $Error.item(0) Debug
    }
    finally
    {}
  }
  End
  {}
}

#endregion Functions

#region Execution
#-----------------------------------------------------------[Execution]------------------------------------------------------------
$type = "eSupport.Domain.Profile+Personal"
#$type = "eSupport.Domain"
$response = Get-Profile -Type $type
$response

#endregion Execution