# Helpers

# Get / Set an Env variable to use in the script/module.

$lenovoApiKeyName = "LENOVO_API_KEY"
$lenovoApiKey = "abc"
[Environment]::SetEnvironmentVariable($lenovoApiKeyName, $lenovoApiKey, "Machine")
[Environment]::GetEnvironmentVariable($lenovoApiKeyName, "Machine")