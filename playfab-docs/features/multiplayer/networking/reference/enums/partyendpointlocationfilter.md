---
author: jdeweyMSFT
title: "PartyEndpointLocationFilter"
description: "Categories of owning device locations of endpoints that can be used to filter the results returned by PartyNetwork::GetEndpointsByUserType()."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/06/2024
---

# PartyEndpointLocationFilter  

Categories of owning device locations of endpoints that can be used to filter the results returned by PartyNetwork::GetEndpointsByUserType().    

## Syntax  
  
```cpp
enum class PartyEndpointLocationFilter    
{  
    NoLocationFilter = 0,  
    LocalOnly = 1,  
    RemoteOnly = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NoLocationFilter | Retrieve matching endpoints created by any device, whether local or remote. |  
| LocalOnly | Retrieve only matching endpoints created by the local device. |  
| RemoteOnly | Retrieve only matching endpoints created by remote devices. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::GetEndpointsByUserType](../classes/PartyNetwork/methods/partynetwork_getendpointsbyusertype.md)
  
  
