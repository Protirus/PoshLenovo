<#
.SYNOPSIS
  Gets Contact Object from Lenovo API.

.DESCRIPTION
  Gets Contact Object from Lenovo API.

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
   Get-Contact is intended to function as a mechanism for getting Contact Object from the Lenovo API.
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

function Get-Contact-SupportContacts
{
    <#
    .PARAMETER ProductId
      The ProductId of the Product you wish to get data about
    
    .PARAMETER CountryCode
      The Country Code of the # you wish to get data about
    
    .PARAMETER Serial
      The Serial number of the machine you wish to get data about
    
    .PARAMETER Coordinates
      The Coordinates of the # you wish to get data about
    
    .EXAMPLE
      Get-Contact-SupportContacts -ProductId "ProductID" -CountryCode "CountryCode" -Serial "SerialNumber" -Coordinates "Coordinates"
      Get-Contact-SupportContacts -Serial "SerialNumber"
    #>

    [CmdletBinding()]
    param(
      [Parameter(Mandatory=$false)]
      [string]$ProductId,
      [Parameter(Mandatory=$false)]
      [string]$CountryCode,
      [Parameter(Mandatory=$false)]
      [string]$Serial,
      [Parameter(Mandatory=$false)]
      [string]$Coordinates
    )

    Begin
    {}
    Process
    {
      try
      {
        $resource += "SupportContacts"
        $method = "GET"
        #$query = "?product=$ProductId&country=$CountryCode&serial=$Serial&coordinates=$coordinates"

        $args = @()
        if ($ProductId) {
          $args += "product=$ProductId"
        }
        if ($CountryCode) {
          $args += "country=$CountryCode"
        }
        if ($Serial) {
          $args += "serial=$Serial"
        }
        if ($coordinates) {
          $args += "coordinates=$coordinates"
        } 

        $query = $args -join '&'
        
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
$response = Get-Contact-SupportContacts
$response

$response = Get-Contact-SupportContacts -ProductId "ProductID" -CountryCode "CountryCode" -Serial "SerialNumber" -Coordinates "Coordinates"
$response

$response = Get-Contact-SupportContacts -Serial "SerialNumber"
$response

#endregion Execution