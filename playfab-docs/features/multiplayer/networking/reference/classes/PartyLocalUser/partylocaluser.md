---
author: jdeweyMSFT
title: "PartyLocalUser"
description: TBD
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyLocalUser  

Represents a local user.  

## Syntax  
  
```cpp  
class PartyLocalUser  
```  
  
## Public Methods  
  
| Name | Description |  
| --- | --- |  
| [GetEntityId](methods/partylocaluser_getentityid.md) | Gets the Entity ID associated with this local user. |  
| [UpdateEntityToken](methods/partylocaluser_updateentitytoken.md) | Updates the PlayFab Entity Token associated with this local user, for use in future authenticated operations. |  
| [GetCustomContext](methods/partylocaluser_getcustomcontext.md) | Retrieves the app's private, custom pointer-sized context value previously associated with this local user object. |  
| [SetCustomContext](methods/partylocaluser_setcustomcontext.md) | Configures an optional, custom pointer-sized context value with this local user object. |  

  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../../party_members.md)  
[PartyManager::CreateLocalUser](../PartyManager/methods/partymanager_createlocaluser.md)  
[PartyManager::GetLocalUsers](../PartyManager/methods/partymanager_getlocalusers.md)  
[PartyManager::DestroyLocalUser](../PartyManager/methods/partymanager_destroylocaluser.md)  
[PartyManager::CreateNewNetwork](../PartyManager/methods/partymanager_createnewnetwork.md)  
[PartyNetwork::AuthenticateLocalUser](../PartyNetwork/methods/partynetwork_authenticatelocaluser.md)  
[PartyNetwork::RemoveLocalUser](../PartyNetwork/methods/partynetwork_removelocaluser.md)  
[PartyNetwork::CreateInvitation](../PartyNetwork/methods/partynetwork_createinvitation.md)  
[PartyNetwork::RevokeInvitation](../PartyNetwork/methods/partynetwork_revokeinvitation.md)  
[PartyNetwork::CreateEndpoint](../PartyNetwork/methods/partynetwork_createendpoint.md)  
[PartyLocalDevice::CreateChatControl](../PartyLocalDevice/methods/partylocaldevice_createchatcontrol.md)
  
  
  
