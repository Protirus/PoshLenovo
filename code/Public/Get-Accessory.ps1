<#
.SYNOPSIS
  Gets Accessory Object from Lenovo API.

.DESCRIPTION
  Gets Accessory Object from Lenovo API.

.PARAMETER <>
    The x of the .

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        0.0.1
  Author:         Alex Hedley
  Creation Date:  04/08/2019
  Release Date:   dd/mm/yyyy
  Purpose/Change: Initial script release
  
.EXAMPLE
  Call '' to

.FUNCTIONALITY
   Get-Accessory is intended to function as a mechanism for getting Accessory Object from the Lenovo API.
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

function Get-Accessory
{
  <#
  .PARAMETER Id
    The Id number of the Accessory
  
  .EXAMPLE
    Get-Accessory -Id "#ID#"
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
      $resource += "Accessory"
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

function Get-AccessoryByIds
{
  <#
  .PARAMETER AccessoryIds
    The Id number(s) of the Accessories you wish to get data about
  
  .EXAMPLE
    Get-AccessoryByIds -Ids @("1","2")
  #>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [string[]]$AccessoryIds
  )

  Begin
  {}
  Process
  {
    try
    {
      $resource += "Accessory"
      $method = "GET"
      #$query = "Id=$AccessoryIds"
      #Accessory?ID=ID1&ID=ID2
      foreach ($element in $AccessoryIds) {
        $query += "ID=$element&"
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

#POST /Accessory with the data containing a comma separated list of IDs

#/Accessory with parameter Product=ProductID or Serial=SerialNumber[.MachineType]
function Get-AccessoryForProduct
{
  <#
  .PARAMETER ProductId
    The ProductId number of the Accessory
  
  .EXAMPLE
    Get-AccessoryForProduct -ProductId "#ProductId#"
  #>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [string]$ProductId
  )

  Begin
  {}
  Process
  {
    try
    {
      $resource += "Accessory"
      $method = "GET"
      $query += "ProductId=$ProductId"
      
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

function Get-AccessoriesFromSerial
{
  <#
  .PARAMETER Serial
    The Serial number of the item, i.e. Computer
  
  .EXAMPLE
    Get-AccessoriesFromSerial -Serial "#Serial#"
  #>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory=$true)]
    [string]$ProductId
  )

  Begin
  {}
  Process
  {
    try
    {
      $resource += "Accessory"
      $method = "GET"
      $query += "Serial=$Serial"
      
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
$response = Get-Accessory -Id "#ID#"
$response

$response = Get-AccessoryByIds -Ids @("1","2")
$response

$response = Get-AccessoryForProduct -ProductId "#ProductId#"
$response

$response = Get-AccessoriesFromSerial -Serial "#Serial#"
$response

#endregion Execution