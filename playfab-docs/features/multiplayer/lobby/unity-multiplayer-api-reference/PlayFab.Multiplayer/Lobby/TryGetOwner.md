---
author: vicodex
title: Lobby.TryGetOwner
description: Lobby.TryGetOwner
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.TryGetOwner method

Tries to get the current owner of the lobby. Returns false and sets owner to null if there is no owner on this Lobby

```csharp
public bool TryGetOwner(out PFEntityKey owner)
```

| parameter | description |
| --- | --- |
| owner | The output owner. This value may be null if the owner has left or disconnected from the lobby while the owner migration policy is Manual or None. |

## Return Value

true if an owner is found or false otherwise

## Remarks

If this lobby object was created by calling [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method returns false and the owner is null until [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) with the `OnLobbyUpdated OwnerUpdated` field set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time [`ProcessLobbyStateChanges`](../PlayFabMultiplayer/ProcessLobbyStateChanges.md) provides a [`OnLobbyJoinCompleted`](../PlayFabMultiplayer/OnLobbyJoinCompleted.md).

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
