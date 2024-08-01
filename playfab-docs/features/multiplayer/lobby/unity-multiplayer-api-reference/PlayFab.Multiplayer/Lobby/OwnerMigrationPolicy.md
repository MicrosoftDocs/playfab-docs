---
author: vicodex
title: Lobby.OwnerMigrationPolicy
description: Lobby.OwnerMigrationPolicy
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.OwnerMigrationPolicy property

Gets the owner migration policy of the lobby.

```csharp
public LobbyOwnerMigrationPolicy OwnerMigrationPolicy { get; }
```

## Return Value

The owner migration policy of the lobby.

## Remarks

The owner migration policy can't change for the lifetime of the lobby.

If this lobby object was created by calling [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method returns `LobbyOwnerMigrationPolicy.None` until [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) with the `OnLobbyUpdated ownerUpdated` set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyJoinCompleted`](../PlayFabMultiplayer/OnLobbyJoinCompleted.md).

## See Also

* enum [LobbyOwnerMigrationPolicy](../LobbyOwnerMigrationPolicy.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

