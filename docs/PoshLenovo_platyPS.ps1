Install-Module -Name platyPS -Scope CurrentUser
Import-Module platyPS

#Import-Module MyAwesomeModule
#Import-Module PoshLenovo
Import-Module -Name $PSScriptRoot\..\code\PoshLenovo -verbose
#New-MarkdownHelp -Module MyAwesomeModule -OutputFolder .\docs
New-MarkdownHelp -Module PoshLenovo -OutputFolder $PSScriptRoot

#New-ExternalHelp .\docs -OutputPath en-US\
New-ExternalHelp $PSScriptRoot -OutputPath $PSScriptRoot\..\code\en-US\

#Import-Module MyAwesomeModule -Force
Import-Module PoshLenovo -Force
#Update-MarkdownHelp .\docs
Update-MarkdownHelp $PSScriptRoot