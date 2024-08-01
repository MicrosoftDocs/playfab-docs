---
author: ScottMunroMS
title: "PFLobbyAccessPolicy"
description: "Values representing the lobby's access policy."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFLobbyAccessPolicy  

Values representing the lobby's access policy.    

## Syntax  
  
```cpp
enum class PFLobbyAccessPolicy  : uint32_t  
{  
    Public = 0,  
    Friends = 1,  
    Private = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Public | The lobby is both visible in queries and any player may join, including invited players. |  
| Friends | The lobby and its connection string are queryable by friends of members in this lobby.<br/><br/> In some multiplayer social networks, friendship is a unidirectional relationship. One user may "follow" another or be their friend, but the same is not necessarily true in the reverse direction. This access policy only grants access when a bidirectional friendship exists. That is, the user querying for the lobby and the user in the lobby must both be friends with each other. <br /><br /> When querying for lobbies, users can opt into searching external multiplayer social networks for friendship relationships as well as the native PlayFab friends list. For example, a user could opt to check their Xbox Live friends list in addition to the PlayFab friends list. An external multiplayer social relationship can only be considered if both PlayFab users for this title have linked that mulitplayer social network to their PlayFab accounts. |  
| Private | The lobby is not visible in queries, and a player must receive an invite to join. |  
  
## Remarks  
  
The access policy controls whether this lobby's connection string is accessible in search queries.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
