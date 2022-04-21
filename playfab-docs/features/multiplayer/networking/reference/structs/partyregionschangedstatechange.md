---
author: jdeweyMSFT
title: "PartyRegionsChangedStateChange"
description: "Information specific to the *RegionsChanged* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 04/21/2022
---

# PartyRegionsChangedStateChange  

Information specific to the *RegionsChanged* type of state change.  

## Syntax  
  
```cpp
struct PartyRegionsChangedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates whether a background operation to query the list of supported regions and the latency to each region Succeeded, or provides the reason that it failed.
  
On success, the region list provided by [PartyManager::GetRegions()](../classes/PartyManager/methods/partymanager_getregions.md) will be populated with the results of the operation. On failure, the region list provided by PartyManager::GetRegions() will be empty. <br /><br /> If the result is [PartyStateChangeResult::FailedToBindToLocalUdpSocket](../enums/partystatechangeresult.md), the library couldn't bind to the local UDP socket specified in the [PartyOption::LocalUdpSocketBindAddress](../enums/partyoption.md) option. The title must clean up its instance of the library, update the [PartyOption::LocalUdpSocketBindAddress](../enums/partyoption.md) option to a valid, available bind address, and re-initialize the library.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::GetRegions](../classes/PartyManager/methods/partymanager_getregions.md)
  
  
