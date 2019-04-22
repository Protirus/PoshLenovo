# PoshLenovo

![Language: PowerShell](https://img.shields.io/badge/language-powershell-blue.svg)
![Tag: Lenovo](https://img.shields.io/badge/tag-lenovo-red.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![GitHub contributors](https://img.shields.io/github/contributors/AlexHedley/PoshLenovo.svg)](https://GitHub.com/AlexHedley/PoshLenovo/graphs/contributors/)
[![GitHub issues](https://img.shields.io/github/issues/AlexHedley/PoshLenovo.svg)](https://GitHub.com/AlexHedley/PoshLenovo/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/AlexHedley/PoshLenovo.svg)](https://GitHub.com/AlexHedley/PoshLenovo/issues?q=is%3Aissue+is%3Aclosed) | [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)


A PowerShell module for [Lenovo](https://www.lenovo.com/gb/en/) API.

---

The [eSupport WebAPI](http://supportapi.lenovo.com/Documentation/Index.html) Documentation has also been added to the [WIKI](https://github.com/AlexHedley/PoshLenovo/wiki)

---

You will need to contact either contact your 'Lenovo Account Representative' or maybe the 'Lenovo Partner Program': http://www.lenovo.com/partners/ to obtain a "ClientId".

---

### Example

#### Setup

Need to create it's own function

```powershell
$lenovoApiKeyName = "LENOVO_API_KEY"
$lenovoApiKey = "##ADD YOUR API KEY HERE##"
[Environment]::SetEnvironmentVariable($lenovoApiKeyName, $lenovoApiKey, "Machine")
```

```powershell
$global:ApiKey = [Environment]::GetEnvironmentVariable($lenovoApiKeyName, "Machine")
```

#### Warranty

```powershell
$Serial = "##YOUR SERIAL NUMBER##"
$warranty = Get-WarrantyBySerial -Serial $Serial
```

```powershell
$Serials = @("#x#","#y#")
$warranties = Get-WarrantyBySerials -Serials $Serials
```

```powershell
$WarrantyId = "#ID#"
$warranty = Get-WarrantyById -Id $WarrantyId
```

```powershell
$WarrantyIds = @("#a#","#b#")
$warranties = Get-WarrantyByIds -Ids $WarrantyIds
```

```powershell
$ContractId
$contract = Get-ContractById -Id $ContractId
```

```powershell
$Serial = "##YOUR SERIAL NUMBER##"
$warrantyoptions = Get-WarrantyOptionsBySerial -Serial $Serial
```

This will return all the Countries to get the CountryCode for a subsequent request.

```powershell
$Serial = "##YOUR SERIAL NUMBER##"
$CountryCode = "GB"
$warrantyoptions = Get-WarrantyOptionsBySerialAndCountryCode -Serial $Serial -CountryCode $CountryCode
```

> Need to work out the different **Machine Types**

```powershell
$MachineType = "Laptop"
$warrantyoptions = Get-WarrantyOptionsByMachineType -MachineType $MachineType
```

```powershell
$MachineType = "Laptop"
$CountryCode = "GB"
$warrantyoptions = Get-WarrantyOptionsByMachineTypeAndCountryCode -MachineType $MachineType -CountryCode $CountryCode
```

---

### Plain Powershell Example

#### Warranty

```powershell
$serial = "Add you Serial Number here"
$apikey = "Add your ClientId here"

$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("ClientID", $apikey)
 
$warranty = Invoke-RestMethod http://supportapi.lenovo.com/v2.5/warranty?serial=$serial -ContentType "application/JSON" -Headers $headers
$warranty
```

To get your Serial number run the following in Command Prompt (PC)

```bash
WMIC BIOS GET SERIALNUMBER
```

Terminal (Mac)

- `system_profiler SPHardwareDataType | awk '/Serial/ {print $4}'`
- `ioreg -l | awk '/IOPlatformSerialNumber/ { print $4;}'`
- `system_profiler |grep "Serial Number (system)"`
- `system_profiler |grep "r (system)"`

---

### Alternatives

- https://pcsupport.lenovo.com/gb/en/warrantylookup/
- https://pcsupport.lenovo.com/gb/en/warrantylookup/batchquery

There are also a number of scripts which post data to the above website but the API is a cleaner way to do this.
