---
author: vicodex
title: LobbySearchConfiguration.FriendsFilter
description: LobbySearchConfiguration.FriendsFilter
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbySearchConfiguration.FriendsFilter property

A filter that, when provided, will constrain the lobby search operation to only those owned by the members of that player's various friend lists.

```csharp
public LobbySearchFriendsFilter FriendsFilter { get; }
```

## Remarks

If omitted, the search operation will search all available lobbies.

## See Also

* class [LobbySearchFriendsFilter](../LobbySearchFriendsFilter.md)
* class [LobbySearchConfiguration](../LobbySearchConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

