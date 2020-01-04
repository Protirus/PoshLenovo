<#
.SYNOPSIS
  Gets Support Information (Service Requests / Service Orders) from Lenovo API.

.DESCRIPTION
  Gets Support Information (Service Requests / Service Orders) from Lenovo API.

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
   Get-Support-ServiceRequest / Get-Support-ServiceOrder are intended to function as a mechanism for getting Support Info from the Lenovo API.
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

function Get-Support-ServiceRequest
{
    <#
    .PARAMETER ServiceRequestId
      The Service Request Id of the Service Request
    
    .PARAMETER Serial
      The Serial number of the item in the Service Request
    
    .EXAMPLE
      Get-Support-ServiceRequest -ServiceRequestId "#ServiceRequestId#" -Serial "#SERIAL#"
    #>

    [CmdletBinding()]
    param(
      [Parameter(Mandatory=$true)]
      [string]$ServiceRequestId,
      [Parameter(Mandatory=$true)]
      [string]$Serial
    )

    Begin
    {}
    Process
    {
      try
      {
        $resource += "ServiceRequests"
        $method = "GET"
        $resource += "/$ServiceRequestId/$Serial"
        
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

function Get-Support-ServiceOrder
{
    <#
    .PARAMETER Serial
      The Serial number of the item in the Service Order
    
    .EXAMPLE
      Get-Support-ServiceOrder -Serial "#SERIAL#"
    #>

    [CmdletBinding()]
    param(
      [Parameter(Mandatory=$true)]
      [string]$Serial
    )

    Begin
    {}
    Process
    {
      try
      {
        $resource += "ServiceOrders"
        $method = "GET"
        $resource += "/$Serial"
        
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
$response = Get-Support-ServiceRequest -ServiceRequestId "#ServiceRequestId#" -Serial "#SERIAL#"
$response

$response = Get-Support-ServiceOrder -Serial "#SERIAL#"
$response

#endregion Execution