---
author: vicodex
title: Lobby.LeaveAllLocalUsers
description: Lobby.LeaveAllLocalUsers
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.LeaveAllLocalUsers method

Request all local users to leave the lobby.

```csharp
public void LeaveAllLocalUsers()
```

## Remarks

This operation should only fail if the client is experiencing persistent internet connectivity issues. Under these circumstances, the client loses their active connection to the lobby and remote lobby members see their [`LobbyMemberConnectionStatus`](../LobbyMemberConnectionStatus.md) as `LobbyMemberConnectionStatus.Disconnected`. The members experiencing connectivity issues remain as members of the lobby unless the lobby owner forcibly removes them.

This is an asynchronous operation. The local users removed from the lobby via this method won't be removed in the lists returned by [`GetMembers`](./GetMembers.md) until the asynchronous operation successfully completes and a `Multiplayer.OnLobbyMemberRemoved` is provided by [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md).

## See Also

* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

