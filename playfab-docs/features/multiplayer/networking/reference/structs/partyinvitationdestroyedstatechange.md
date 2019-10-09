---
author: jdeweyMSFT
title: "PartyInvitationDestroyedStateChange"
description: "Information specific to the *InvitationDestroyed* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyInvitationDestroyedStateChange  

Information specific to the *InvitationDestroyed* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyInvitationDestroyedStateChange {  
    PartyNetwork* network;  
    PartyInvitation* invitation;  
    PartyDestroyedReason reason;  
    PartyError errorDetail;  
} PartyInvitationDestroyedStateChange  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network of the invitation that was destroyed.
  
**`invitation`** &nbsp; [PartyInvitation](../classes/PartyInvitation/partyinvitation.md)*  
  
The invitation that was destroyed.
  
Upon receiving this state change, the invitation object will no longer be queryable via [PartyNetwork::GetInvitations()](../classes/PartyNetwork/methods/partynetwork_getinvitations.md).
  
**`reason`** &nbsp; [PartyDestroyedReason](../enums/partydestroyedreason.md)  
  
The reason the invitation was destroyed.
  
If the invitation object was destroyed because it was explicitly revoked via [PartyNetwork::RevokeInvitation()](../classes/PartyNetwork/methods/partynetwork_revokeinvitation.md) or automatically revoked when the creating local user left the network, this value will be [PartyDestroyedReason::Requested](../enums/partydestroyedreason.md). If the invitation object was destroyed because the local client is no longer authenticated in the network, this value will be [PartyDestroyedReason::DeviceLostAuthentication](../enums/partydestroyedreason.md).
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
