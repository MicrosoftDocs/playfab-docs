---
author: vicodex
title: Lobby.ForceRemoveMember
description: Lobby.ForceRemoveMember
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.ForceRemoveMember method

Forcibly remove an entity from the lobby.

```csharp
public void ForceRemoveMember(PFEntityKey targetMember, bool preventRejoin)
```

| parameter | description |
| --- | --- |
| targetMember | The member to forcibly remove. |
| preventRejoin | A flag indicating whether *targetMember* will be prevented from rejoining the lobby after being removed. |

## Remarks

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnLobbyMemberRemoved`](../PlayFabMultiplayer/OnLobbyMemberRemoved.md) event followed by a [`OnForceRemoveMemberCompleted`](../PlayFabMultiplayer/OnForceRemoveMemberCompleted.md) event with the `OnForceRemoveMemberCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnForceRemoveMemberCompleted`](../PlayFabMultiplayer/OnForceRemoveMemberCompleted.md) event with the `OnForceRemoveMemberCompleted result` field set to a failed error code.

One of the local PlayFab entities present in this lobby must be the owner for this operation to succeed. If the local owning entity who initiated this operation loses their ownership status while the operation is in progress, the operation fails asynchronously.

This is an asynchronous operation. The member removed via this method will not be removed from the lists returned by [`GetMembers`](./GetMembers.md) until the asynchronous operation successfully completes and a [`OnLobbyMemberRemoved`](../PlayFabMultiplayer/OnLobbyMemberRemoved.md) event is generated.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

