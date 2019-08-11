<#
.SYNOPSIS
  Gets Case Object from Lenovo API.

.DESCRIPTION
  Gets Case Object from Lenovo API.

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
   Get-Case is intended to function as a mechanism for getting Case Object from the Lenovo API.
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

function Get-Case
{
  <#
  .PARAMETER Id
      The Id number of the Case
  
  .EXAMPLE
      Get-Case -Id "#ID#"
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
      $resource += "Case"
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

#Case?ID=xx
#Case?ID=xx,yy

function Get-CasesByIds
{
  <#
  .PARAMETER Cases
    The Id number(s) of the cases you wish to get data about
  
  .EXAMPLE
    Get-CasesByIds -Ids @("1","2")
  #>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$Cases
  )

  Begin
  {}
  Process
  {
    try
    {
      $resource += "Case"
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

#Case?Serial=xx

function New-Case
{
  <#
  .PARAMETER content
      The data to create the case
  
  .EXAMPLE
      New-Case -content @{}
  #>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [object]$Case
  )

  Begin
  {}
  Process
  {
    try
    {
      $resource += "Case"
      $method = "POST"
      
      $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Content $Case
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
$response = Get-Case -Id "#ID#"
$response

$response = Get-CasesByIds -Ids @("1","2")
$response

$response = New-Case -Case @{}
$response

#endregion Execution