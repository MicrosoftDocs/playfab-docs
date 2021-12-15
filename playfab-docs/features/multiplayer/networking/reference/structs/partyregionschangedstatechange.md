---
author: jdeweyMSFT
title: "PartyRegionsChangedStateChange"
description: "Information specific to the *RegionsChanged* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyRegionsChangedStateChange  

Information specific to the *RegionsChanged* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyRegionsChangedStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
} PartyRegionsChangedStateChange  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates whether a background operation to query the list of supported regions and the latency to each region Succeeded, or provides the reason that it failed.
  
On success, the region list provided by [PartyManager::GetRegions()](../classes/PartyManager/methods/partymanager_getregions.md) will be populated with the results of the operation. On failure, the region list provided by PartyManager::GetRegions() will be empty.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::GetRegions](../classes/PartyManager/methods/partymanager_getregions.md)
  
  
