<#
.SYNOPSIS
  Logging

.DESCRIPTION
  Script to log information to a file.

.PARAMETER <>
    The x of the .

.INPUTS
  <Inputs if any, otherwise state None>

.OUTPUTS
  <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>

.NOTES
  Version:        1.0.0
  Author:         Alex Hedley
                  Protirus UK Ltd
                  info@protirus.com
  Creation Date:  01/04/2019
  Release Date:   dd/mm/yyyy
  Purpose/Change: Initial script release
  
.EXAMPLE
  Call '' to 
#>

#region Declarations
#----------------------------------------------------------[Declarations]----------------------------------------------------------

Enum LogSource
{
    Audit = 0
    Debug = 1
}

#endregion Declarations

#region Functions
#-----------------------------------------------------------[Functions]------------------------------------------------------------

Function Log-Message
{
    <#
    .PARAMETER message
        The message you wish to add to the Logs.
    .PARAMETER authority
        The authority LogSource.
    
    .EXAMPLE
        Log-Message "Hello" Debug 
    #>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory=$true)]
        [string]$message,
        
        [Parameter(Mandatory=$true)]
        [LogSource]$authority
    )

    Begin
    {
        #Write-Debug ("Starting {0} " -f $MyInvocation.MyCommand)
    }

    Process
    {
        try
        {
            $fileExists = [System.IO.File]::Exists($LogFile)

            if (!$fileExists)
            {
                Write-Host -ForegroundColor DarkGreen "Log file not found, creating new file"

                $directoryExists = [System.IO.Directory]::Exists($LogFilePath)

                if (!$directoryExists)
                {
                    New-Item -Force -ItemType directory -Path $LogFilePath
                }

                New-Item -Path $LogFilePath -Name $LogFileName
            }
            
            $LogFileMessage = "[$authority][$(Get-Date -Format "yyy:MM:dd HH:mm:ss")][$($env:UserName)] $message"

            Write-Host $LogFileMessage

            Out-File -FilePath $Logfile -Append -Force -InputObject $LogFileMessage
        }
        catch
        {
            Write-Error $Error.item(0)
        }
    }

    End
    {
        #Write-Debug ("Ending {0} " -f $MyInvocation.MyCommand)
    }
}

#endregion Functions