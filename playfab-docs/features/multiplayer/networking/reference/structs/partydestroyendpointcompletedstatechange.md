---
author: jdeweyMSFT
title: "PartyDestroyEndpointCompletedStateChange"
description: "Information specific to the *DestroyEndpointCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyDestroyEndpointCompletedStateChange  

Information specific to the *DestroyEndpointCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyDestroyEndpointCompletedStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyNetwork* network;  
    PartyLocalEndpoint* localEndpoint;  
    void* asyncIdentifier;  
} PartyDestroyEndpointCompletedStateChange  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the destroy endpoint operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network used in the call associated with this state change.
  
**`localEndpoint`** &nbsp; [PartyLocalEndpoint](../classes/PartyLocalEndpoint/partylocalendpoint.md)*  
  
The endpoint provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
## Remarks  
  
An associated [PartyEndpointDestroyedStateChange](partyendpointdestroyedstatechange.md) will be generated before this state change is generated.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::DestroyEndpoint](../classes/PartyNetwork/methods/partynetwork_destroyendpoint.md)
  
  
