---
author: vicodex
title: LobbySearchFriendsFilter
description: LobbySearchFriendsFilter members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class LobbySearchFriendsFilter

The filter structure used to limit lobby search results to only those lobbies owned by the player's friends.

```csharp
public class LobbySearchFriendsFilter
```

## Public Members

| name | description |
| --- | --- |
| [IncludeFacebookFriends](LobbySearchFriendsFilter/IncludeFacebookFriends.md) { get; set; } | A flag which includes the player's Facebook friends list if their PlayFab account is linked to their Facebook account. |
| [IncludeSteamFriends](LobbySearchFriendsFilter/IncludeSteamFriends.md) { get; set; } | A flag which includes the player's Steam friends list if their PlayFab account is linked to their Steam account. |
| [IncludeXboxFriendsToken](LobbySearchFriendsFilter/IncludeXboxFriendsToken.md) { get; set; } | An Xbox Live token that, when provided, includes the player's Xbox Live friends list if their PlayFab account is linked to their Xbox Live account. |

## Remarks

Regardless of which external friend lists are included when constructing this filter, friends from the PlayFab friends list will always be included.

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
