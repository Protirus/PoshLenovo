$PrivateFunctions = Get-ChildItem -Path $PSScriptRoot\Private\*.ps1
$PublicFunctions = Get-ChildItem -Path $PSScriptRoot\Public\*.ps1

foreach ($file in @($PrivateFunctions + $PublicFunctions)) {
    try {
        . $file.fullname
    }
    catch {
        Write-Error -Message ('Failed to import: [{0}]' -f $file.fullname)
    }
}