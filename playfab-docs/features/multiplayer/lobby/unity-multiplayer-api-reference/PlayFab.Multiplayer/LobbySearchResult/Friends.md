---
author: vicodex
title: LobbySearchResult.Friends
description: LobbySearchResult.Friends
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbySearchResult.Friends property

The friends in the found lobby, if the lobby search was performed with a `LobbySearchFriendsFilter`.

```csharp
public IList<PFEntityKey> Friends { get; }
```

## Remarks

If the lobby search which generated this search result was not performed with a `LobbySearchFriendsFilter`, this value will always be 0.

In some multiplayer social networks, friendship is a unidirectional relationship. One user may "follow" another or be their friend, but the same is not necessarily true in the reverse direction. Friends will only be returned in this search result when a bidirectional friendship exists. That is, the user querying for the lobby and the user in the lobby must both be friends with each other.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [LobbySearchResult](../LobbySearchResult.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

