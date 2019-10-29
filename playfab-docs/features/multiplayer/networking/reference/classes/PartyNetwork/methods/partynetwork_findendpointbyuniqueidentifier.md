---
author: jdeweyMSFT
title: "PartyNetwork::FindEndpointByUniqueIdentifier"
description: Finds the endpoint with the corresponding network-unique identifier in this network, if it exists.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyNetwork::FindEndpointByUniqueIdentifier  

Finds the endpoint with the corresponding network-unique identifier in this network, if it exists.  

## Syntax  
  
```cpp
PartyError FindEndpointByUniqueIdentifier(  
    uint16_t uniqueIdentifier,  
    PartyEndpoint** endpoint  
)  
```  
  
### Parameters  
  
**`uniqueIdentifier`** &nbsp; uint16_t  
  
The network-unique identifier of an endpoint.  
  
**`endpoint`** &nbsp; [PartyEndpoint**](../../PartyEndpoint/partyendpoint.md)  
*output*  
  
The output endpoint with a network-unique identifier matching `uniqueIdentifier`.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if an endpoint with a matching identifier was found on this network or an error code otherwise.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyEndpoint::GetUniqueIdentifier](../../PartyEndpoint/methods/partyendpoint_getuniqueidentifier.md)
  
  
