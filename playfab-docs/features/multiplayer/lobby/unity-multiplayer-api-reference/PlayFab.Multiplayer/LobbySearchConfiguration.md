---
author: vicodex
title: LobbySearchConfiguration class
description: LobbySearchConfiguration members
ms.author: victorku
ms.topic: reference
ms.service: playfab
ms.date: 11/23/2021
---

# Class LobbySearchConfiguration

The configuration structure used to specify how a !:FindLobbies operation should be performed.

```csharp
public class LobbySearchConfiguration
```

## Constructors

| name | description |
| --- | --- |
| [LobbySearchConfiguration](LobbySearchConfiguration/LobbySearchConfiguration.md) | The default constructor. |

## Properties

| name | description |
| --- | --- |
| [ClientSearchResultCount](LobbySearchConfiguration/ClientSearchResultCount.md) | An optional value which, when specified, will limit the number of results provided in the completion response. |
| [FilterString](LobbySearchConfiguration/FilterString.md) | The query string used to filter which lobbies are returned in the search results. |
| [FriendsFilter](LobbySearchConfiguration/FriendsFilter.md) | A filter that, when provided, will constrain the lobby search operation to only those owned by the members of that player's various friend lists. |
| [SortString](LobbySearchConfiguration/SortString.md) | The query string used to sort the lobbies returned in the search results. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
