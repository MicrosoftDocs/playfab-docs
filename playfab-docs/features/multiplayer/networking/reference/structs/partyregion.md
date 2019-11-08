---
author: jdeweyMSFT
title: "PartyRegion"
description: "Represents a Party library region."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyRegion  

Represents a Party library region.  

## Syntax  
  
```cpp
typedef struct PartyRegion {  
    char regionName[c_maxRegionNameStringLength + 1];  
    uint32_t roundTripLatencyInMilliseconds;  
} PartyRegion  
```
  
### Members  
  
**`regionName`** &nbsp; char[c_maxRegionNameStringLength + 1]  
  
The name of the Azure region, such as "eastus2".
  
**`roundTripLatencyInMilliseconds`** &nbsp; uint32_t  
  
The round trip latency between the local device and the region's datacenter.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
