---
author: jdeweyMSFT
title: "PartyRemoveLocalUserCompletedStateChange"
description: "Information specific to the *RemoveLocalUserCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyRemoveLocalUserCompletedStateChange  

Information specific to the *RemoveLocalUserCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyRemoveLocalUserCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyNetwork* network;  
    PartyLocalUser* localUser;  
    void* asyncIdentifier;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the remove local user operation Succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network used in the call associated with this state change.
  
**`localUser`** &nbsp; [PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)*  
  
The local user provided to the call associated with this state change.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
## Remarks  
  
All PartyEndpoints and PartyChatControls depending upon this user will have been destroyed with reason [PartyDestroyedReason::UserRemoved](../enums/partydestroyedreason.md) before this state change is generated. If the user referenced by this state change was the last authenticated user in the network, then all remaining PartyEndpoints on this device, which at this point inherently consists of only endpoints associated with the last user or no user, will also have been destroyed before this state change is generated. An associated [PartyLocalUserRemovedStateChange](partylocaluserremovedstatechange.md) will have been generated before this state change is generated.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyChatControlDestroyedStateChange](partychatcontroldestroyedstatechange.md)  
[PartyChatControlLeftNetworkStateChange](partychatcontrolleftnetworkstatechange.md)  
[PartyEndpointDestroyedStateChange](partyendpointdestroyedstatechange.md)  
[PartyNetwork::RemoveLocalUser](../classes/PartyNetwork/methods/partynetwork_removelocaluser.md)
  
  
