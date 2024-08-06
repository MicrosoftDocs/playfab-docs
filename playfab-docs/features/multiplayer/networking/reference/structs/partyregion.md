---
author: jdeweyMSFT
title: "PartyRegion"
description: "Represents a Party library region."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyRegion  

Represents a Party library region.  

## Syntax  
  
```cpp
struct PartyRegion {  
    char regionName[c_maxRegionNameStringLength + 1];  
    uint32_t roundTripLatencyInMilliseconds;  
}  
```
  
### Members  
  
**`regionName`** &nbsp; char[c_maxRegionNameStringLength + 1]  
  
The name of the Azure region, such as "eastus2".
  
This name is not localized to the current user's language, and showing the string directly in UI is not recommended outside of troubleshooting.
  
**`roundTripLatencyInMilliseconds`** &nbsp; uint32_t  
  
The round trip latency between the local device and the region's datacenter.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
