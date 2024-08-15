---
author: vicodex
title: PlayFabMultiplayer.OnAddMemberCompletedHandler
description: PlayFabMultiplayer.OnAddMemberCompletedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnAddMemberCompletedHandler delegate

Handler for when the operation started by a previous call to [`AddMember`](./Lobby/AddMember.md) completed

```csharp
public delegate void OnAddMemberCompletedHandler(Lobby lobby, PFEntityKey localUser, int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| localUser | The member entity which has added to the lobby. |
| result | Indicates that the AddMember operation succeeded or provides the reason that it failed. |

## Remarks

[`OnLobbyMemberAdded`](./PlayFabMultiplayer/OnLobbyMemberAdded.md) event fires anytime any member is added to the lobby (remote or local). [`OnAddMemberCompleted`](./PlayFabMultiplayer/OnAddMemberCompleted.md) event only fires when you invoke [`AddMember`](./Lobby/AddMember.md) which allows you to add additional members to the lobby. The first local member was the one who created the lobby, it will fire the [`OnLobbyCreateAndJoinCompleted`](./PlayFabMultiplayer/OnLobbyCreateAndJoinCompleted.md) event. If the local member is using [`JoinLobby`](./PlayFabMultiplayer/JoinLobby.md), it will fire the [`OnLobbyJoinCompleted`](./PlayFabMultiplayer/OnLobbyJoinCompleted.md) event. If the local member is using [`JoinArrangedLobby`](./PlayFabMultiplayer/JoinArrangedLobby.md), it will fire the [`OnLobbyJoinArrangedLobbyCompleted`](./PlayFabMultiplayer/OnLobbyJoinArrangedLobbyCompleted.md) event.

## See Also

* class [Lobby](./Lobby.md)
* class [PFEntityKey](./PFEntityKey.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

