---
author: vicodex
title: LobbyConstants class
description: LobbyConstants members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# LobbyConstants class

Information for all the constants related to lobby.

```csharp
public class LobbyConstants
```

## Public Members

| name | description |
| --- | --- |
| [LobbyConstants](LobbyConstants/LobbyConstants.md)() | The default constructor. |
| static readonly [LobbyAmMemberSearchKey](LobbyConstants/LobbyAmMemberSearchKey.md) | A special, predefined search key, which can be used in the [`FilterString`](./LobbySearchConfiguration/FilterString.md) filtering string to search for lobbies that you're currently a member of. |
| static readonly [LobbyAmOwnerSearchKey](LobbyConstants/LobbyAmOwnerSearchKey.md) | A special, predefined search key, which can be used in the [`FilterString`](./LobbySearchConfiguration/FilterString.md) filtering string to search for lobbies that you own. |
| const [LobbyClientRequestedSearchResultCountUpperLimit](LobbyConstants/LobbyClientRequestedSearchResultCountUpperLimit.md) | The maximum number of search results that client-entity callers may request when performing a [`FindLobbies`](./PlayFabMultiplayer/FindLobbies.md) operation. |
| const [LobbyMaxLobbyPropertyCount](LobbyConstants/LobbyMaxLobbyPropertyCount.md) | The maximum number of concurrent properties which can be stored for the lobby and which aren't owned by any specific member. |
| const [LobbyMaxMemberCountLowerLimit](LobbyConstants/LobbyMaxMemberCountLowerLimit.md) | The minimum allowed value for [`MaxMemberCount`](./LobbyCreateConfiguration/MaxMemberCount.md) and [`MaxMemberCount`](./LobbyDataUpdate/MaxMemberCount.md). |
| const [LobbyMaxMemberCountUpperLimit](LobbyConstants/LobbyMaxMemberCountUpperLimit.md) | The maximum allowed value for [`MaxMemberCount`](./LobbyCreateConfiguration/MaxMemberCount.md) and [`MaxMemberCount`](./LobbyDataUpdate/MaxMemberCount.md). |
| const [LobbyMaxMemberPropertyCount](LobbyConstants/LobbyMaxMemberPropertyCount.md) | The maximum number of concurrent properties allowed for each member in the lobby. |
| const [LobbyMaxSearchPropertyCount](LobbyConstants/LobbyMaxSearchPropertyCount.md) | The maximum number of concurrent search properties which can be stored for the lobby. |
| static readonly [LobbyMemberCountSearchKey](LobbyConstants/LobbyMemberCountSearchKey.md) | A special, predefined search key, which can be used in the [`FilterString`](./LobbySearchConfiguration/FilterString.md) filtering and sorting strings to search for lobbies based on the current number of members in the lobby. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

