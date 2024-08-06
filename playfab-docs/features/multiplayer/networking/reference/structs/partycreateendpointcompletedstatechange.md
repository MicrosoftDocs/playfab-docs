---
author: jdeweyMSFT
title: "PartyCreateEndpointCompletedStateChange"
description: "Information specific to the *CreateEndpointCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyCreateEndpointCompletedStateChange  

Information specific to the *CreateEndpointCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyCreateEndpointCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyNetwork* network;  
    PartyLocalUser* localUser;  
    void* asyncIdentifier;  
    PartyLocalEndpoint* localEndpoint;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the create endpoint Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network used in the call associated with this state change.
  
**`localUser`** &nbsp; [PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)*  
*may be nullptr*  
  
The local user provided to the call associated with this state change if one was provided.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
**`localEndpoint`** &nbsp; [PartyLocalEndpoint](../classes/PartyLocalEndpoint/partylocalendpoint.md)*  
  
The endpoint that was created.
  
## Remarks  
  
An associated [PartyEndpointCreatedStateChange](partyendpointcreatedstatechange.md) will be generated before this state change is generated.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::CreateEndpoint](../classes/PartyNetwork/methods/partynetwork_createendpoint.md)
  
  
