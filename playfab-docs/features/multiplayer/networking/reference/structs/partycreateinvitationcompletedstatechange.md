---
author: jdeweyMSFT
title: "PartyCreateInvitationCompletedStateChange"
description: "Information specific to the *CreateInvitationCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyCreateInvitationCompletedStateChange  

Information specific to the *CreateInvitationCompleted* type of state change.  

## Syntax  
  
```cpp
struct PartyCreateInvitationCompletedStateChange : PartyStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyNetwork* network;  
    PartyLocalUser* localUser;  
    void* asyncIdentifier;  
    PartyInvitation* invitation;  
}  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the [PartyNetwork::CreateInvitation()](../classes/PartyNetwork/methods/partynetwork_createinvitation.md) operation succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network used in the call associated with this state change.
  
**`localUser`** &nbsp; [PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)*  
  
The local user that created the invitation.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
**`invitation`** &nbsp; [PartyInvitation](../classes/PartyInvitation/partyinvitation.md)*  
  
The invitation created for the network.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::CreateInvitation](../classes/PartyNetwork/methods/partynetwork_createinvitation.md)
  
  
