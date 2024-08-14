---
author: jdeweyMSFT
title: "PartyLocalUserRemovedStateChange"
description: "Information specific to the *LocalUserRemoved* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyLocalUserRemovedStateChange  

Information specific to the *LocalUserRemoved* type of state change.  

## Syntax  
  
```cpp
struct PartyLocalUserRemovedStateChange : PartyStateChange {  
    PartyNetwork* network;  
    PartyLocalUser* localUser;  
    PartyLocalUserRemovedReason removedReason;  
}  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network that the local user was removed from.
  
**`localUser`** &nbsp; [PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)*  
  
The local user provided to the call associated with this state change.
  
**`removedReason`** &nbsp; [PartyLocalUserRemovedReason](../enums/partylocaluserremovedreason.md)  
  
The reason the user was removed from the network.
  
## Remarks  
  
All PartyEndpoints depending on this user will have been destroyed prior to this state change being generated. All PartyChatControls depending on this user will have left the network prior to this state change being generated.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::RemoveLocalUser](../classes/PartyNetwork/methods/partynetwork_removelocaluser.md)  
[PartyManager::DestroyLocalUser](../classes/PartyManager/methods/partymanager_destroylocaluser.md)
  
  
