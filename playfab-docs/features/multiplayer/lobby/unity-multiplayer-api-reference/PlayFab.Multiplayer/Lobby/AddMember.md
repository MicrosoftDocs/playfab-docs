---
author: vicodex
title: Lobby.AddMember
description: Lobby.AddMember
ms.author: victorku
ms.topic: reference
ms.service: playfab
ms.date: 11/23/2021
---

# Lobby.AddMember method

Add a local user as a member to the lobby.

```csharp
public void AddMember(PFEntityKey localUser, IDictionary<string, string> memberProperties)
```

| parameter | description |
| --- | --- |
| localUser | The PlayFab Entity Key of the local user to add to the lobby as a member. |
| memberProperties | The initial member properties to set for this user when they join the lobby. |

## Remarks

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyMemberAdded`](../PlayFabMultiplayer/OnLobbyMemberAdded.md) event followed by a [`OnAddMemberCompleted`](../PlayFabMultiplayer/OnAddMemberCompleted.md) event with the result field set to Succeeded (0). Upon a failed completion, the result field will be set to Failed (negative value).

This method is used to add an additional local PlayFab entity to a pre-existing lobby object. Because the lobby object, must have already been created either via a call to [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md) or [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method is primarily useful for multiple local user scenarios.

This is an asynchronous operation. The member added via this method will not be reflected in the lists returned by [`GetMembers`](./GetMembers.md) until the asynchronous operation successfully completes.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

