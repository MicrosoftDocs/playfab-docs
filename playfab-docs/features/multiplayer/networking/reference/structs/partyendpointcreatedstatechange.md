---
author: jdeweyMSFT
title: "PartyEndpointCreatedStateChange"
description: "Information specific to the *EndpointCreated* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyEndpointCreatedStateChange  

Information specific to the *EndpointCreated* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyEndpointCreatedStateChange {  
    PartyNetwork* network;  
    PartyEndpoint* endpoint;  
} PartyEndpointCreatedStateChange  
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

  
  
