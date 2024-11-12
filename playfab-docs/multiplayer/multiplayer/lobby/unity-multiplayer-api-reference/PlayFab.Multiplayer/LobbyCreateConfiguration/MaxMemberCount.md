---
author: vicodex
title: LobbyCreateConfiguration.MaxMemberCount
description: LobbyCreateConfiguration.MaxMemberCount
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyCreateConfiguration.MaxMemberCount property

The maximum number of members allowed in the new lobby.

```csharp
public uint MaxMemberCount { get; set; }
```

## Remarks

This value must be at least `PlayFabMultiplayer.LobbyMaxMemberCountLowerLimit` and no more than `PlayFabMultiplayer.LobbyMaxMemberCountUpperLimit`.

If a client would violate this limit by calling [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md) or [`AddMember`](../Lobby/AddMember.md), the operation will fail asynchronously.

## See Also

* class [LobbyCreateConfiguration](../LobbyCreateConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

