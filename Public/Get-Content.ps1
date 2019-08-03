<#
.SYNOPSIS
  Gets Content Object from Lenovo API.

.DESCRIPTION
  Gets Content Object from Lenovo API.

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
   Get-Content is intended to function as a mechanism for getting Content Object from the Lenovo API.
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

function Get-Content
{
    <#
    .PARAMETER Id
        The Id number of the #
    
    .EXAMPLE
        Get-Content -Id "#ID#"
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
            $resource += "Content"
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

#endregion Functions

#region Execution
#-----------------------------------------------------------[Execution]------------------------------------------------------------
$response = Get-Content -Id "#ID#"
$response

#endregion Execution