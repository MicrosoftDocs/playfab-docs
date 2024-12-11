---
author: jdeweyMSFT
title: "PartyEndpointCreatedStateChange"
description: "Information specific to the *EndpointCreated* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyEndpointCreatedStateChange  

Information specific to the *EndpointCreated* type of state change.  

## Syntax  
  
```cpp
struct PartyEndpointCreatedStateChange : PartyStateChange {  
    PartyNetwork* network;  
    PartyEndpoint* endpoint;  
}  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network of the endpoint that was created.
  
**`endpoint`** &nbsp; [PartyEndpoint](../classes/PartyEndpoint/partyendpoint.md)*  
  
The endpoint that was created.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
