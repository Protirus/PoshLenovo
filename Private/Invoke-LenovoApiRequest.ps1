<#
.SYNOPSIS
  API Wrapper for Lenovo API.

.DESCRIPTION
  API Wrapper for Lenovo API.
  Creating a Powershell module as an API wrapper
  https://rudimartinsen.com/2018/01/31/creating-a-powershell-module-as-an-api-wrapper/

.PARAMETER <>
    The x of the .

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        0.0.1
  Author:         Alex Hedley
  Creation Date:  22/04/2019
  Release Date:   dd/mm/yyyy
  Purpose/Change: Initial script release
  
.EXAMPLE
  Call '' to

.FUNCTIONALITY
   Invoke-LenovoApiRequest is intended to function as a mechanism for calling the Lenovo API endpoints.
#>
function Invoke-LenovoApiRequest {
    [cmdletbinding()]
    param(
        [parameter(Mandatory=$true)]
        $Resource,
        $Query,
        $Content,
        $Method = "GET"
    )

    #if ([string]::IsNullOrEmpty($global:ApiKey)) {            
    #    Write-Host "Please set your APIKEY in your env" -ForegroundColor White -BackgroundColor Red
    #    Exit  
    #}

    #$Scheme = "https"
    #$Version = "v2.5"
    #$ServerUrl = "SupportAPI.lenovo.com"
    $baseUrl = "https://SupportAPI.lenovo.com/v2.5/"

    $headers = @{
        "ClientID" = "$global:ApiKey";
        #"Content-Type" = 'application/json';
        "Accept" = 'application/json';
        "Accept-Language" = 'en';
    }

    if ($Query) {
        $Q = "?" + $Query
        $uri = $baseUrl + $Resource + $Q
    }
    else {
        $uri = $baseUrl + $Resource
    }

    if ($Method -eq "POST") {
        $body = $Content
    }

    try {
        Invoke-RestMethod -Method $Method -Uri $uri -Headers $headers -Body $body
    } catch {
        Log-Message $Error.item(0) Debug
    }
}