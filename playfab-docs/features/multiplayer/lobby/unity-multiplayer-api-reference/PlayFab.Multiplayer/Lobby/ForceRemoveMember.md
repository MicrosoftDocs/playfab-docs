---
author: vicodex
title: Lobby.ForceRemoveMember
description: Lobby.ForceRemoveMember
ms.author: victorku
ms.topic: reference
ms.service: playfab
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

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyMemberRemoved`](../PlayFabMultiplayer/OnLobbyMemberRemoved.md) event followed by a [`OnForceRemoveMemberCompleted`](../PlayFabMultiplayer/OnForceRemoveMemberCompleted.md) event with the result field set to `LobbyStateChangeResult.Succeeded`. Upon a failed completion, the title will be provided a [`OnForceRemoveMemberCompleted`](../PlayFabMultiplayer/OnForceRemoveMemberCompleted.md) event with the result field set to a failure

One of the local PlayFab entities present in this lobby must be the owner for this operation to succeed. If the local owning entity who initiated this operation loses their ownership status while the operation is in progress, the operation will fail asynchronously and the provided [`OnForceRemoveMemberCompleted`](../PlayFabMultiplayer/OnForceRemoveMemberCompleted.md) event result which will be set to !:LobbyStateChangeResult.UserNotAuthorized

This is an asynchronous operation. The member removed via this method will not be removed from the lists returned by [`GetMembers`](./GetMembers.md) until the asynchronous operation successfully completes and a [`OnLobbyMemberRemoved`](../PlayFabMultiplayer/OnLobbyMemberRemoved.md) event

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

