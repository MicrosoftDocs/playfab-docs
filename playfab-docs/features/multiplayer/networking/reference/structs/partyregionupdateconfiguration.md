---
author: jdeweyMSFT
title: "PartyRegionUpdateConfiguration"
description: "The configuration used by the Party library to control how it performs automatic region discovery and connection quality measurement updates."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/30/2024
---

# PartyRegionUpdateConfiguration  

The configuration used by the Party library to control how it performs automatic region discovery and connection quality measurement updates.  

## Syntax  
  
```cpp
struct PartyRegionUpdateConfiguration {  
    PartyRegionUpdateMode mode;  
    uint32_t refreshIntervalInSeconds;  
}  
```
  
### Members  
  
**`mode`** &nbsp; [PartyRegionUpdateMode](../enums/partyregionupdatemode.md)  
  
The mode controlling when region discovery and connection quality measurement updates are performed.
  
The default value is [PartyRegionUpdateMode::Immediate](../enums/partyregionupdatemode.md) when [PartyOption::RegionUpdateConfiguration](../enums/partyoption.md) hasn't been configured.
  
**`refreshIntervalInSeconds`** &nbsp; uint32_t  
  
The number of seconds allowed to elapse after region quality measurements complete before a new region discovery and connection quality measurement process may begin.
  
This refresh interval is used whenever a [PartyRegionsChangedStateChange](partyregionschangedstatechange.md) is provided to determine when the next region quality measurement is eligible to start under the update mode defined by the *mode* field. <br /><br /> Becoming eligible for a refresh doesn't guarantee that the refresh begins at that exact time. If the *mode* field is set to [PartyRegionUpdateMode::Deferred](../enums/partyregionupdatemode.md), the next refresh doesn't happen until one of the applicable methods is called to trigger a region update. The library also waits until the local device is no longer in any Party networks and applies a small amount of randomized delay to try to avoid PlayFab service load from multiple, unintentionally synchronized devices.   <br /><br /> The default value is 28800 (8 hours) when [PartyOption::RegionUpdateConfiguration](../enums/partyoption.md) hasn't been configured.   <br /><br /> A value of zero causes the Party library to never automatically refresh measurements in the future. Otherwise, the minimum allowed value is 30 seconds.
  
## Remarks  
  
This structure can be used together with [PartyOption::RegionUpdateConfiguration](../enums/partyoption.md) to either override or query the Party library's current configuration via [PartyManager::SetOption()](../classes/PartyManager/methods/partymanager_setoption.md) or [PartyManager::GetOption()](../classes/PartyManager/methods/partymanager_getoption.md) respectively. It configures the behavior of the region discovery and connection quality measurement process that produces [PartyRegionsChangedStateChange](partyregionschangedstatechange.md) state changes.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyOption::RegionUpdateConfiguration](../enums/partyoption.md)  
[PartyRegionUpdateMode](../enums/partyregionupdatemode.md)  
[PartyRegionsChangedStateChange](partyregionschangedstatechange.md)  
[PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md)  
[PartyManager::GetOption](../classes/PartyManager/methods/partymanager_getoption.md)
  
  
