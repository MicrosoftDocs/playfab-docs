---
author: vicodex
title: Lobby.AccessPolicy
description: Lobby.AccessPolicy
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.AccessPolicy property

Gets the access policy of the lobby.

```csharp
public LobbyAccessPolicy AccessPolicy { get; }
```

## Return Value

The access policy of the lobby.

## Remarks

If this lobby object was created by calling [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method returns `LobbyAccessPolicy.Public` until [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) with the `OnLobbyUpdated accessPolicyUpdated` set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyJoinCompleted`](../PlayFabMultiplayer/OnLobbyJoinCompleted.md).

## See Also

* enum [LobbyAccessPolicy](../LobbyAccessPolicy.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

