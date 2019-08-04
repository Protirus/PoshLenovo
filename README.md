# PoshLenovo

![Language: PowerShell](https://img.shields.io/badge/language-powershell-blue.svg)
![Tag: Lenovo](https://img.shields.io/badge/tag-lenovo-red.svg)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) | [![GitHub contributors](https://img.shields.io/github/contributors/AlexHedley/PoshLenovo.svg)](https://GitHub.com/Protirus/PoshLenovo/graphs/contributors/)
[![GitHub issues](https://img.shields.io/github/issues/Protirus/PoshLenovo.svg)](https://GitHub.com/AlexHedley/PoshLenovo/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/Protirus/PoshLenovo.svg)](https://GitHub.com/AlexHedley/PoshLenovo/issues?q=is%3Aissue+is%3Aclosed) | [![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)


A PowerShell module for [Lenovo](https://www.lenovo.com/gb/en/) API.

---

The [eSupport WebAPI](http://supportapi.lenovo.com/Documentation/Index.html) Documentation has also been added to the [WIKI](https://github.com/AlexHedley/PoshLenovo/wiki)

---

You will need to contact either contact your 'Lenovo Account Representative' or maybe the 'Lenovo Partner Program': http://www.lenovo.com/partners/ to obtain a "ClientId".

---

## Module Build Status

| Branch | AzurePipelines CI                              |
|--------|------------------------------------------------|
| dev    | ![Azure Build Status: Dev][ap-image-dev]       |
| master | ![Azure Build Status: Master][ap-image-master] |

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

---

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
$ContractId = "#ID#"
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

#### Catalog

```powershell
$response = Get-Catalog -IncludeFutureProducts $true
$response
#$response = Get-Catalog
#$response
```

```powershell
$response = Get-Catalog-Raw -IncludeFutureProducts $true
$response
#$response = Get-Catalog-Raw
#$response
```

```powershell
$response = Get-Catalog-All -IncludeFutureProducts $true
$response
#$response = Get-Catalog-All
#$response
```

```powershell
$response = Get-Catalog-Children -IncludeFutureProducts $true
$response
#$response = Get-Catalog-Children
#$response
```

```powershell
$ProductID = "CELL-PHONES"
$response = Get-Catalog-Children -ProductID $ProductID -IncludeFutureProducts $true
$response
#$response = Get-Catalog-Children -ProductID $ProductID
#$response
```

---

#### Product

```powershell
$Serial = "##YOUR SERIAL NUMBER##"
$response = Get-Product -Serial $Serial
$response
```

---

#### Content

```powershell
$Id = "##ID##"
$response = Get-Content -Id $Id
$response
```

---

#### Support

##### Service Requests

```powershell
$ServiceRequestId = "##ServiceRequestId##"
$Serial = "##YOUR SERIAL NUMBER##"
$response = Get-Support-ServiceRequests -ServiceRequestId $ServiceRequestId -Serial $Serial
$response
```

##### Service Orders

```powershell
$Serial = "##YOUR SERIAL NUMBER##"
$response = Get-Support-ServiceOrders -Serial $Serial
$response
```

---

#### Part

```powershell
$Id = "##ID##"
$response = Get-Part -Id "#ID#"
$response
```

```powershell
$Ids = @("1","2")
$response = Get-PartByIds -Ids $Ids
$response
```

---

#### Accessory

```powershell
$Id = "##ID##"
$response = Get-Accessory -Id "#ID#"
$response
```

```powershell
$Ids = @("1","2")
$response = Get-AccessoryByIds -Id $Ids
$response
```

```powershell
$ProductId = "##ProductId##"
$response = Get-AccessoryForProduct -ProductId "#ProductId#"
$response
```

```powershell
$Serial = "##Serial##"
$response = Get-AccessoriesFromSerial -Serial "#Serial#"
$response
```

---

#### Provider

```powershell
$ProductId = "##ProductId##"
$CountryCode = "##CountryCode##"
$Serial = "##Serial##"
$Coordinates = "##Coordinates##"
$response = Get-Provider-ServiceProviders -ProductId "ProductID" -CountryCode "CountryCode" -Serial "SerialNumber" -Coordinates "Coordinates"
#$response = Get-Provider-ServiceProviders -Serial "SerialNumber"
$response
```

---

#### Contacts

```powershell
$ProductId = "##ProductId##"
$CountryCode = "##CountryCode##"
$Serial = "##Serial##"
$Coordinates = "##Coordinates##"
$response = Get-Contacts-SupportContacts
 -ProductId "ProductID" -CountryCode "CountryCode" -Serial "SerialNumber" -Coordinates "Coordinates"
#$response = Get-Contacts-SupportContacts -Serial "SerialNumber"
$response
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

## Links

- [GitHub Repository](https://github.com/Protirus/PoshLenovo)
- [Website](https://www.protirus.com/)

[ap-image-dev]: https://protirus.visualstudio.com/PoshLenovo/_apis/build/status/Protirus.PoshLenovo?branchName=dev
[ap-site-dev]: https://dev.azure.com/dscottraynsford/GitHub/_build/latest?definitionId=4
[ap-image-master]: https://protirus.visualstudio.com/PoshLenovo/_apis/build/status/Protirus.PoshLenovo?branchName=master
[ap-site-master]: https://dev.azure.com/dscottraynsford/GitHub/_build/latest?definitionId=4