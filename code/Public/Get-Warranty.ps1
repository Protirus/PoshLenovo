<#
.SYNOPSIS
  Gets Warranty from Lenovo API.

.DESCRIPTION
  Gets Warranty from Lenovo API.

.PARAMETER <>
    The x of the .

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        0.0.1
  Author:         Alex Hedley
  Creation Date:  19/04/2019
  Release Date:   dd/mm/yyyy
  Purpose/Change: Initial script release
  
.EXAMPLE
  Call '' to

.FUNCTIONALITY
   Get-Warranty is intended to function as a mechanism for getting Warranty information from the Lenovo API.
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

function Get-WarrantyBySerial
{
    <#
    .PARAMETER Serial
        The Serial number of the machine you wish to get data about
    
    .EXAMPLE
        Get-WarrantyBySerial -Serial "abc123"
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
            $resource += "Warranty"
            $method = "GET"
            $query = "Serial=$Serial"

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

function Get-WarrantyBySerials
{
    <#
    .PARAMETER Serial
        The Serial number of the machine you wish to get data about
    
    .EXAMPLE
        Get-WarrantyBySerials -Serials @("abc123","321cba")
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Serials
    )

    Begin
    {}
    Process
    {
        try
        {
            $resource += "Warranty"
            $method = "GET"
            #$query = "Serial=$Serials"
            foreach ($element in $Serials) {
	            $query += "Id=$element&"
            }
            $query = $query.Substring(0, $query.Length-1)

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

function Get-WarrantyById
{
    <#
    .PARAMETER Id
        The Id number of the Warranty you wish to get data about
    
    .EXAMPLE
        Get-WarrantyById -Id "ab1"
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
            $resource += "Warranty/$Id"
            $method = "GET"
            #$query = "ID=$Id"

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource
            #$response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

function Get-WarrantyByIds
{
    <#
    .PARAMETER Ids
        The Id numbers of the Warranties you wish to get data about
    
    .EXAMPLE
        Get-WarrantyByIds -Ids @("ab1","cd2")
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string[]]$Ids
    )

    Begin
    {}
    Process
    {
        try
        {
            $resource += "Warranty"
            $method = "GET"
            #$query = "ID=$Ids"
            foreach ($element in $Ids) {
	            $query += "Id=$element&"
            }
            $query = $query.Substring(0, $query.Length-1)

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

function Get-ContractById
{
    <#
    .PARAMETER Id
        The Id number of the Contract you wish to get data about
    
    .EXAMPLE
        Get-ContractById -Id "ab1"
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
            $resource += "Contract/$Id"
            $method = "GET"
            #$query = "ID=$Id"

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource
            #$response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

#/Version/warrantyoption/{country-code (not required)}?serial={serial-number} or /warrantyoption/{country-code (not required)}?product={machine-type}

function Get-WarrantyOptionsBySerial
{
    <#
    .PARAMETER Serial
        The Serial number of the machine you wish to get data about
    
    .EXAMPLE
        Get-WarrantyOptionsBySerial -Serial "ab1"
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
            $resource += "WarrantyOption"
            $method = "GET"
            $query = "serial=$Serial"

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

function Get-WarrantyOptionsBySerialAndCountryCode
{
    <#
    .PARAMETER Serial
        The Serial number of the machine you wish to get data about
    .PARAMETER CountryCode
        The Country Code of the country you wish to get warranty options for
    
    .EXAMPLE
        Get-WarrantyOptionsBySerialAndCountryCode -Serial "ab1" -CountryCode "GB"
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$Serial,
        [Parameter(Mandatory=$true)]
        [string]$CountryCode
    )

    Begin
    {}
    Process
    {
        try
        {
            $resource += "WarrantyOption/$CountryCode"
            $method = "GET"
            $query = "serial=$Serial"

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

#machine-type
function Get-WarrantyOptionsByMachineType
{
    <#
    .PARAMETER MachineType
        The Machine Type of the machine you wish to get warranty options for
    
    .EXAMPLE
        Get-WarrantyOptionsByMachineType -MachineType "Laptop"
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$MachineType
    )

    Begin
    {}
    Process
    {
        try
        {
            $resource += "WarrantyOption"
            $method = "GET"
            $query = "product=$MachineType"

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Log-Message $Error.item(0) Debug
        }
        finally
        {}
    }
    End
    {}
}

function Get-WarrantyOptionsByMachineTypeAndCountryCode
{
    <#
    .PARAMETER MachineType
        The Machine Type of the machine you wish to get warranty options for
    .PARAMETER CountryCode
        The Country Code of the country you wish to get warranty options for
    
    .EXAMPLE
        Get-WarrantyOptionsByMachineTypeAndCountryCode -MachineType "Laptop" -CountryCode "GB"
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$MachineType,
        [Parameter(Mandatory=$true)]
        [string]$CountryCode
    )

    Begin
    {}
    Process
    {
        try
        {
            $resource += "WarrantyOption/$CountryCode"
            $method = "GET"
            $query = "product=$MachineType"

            $response = Invoke-LenovoApiRequest -Method $method -Resource $resource -Query $query
            return $response
        }
        catch
        {
            Log-Message $Error.item(0) Debug
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
#endregion Execution