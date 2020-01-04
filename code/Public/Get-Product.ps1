<#
.SYNOPSIS
  Gets Product Information from Lenovo API.

.DESCRIPTION
  Gets Product Information from Lenovo API.

.PARAMETER <>
    The x of the .

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        0.0.1
  Author:         Alex Hedley
  Creation Date:  28/07/2019
  Release Date:   dd/mm/yyyy
  Purpose/Change: Initial script release
  
.EXAMPLE
  Call '' to

.FUNCTIONALITY
   Get-Product is intended to function as a mechanism for getting Product Information from the Lenovo API.
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

function Get-Product
{
    <#
    .PARAMETER Serial
        The Serial number of the machine you wish to get data about
    
    .EXAMPLE
        Get-Product -Serial "#SERIAL#"
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
            $resource += "Product"
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
$response = Get-Product -Serial "#SERIAL#"
$response

#endregion Execution