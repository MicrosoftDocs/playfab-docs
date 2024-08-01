---
author: vicodex
title: Lobby.Leave
description: Lobby.Leave
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.Leave

## Method (1 of 2)

Request one local user to leave the lobby.

```csharp
public void Leave(PFEntityKey localUser)
```

| parameter | description |
| --- | --- |
| localUser | A value to indicate if a specific local user should leave the lobby. |

## Remarks (1 of 2)

This operation should only fail if the client is experiencing persistent internet connectivity issues. Under these circumstances, the client loses their active connection to the lobby and remote lobby members see their [`LobbyMemberConnectionStatus`](../LobbyMemberConnectionStatus.md) as `LobbyMemberConnectionStatus.Disconnected`. The members experiencing connectivity issues remain as members of the lobby unless the lobby owner forcibly removes them.

This is an asynchronous operation. The local users removed from the lobby via this method won't be removed in the lists returned by [`GetMembers`](./GetMembers.md) until the asynchronous operation successfully completes and a `Multiplayer.OnLobbyMemberRemoved` is provided by [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md).

---

## Method (2 of 2)

Request one local user to leave the lobby.

```csharp
public void Leave(PlayFabAuthenticationContext localUser)
```

| parameter | description |
| --- | --- |
| localUser | A value to indicate if a specific local user should leave the lobby. |

## Remarks (2 of 2)

This operation should only fail if the client is experiencing persistent internet connectivity issues. Under these circumstances, the client loses their active connection to the lobby and remote lobby members see their [`LobbyMemberConnectionStatus`](../LobbyMemberConnectionStatus.md) as `LobbyMemberConnectionStatus.Disconnected`. The members experiencing connectivity issues remain as members of the lobby unless the lobby owner forcibly removes them.

This is an asynchronous operation. The local users removed from the lobby via this method won't be removed in the lists returned by [`GetMembers`](./GetMembers.md) until the asynchronous operation successfully completes and a `Multiplayer.OnLobbyMemberRemoved` is provided by [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md).

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

