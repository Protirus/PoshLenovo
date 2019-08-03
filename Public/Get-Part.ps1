<#
.SYNOPSIS
  Gets Part Object from Lenovo API.

.DESCRIPTION
  Gets Part Object from Lenovo API.

.PARAMETER <>
    The x of the .

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        0.0.1
  Author:         Alex Hedley
  Creation Date:  03/08/2019
  Release Date:   dd/mm/yyyy
  Purpose/Change: Initial script release
  
.EXAMPLE
  Call '' to

.FUNCTIONALITY
   Get-Part is intended to function as a mechanism for getting Part Object from the Lenovo API.
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

function Get-Part
{
  <#
  .PARAMETER Id
      The Id number of the Part
  
  .EXAMPLE
      Get-Part -Id "#ID#"
  #>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [string]$Id
  )

  Begin
  {}
  Process
  {
    try
    {
      $resource += "Part"
      $method = "GET"
      $resource += "/$Id"
      
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

#Part?ID=xx
#Part?ID=xx,yy

function Get-PartByIds
{
  <#
  .PARAMETER Serial
    The Id number(s) of the parts you wish to get data about
  
  .EXAMPLE
    Get-PartByIds -Ids @("1","2")
  #>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$Parts
  )
  
  Begin
  {}
  Process
  {
    try
    {
      $resource += "Part"
      $method = "GET"
      #$query = "Id=$Parts"
      foreach ($element in $Parts) {
        $query += "Id=$element&"
      }
      $query = $query.Substring(0, $query.Length-1)

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

#Part?Product=xx or /Part?Serial=xx

#endregion Functions

#region Execution
#-----------------------------------------------------------[Execution]------------------------------------------------------------
$response = Get-Part -Id "#ID#"
$response

$response = Get-PartByIds -Ids @("1","2")
$response

#endregion Execution