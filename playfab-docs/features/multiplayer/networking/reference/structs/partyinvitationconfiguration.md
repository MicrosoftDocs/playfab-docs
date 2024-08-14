---
author: jdeweyMSFT
title: "PartyInvitationConfiguration"
description: "Invitation configuration data."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyInvitationConfiguration  

Invitation configuration data.  

## Syntax  
  
```cpp
struct PartyInvitationConfiguration {  
    PartyString identifier;  
    PartyInvitationRevocability revocability;  
    uint32_t entityIdCount;  
    const PartyString* entityIds;  
}  
```
  
### Members  
  
**`identifier`** &nbsp; [PartyString](../typedefs.md)  
*may be nullptr*  
  
The identifier of the invitation.
  
This value may only be nullptr when used as input to [PartyManager::CreateNewNetwork()](../classes/PartyManager/methods/partymanager_createnewnetwork.md) or [PartyNetwork::CreateInvitation()](../classes/PartyNetwork/methods/partynetwork_createinvitation.md). <br /><br /> The length of this string must be less than or equal to ```c_maxInvitationIdentifierStringLength```.
  
**`revocability`** &nbsp; [PartyInvitationRevocability](../enums/partyinvitationrevocability.md)  
  
The revocability of the invitation.
  
**`entityIdCount`** &nbsp; uint32_t  
  
The number of PlayFab Entity IDs that the invitation allows to authenticate into the network.
  
If this value is 0, all users are allowed to authenticate using the invitation's identifier. <br /><br /> This value must be less than or equal to ```c_maxInvitationEntityIdCount```.
  
**`entityIds`** &nbsp; const [PartyString](../typedefs.md)*  
*array of size `entityIdCount`*  
  
The list of PlayFab Entity IDs that the invitation allows to authenticate into the network.
  
If this list is empty, all users are allowed to authenticate using the invitation's identifier.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyInvitation](../classes/PartyInvitation/partyinvitation.md)  
[PartyInvitationRevocability](../enums/partyinvitationrevocability.md)  
[PartyManager::CreateNewNetwork](../classes/PartyManager/methods/partymanager_createnewnetwork.md)  
[PartyNetwork::CreateInvitation](../classes/PartyNetwork/methods/partynetwork_createinvitation.md)  
[PartyInvitation::GetInvitationConfiguration](../classes/PartyInvitation/methods/partyinvitation_getinvitationconfiguration.md)
  
  
