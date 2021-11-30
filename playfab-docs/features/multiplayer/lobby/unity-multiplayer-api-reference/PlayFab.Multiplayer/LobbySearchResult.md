---
author: vicodex
title: LobbySearchResult
description: LobbySearchResult members
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# Class LobbySearchResult

An entry in the collection of lobby search results received upon successful completion of a [`FindLobbies`](./PlayFabMultiplayer/FindLobbies.md) operation.

```csharp
public class LobbySearchResult
```

## Properties

| name | description |
| --- | --- |
| [ConnectionString](LobbySearchResult/ConnectionString.md) | The connection string of the found lobby. |
| [CurrentMemberCount](LobbySearchResult/CurrentMemberCount.md) | The current number of members that are present in this lobby. |
| [Friends](LobbySearchResult/Friends.md) | The friends in the found lobby, if the lobby search was performed with a `LobbySearchFriendsFilter`. |
| [LobbyId](LobbySearchResult/LobbyId.md) | The ID of the found lobby. |
| [MaxMemberCount](LobbySearchResult/MaxMemberCount.md) | The maximum number of members that can be present in this lobby. |
| [OwnerEntity](LobbySearchResult/OwnerEntity.md) | The current owner of the lobby. |
| [SearchProperties](LobbySearchResult/SearchProperties.md) | The search properties associated with this lobby. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
