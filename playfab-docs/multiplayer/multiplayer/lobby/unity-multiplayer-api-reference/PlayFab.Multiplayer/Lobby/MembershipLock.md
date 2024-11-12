---
author: vicodex
title: Lobby.MembershipLock
description: Lobby.MembershipLock
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.MembershipLock property

Gets whether the lobby's membership is locked.

```csharp
public LobbyMembershipLock MembershipLock { get; }
```

## Return Value

Returns whether the membership of the lobby is locked.

## Remarks

If this lobby object was created by calling [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method returns false until [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) with the `OnLobbyUpdated membershipLockUpdated` set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyJoinCompleted`](../PlayFabMultiplayer/OnLobbyJoinCompleted.md).

## See Also

* enum [LobbyMembershipLock](../LobbyMembershipLock.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

