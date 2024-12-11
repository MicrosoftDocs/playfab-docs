---
author: jdeweyMSFT
title: "PartyEndpointDestroyedStateChange"
description: "Information specific to the *EndpointDestroyed* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyEndpointDestroyedStateChange  

Information specific to the *EndpointDestroyed* type of state change.  

## Syntax  
  
```cpp
struct PartyEndpointDestroyedStateChange : PartyStateChange {  
    PartyNetwork* network;  
    PartyEndpoint* endpoint;  
    PartyDestroyedReason reason;  
    PartyError errorDetail;  
}  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network of the endpoint that was destroyed.
  
**`endpoint`** &nbsp; [PartyEndpoint](../classes/PartyEndpoint/partyendpoint.md)*  
  
The endpoint that was destroyed.
  
**`reason`** &nbsp; [PartyDestroyedReason](../enums/partydestroyedreason.md)  
  
The reason the endpoint was destroyed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
