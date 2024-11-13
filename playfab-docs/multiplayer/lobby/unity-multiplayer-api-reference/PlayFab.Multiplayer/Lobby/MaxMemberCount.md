---
author: vicodex
title: Lobby.MaxMemberCount
description: Lobby.MaxMemberCount
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.MaxMemberCount property

Gets the max member count of the lobby.

```csharp
public uint MaxMemberCount { get; }
```

## Return Value

The max member count of the lobby.

## Remarks

If this lobby object was created by calling [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method will return 0 until [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) with the `OnLobbyUpdated maxMembersUpdated` set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyJoinCompleted`](../PlayFabMultiplayer/OnLobbyJoinCompleted.md).

## See Also

* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
