---
author: jdeweyMSFT
title: "PartyInvitationRevocability"
description: "Options for who may revoke an invitation."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyInvitationRevocability  

Options for who may revoke an invitation.    

## Syntax  
  
```cpp
enum class PartyInvitationRevocability    
{  
    Creator,  
    Anyone,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Creator | The invitation may only be revoked by the PartyLocalUser that created the invitation. |  
| Anyone | The invitation may be revoked by any authenticated user in the network. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::RevokeInvitation](../classes/PartyNetwork/methods/partynetwork_revokeinvitation.md)  
[PartyInvitation](../classes/PartyInvitation/partyinvitation.md)  
[PartyLocalUser](../classes/PartyLocalUser/partylocaluser.md)
  
  
