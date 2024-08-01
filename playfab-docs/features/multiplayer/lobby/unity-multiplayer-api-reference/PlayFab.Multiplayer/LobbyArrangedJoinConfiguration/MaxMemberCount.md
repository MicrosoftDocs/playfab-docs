---
author: vicodex
title: LobbyArrangedJoinConfiguration.MaxMemberCount
description: LobbyArrangedJoinConfiguration.MaxMemberCount
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyArrangedJoinConfiguration.MaxMemberCount property

The maximum number of members allowed in the lobby, if joiner is the first member in the lobby.

```csharp
public uint MaxMemberCount { get; set; }
```

## Remarks

This value must be at least `PlayFabMultiplayer.LobbyMaxMemberCountLowerLimit` and no more than `PlayFabMultiplayer.LobbyMaxMemberCountUpperLimit`.

If a client would violate this limit by calling [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md) or [`AddMember`](../Lobby/AddMember.md), the operation will fail asynchronously.

## See Also

* class [LobbyArrangedJoinConfiguration](../LobbyArrangedJoinConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

