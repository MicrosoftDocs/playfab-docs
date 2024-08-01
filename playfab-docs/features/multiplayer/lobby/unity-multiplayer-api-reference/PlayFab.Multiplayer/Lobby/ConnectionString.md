---
author: vicodex
title: Lobby.ConnectionString
description: Lobby.ConnectionString
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.ConnectionString property

Gets the default connection string associated with the lobby.

```csharp
public string ConnectionString { get; }
```

## Return Value

The default connection string associated with the lobby.

## Remarks

If this lobby object was created by calling [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md), this method will return null until [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a successful [`OnLobbyCreateAndJoinCompleted`](../PlayFabMultiplayer/OnLobbyCreateAndJoinCompleted.md). If this lobby object was created by calling [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method will return null until [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a successful [`OnLobbyJoinCompleted`](../PlayFabMultiplayer/OnLobbyJoinCompleted.md).

## See Also

* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
