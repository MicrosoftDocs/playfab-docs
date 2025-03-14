---
author: vicodex
title: Lobby.Id
description: Lobby.Id
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.Id property

Gets the ID of the Lobby.

```csharp
public string Id { get; }
```

## Return Value

Gets the ID of the Lobby.

## Remarks

If this lobby object was created by calling [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md) or [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method will return null until [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a successful [`OnLobbyCreateAndJoinCompleted`](../PlayFabMultiplayer/OnLobbyCreateAndJoinCompleted.md) or [`OnLobbyJoinCompleted`](../PlayFabMultiplayer/OnLobbyJoinCompleted.md) respectively.

## See Also

* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

