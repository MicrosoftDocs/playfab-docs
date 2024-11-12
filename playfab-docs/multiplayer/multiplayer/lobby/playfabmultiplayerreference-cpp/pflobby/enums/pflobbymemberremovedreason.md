---
author: ScottMunroMS
title: "PFLobbyMemberRemovedReason"
description: "Reasons why a member was removed from a lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFLobbyMemberRemovedReason  

Reasons why a member was removed from a lobby.    

## Syntax  
  
```cpp
enum class PFLobbyMemberRemovedReason  : uint32_t  
{  
    LocalUserLeftLobby = 0,  
    LocalUserForciblyRemoved = 1,  
    RemoteUserLeftLobby = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| LocalUserLeftLobby | The local user is being removed because the title called [PFLobbyLeave()](../functions/pflobbyleave.md). |  
| LocalUserForciblyRemoved | The local user entity was forcibly removed by the owner. |  
| RemoteUserLeftLobby | The remote user has been removed from the lobby. It is unspecified whether they left voluntarily or if they were forcibly removed by the owner. |  
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
