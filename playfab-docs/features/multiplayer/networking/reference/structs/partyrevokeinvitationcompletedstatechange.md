---
author: jdeweyMSFT
title: "PartyRevokeInvitationCompletedStateChange"
description: "Information specific to the *RevokeInvitationCompleted* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyRevokeInvitationCompletedStateChange  

Information specific to the *RevokeInvitationCompleted* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyRevokeInvitationCompletedStateChange {  
    PartyStateChangeResult result;  
    PartyError errorDetail;  
    PartyNetwork* network;  
    PartyLocalUser* localUser;  
    PartyInvitation* invitation;  
    void* asyncIdentifier;  
} PartyRevokeInvitationCompletedStateChange  
```
  
### Members  
  
**`result`** &nbsp; [PartyStateChangeResult](../enums/partystatechangeresult.md)  
  
Indicates that the [PartyNetwork::RevokeInvitation()](../classes/PartyNetwork/methods/partynetwork_revokeinvitation.md) operation succeeded or provides the reason that it failed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network used in the call associated with this state change.
  
**`localUser`** &nbsp; [PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)*  
  
The local user used to revoke the invitation.
  
**`invitation`** &nbsp; [PartyInvitation](../classes/PartyInvitation/partyinvitation.md)*  
  
The revoked invitation.
  
**`asyncIdentifier`** &nbsp; void*  
  
The async identifier provided to the call associated with this state change.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::RevokeInvitation](../classes/PartyNetwork/methods/partynetwork_revokeinvitation.md)
  
  
