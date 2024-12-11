---
author: vicodex
title: PlayFabMultiplayer.OnLobbyJoinCompletedHandler
description: PlayFabMultiplayer.OnLobbyJoinCompletedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyJoinCompletedHandler delegate

Handler for when the operation started by a previous call to [`JoinLobby`](./PlayFabMultiplayer/JoinLobby.md) completed.

```csharp
public delegate void OnLobbyJoinCompletedHandler(Lobby lobby, PFEntityKey newMember, int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| newMember | The local member entity provided to the call associated with this state change which is joining this lobby. |
| result | Indicates that the JoinArrangedLobby operation Succeeded or provides the reason that it failed. |

## Remarks

[`OnLobbyMemberAdded`](./PlayFabMultiplayer/OnLobbyMemberAdded.md) event fires anytime any member is added to the lobby (remote or local). [`OnAddMemberCompleted`](./PlayFabMultiplayer/OnAddMemberCompleted.md) event only fires when you invoke [`AddMember`](./Lobby/AddMember.md) which allows you to add additional members to the lobby. The first local member was the one who created the lobby, it will fire the [`OnLobbyCreateAndJoinCompleted`](./PlayFabMultiplayer/OnLobbyCreateAndJoinCompleted.md) event. If the local member is using [`JoinLobby`](./PlayFabMultiplayer/JoinLobby.md), it will fire the [`OnLobbyJoinCompleted`](./PlayFabMultiplayer/OnLobbyJoinCompleted.md) event. If the local member is using [`JoinArrangedLobby`](./PlayFabMultiplayer/JoinArrangedLobby.md), it will fire the [`OnLobbyJoinArrangedLobbyCompleted`](./PlayFabMultiplayer/OnLobbyJoinArrangedLobbyCompleted.md) event.

## See Also

* class [Lobby](./Lobby.md)
* class [PFEntityKey](./PFEntityKey.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

