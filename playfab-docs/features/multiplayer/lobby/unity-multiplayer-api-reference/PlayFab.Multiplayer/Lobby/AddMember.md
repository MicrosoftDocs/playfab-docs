---
author: vicodex
title: Lobby.AddMember
description: Lobby.AddMember
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.AddMember

## Method (1 of 2)

Add a local user as a member to the lobby.

```csharp
public void AddMember(PFEntityKey localUser, IDictionary<string, string> memberProperties)
```

| parameter | description |
| --- | --- |
| localUser | The PlayFab Entity Key of the local user to add to the lobby as a member. |
| memberProperties | The initial member properties to set for this user when they join the lobby. |

## Remarks (1 of 2)

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnLobbyMemberAdded`](../PlayFabMultiplayer/OnLobbyMemberAdded.md) event followed by a [`OnAddMemberCompleted`](../PlayFabMultiplayer/OnAddMemberCompleted.md) event with the `OnAddMemberCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnAddMemberCompleted`](../PlayFabMultiplayer/OnAddMemberCompleted.md) with the `OnAddMemberCompleted result` field set to a failed error code.

This method is used to add an extra local PlayFab entity to a pre-existing lobby object. Because the lobby object must have already been created either via a call to [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md) or [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method is primarily useful for multiple local user scenarios.

This is an asynchronous operation. The member added via this method will not be reflected in the lists returned by [`GetMembers`](./GetMembers.md) until the asynchronous operation successfully completes.

---

## Method (2 of 2)

Add a local user as a member to the lobby.

```csharp
public void AddMember(PlayFabAuthenticationContext localUser, 
    IDictionary<string, string> memberProperties)
```

| parameter | description |
| --- | --- |
| localUser | The PlayFab Entity Key of the local user to add to the lobby as a member. |
| memberProperties | The initial member properties to set for this user when they join the lobby. |

## Remarks (2 of 2)

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnLobbyMemberAdded`](../PlayFabMultiplayer/OnLobbyMemberAdded.md) event followed by a [`OnAddMemberCompleted`](../PlayFabMultiplayer/OnAddMemberCompleted.md) event with the `OnAddMemberCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnAddMemberCompleted`](../PlayFabMultiplayer/OnAddMemberCompleted.md) with the `OnAddMemberCompleted result` field set to a failed error code.

This method is used to add an extra local PlayFab entity to a pre-existing lobby object. Because the lobby object must have already been created either via a call to [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md) or [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), this method is primarily useful for multiple local user scenarios.

This is an asynchronous operation. The member added via this method will not be reflected in the lists returned by [`GetMembers`](./GetMembers.md) until the asynchronous operation successfully completes.

## See Also

* class [Lobby](../Lobby.md)
* class [PFEntityKey](../PFEntityKey.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

