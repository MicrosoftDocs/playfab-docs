---
author: jdeweyMSFT
title: "PartyInvitation"
description: Represents an invitation used to authenticate a user into a network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/22/2022
---

# PartyInvitation  

Represents an invitation used to authenticate a user into a network.  

## Syntax  
  
```cpp  
class PartyInvitation  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetCreatorEntityId](methods/partyinvitation_getcreatorentityid.md) | Gets the PlayFab Entity ID of the user that created this invitation or nullptr if this invitation was generated as part of a [PartyManager::CreateNewNetwork()](../PartyManager/methods/partymanager_createnewnetwork.md) operation. |  
| [GetInvitationConfiguration](methods/partyinvitation_getinvitationconfiguration.md) | Gets this invitation's configuration. |  
| [GetCustomContext](methods/partyinvitation_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this invitation object. |  
| [SetCustomContext](methods/partyinvitation_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this invitation object. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  
[PartyManager::CreateNewNetwork](../PartyManager/methods/partymanager_createnewnetwork.md)  
[PartyNetwork::CreateInvitation](../PartyNetwork/methods/partynetwork_createinvitation.md)  
[PartyNetwork::AuthenticateLocalUser](../PartyNetwork/methods/partynetwork_authenticatelocaluser.md)  
[PartyInvitationConfiguration](../../structs/partyinvitationconfiguration.md)
  
  
  
