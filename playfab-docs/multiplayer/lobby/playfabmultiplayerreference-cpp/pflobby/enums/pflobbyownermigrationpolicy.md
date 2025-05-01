---
author: ScottMunroMS
title: "PFLobbyOwnerMigrationPolicy"
description: "The available policies the lobby service can use to migrate lobby ownership between members."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/09/2022
---

# PFLobbyOwnerMigrationPolicy  

The available policies the lobby service can use to migrate lobby ownership between members.    

## Syntax  
  
```cpp
enum class PFLobbyOwnerMigrationPolicy  : uint32_t  
{  
    Automatic = 0,  
    Manual = 1,  
    None = 2,  
    Server = 3,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Automatic | Once the lobby owner is disconnected, a new owner is chosen at random from the set of connected members. |  
| Manual | Once the lobby owner is disconnected, any member may elect themselves the new owner.<br/><br/> Until a new owner is chosen, [PFLobbyGetOwner](../functions/pflobbygetowner.md) will return a null owner. |  
| None | At any point, any member may elect themselves the owner of the lobby, regardless of the state of the current owner.<br/><br/> If the current owner leaves, [PFLobbyGetOwner](../functions/pflobbygetowner.md) will return a null owner until a new owner elects themselves. |  
| Server | The server is the owner and owner migration is not possible. |  
  
## Remarks  
  
Some migration policies trigger based on the lobby owner's connection status. A member is considered disconnected when their [PFLobbyMemberConnectionStatus](pflobbymemberconnectionstatus.md) value changes from ```PFLobbyMemberConnectionStatus::Connected``` to ```PFLobbyMemberConnectionStatus::NotConnected```.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  
[PFLobbyMemberConnectionStatus](pflobbymemberconnectionstatus.md)
  
  
