---
author: jdeweyMSFT
title: "PartyInvitationCreatedStateChange"
description: "Information specific to the *InvitationCreated* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyInvitationCreatedStateChange  

Information specific to the *InvitationCreated* type of state change.  

## Syntax  
  
```cpp
struct PartyInvitationCreatedStateChange : PartyStateChange {  
    PartyNetwork* network;  
    PartyInvitation* invitation;  
}  
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

  
  
