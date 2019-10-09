---
author: jdeweyMSFT
title: "PartyInvitationCreatedStateChange"
description: "Information specific to the *InvitationCreated* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyInvitationCreatedStateChange  

Information specific to the *InvitationCreated* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyInvitationCreatedStateChange {  
    PartyNetwork* network;  
    PartyInvitation* invitation;  
} PartyInvitationCreatedStateChange  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network of the invitation that was created.
  
**`invitation`** &nbsp; [PartyInvitation](../classes/PartyInvitation/partyinvitation.md)*  
  
The invitation that was created.
  
Upon receiving this state change, the invitation object will be queryable via [PartyNetwork::GetInvitations()](../classes/PartyNetwork/methods/partynetwork_getinvitations.md).
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
