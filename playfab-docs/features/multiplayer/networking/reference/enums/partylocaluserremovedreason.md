---
author: jdeweyMSFT
title: "PartyLocalUserRemovedReason"
description: "Reasons for removing a local user from a network."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyLocalUserRemovedReason  

Reasons for removing a local user from a network.    

## Syntax  
  
```cpp
enum class PartyLocalUserRemovedReason    
{  
    AuthenticationFailed,  
    RemoveLocalUser,  
    DestroyLocalUser,  
    DestroyNetwork,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| AuthenticationFailed | The local user is being removed because [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md) asynchronously failed. |  
| RemoveLocalUser | The local user is being removed because the title called [PartyNetwork::RemoveLocalUser()](../classes/PartyNetwork/methods/partynetwork_removelocaluser.md). |  
| DestroyLocalUser | The local user is being removed because the title called [PartyManager::DestroyLocalUser()](../classes/PartyManager/methods/partymanager_destroylocaluser.md). |  
| DestroyNetwork | The local user is being removed because the network is being destroyed. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::AuthenticateLocalUser](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md)  
[PartyNetwork::RemoveLocalUser](../classes/PartyNetwork/methods/partynetwork_removelocaluser.md)  
[PartyManager::DestroyLocalUser](../classes/PartyManager/methods/partymanager_destroylocaluser.md)
  
  
