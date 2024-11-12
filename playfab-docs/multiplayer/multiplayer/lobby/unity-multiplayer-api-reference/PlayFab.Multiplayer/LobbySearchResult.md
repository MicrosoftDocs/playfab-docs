---
author: vicodex
title: LobbySearchResult
description: LobbySearchResult members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class LobbySearchResult

An entry in the collection of lobby search results received upon successful completion of a [`FindLobbies`](./PlayFabMultiplayer/FindLobbies.md) operation.

```csharp
public class LobbySearchResult
```

## Public Members

| name | description |
| --- | --- |
| [ConnectionString](LobbySearchResult/ConnectionString.md) { get; } | The connection string of the found lobby. |
| [CurrentMemberCount](LobbySearchResult/CurrentMemberCount.md) { get; } | The current number of members that are present in this lobby. |
| [Friends](LobbySearchResult/Friends.md) { get; } | The friends in the found lobby, if the lobby search was performed with a `LobbySearchFriendsFilter`. |
| [LobbyId](LobbySearchResult/LobbyId.md) { get; } | The ID of the found lobby. |
| [MaxMemberCount](LobbySearchResult/MaxMemberCount.md) { get; } | The maximum number of members that can be present in this lobby. |
| [MembershipLock](LobbySearchResult/MembershipLock.md) { get; } | The current lock state of the found lobby. |
| [OwnerEntity](LobbySearchResult/OwnerEntity.md) { get; } | The current owner of the lobby. |
| [SearchProperties](LobbySearchResult/SearchProperties.md) { get; } | The search properties associated with this lobby. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
