---
author: ScottMunroMS
title: "PFLobbySearchFriendsFilter"
description: "The filter structure used to limit lobby search results to only those lobbies owned by the player's friends."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbySearchFriendsFilter  

The filter structure used to limit lobby search results to only those lobbies owned by the player's friends.  

## Syntax  
  
```cpp
struct PFLobbySearchFriendsFilter {  
    bool includeSteamFriends;  
    bool includeFacebookFriends;  
    const char* includeXboxFriendsToken;  
}  
```
  
### Members  
  
**`includeSteamFriends`** &nbsp; bool  
  
A flag which includes the player's Steam friends list if their PlayFab account is linked to their Steam account.
  
**`includeFacebookFriends`** &nbsp; bool  
  
A flag which includes the player's Facebook friends list if their PlayFab account is linked to their Facebook account.
  
**`includeXboxFriendsToken`** &nbsp; const char*  
*is null-terminated*  
  
An Xbox Live token that, when provided, includes the player's Xbox Live friends list if their PlayFab account is linked to their Xbox Live account.
  
To retrieve this token, make a POST request to "https://playfabapi.com" with an empty request body using one of the GetTokenAndSignature APIs provided by Xbox Live. <br /><br /> GetTokenAndSignature APIs are provided natively as part of the Microsoft Game Core Development Kit (GDK). On all other platforms, these APIs are provided via the Xbox Authentication Library API (XAL).
  
## Remarks  
  
Regardless of which external friend lists are included when constructing this filter, friends from the PlayFab friends list will always be included.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
