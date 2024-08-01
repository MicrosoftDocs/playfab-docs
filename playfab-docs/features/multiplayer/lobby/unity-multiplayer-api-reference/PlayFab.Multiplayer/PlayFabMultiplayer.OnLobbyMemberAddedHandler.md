---
author: vicodex
title: PlayFabMultiplayer.OnLobbyMemberAddedHandler
description: PlayFabMultiplayer.OnLobbyMemberAddedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyMemberAddedHandler delegate

Handler for when a local PlayFab entity was added to lobby as a member.

```csharp
public delegate void OnLobbyMemberAddedHandler(Lobby lobby, PFEntityKey member);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| member | The PlayFab entity which is now a member of the lobby. |

## Remarks

[`OnLobbyMemberAdded`](./PlayFabMultiplayer/OnLobbyMemberAdded.md) event fires anytime any member is added to the lobby (remote or local). [`OnAddMemberCompleted`](./PlayFabMultiplayer/OnAddMemberCompleted.md) event only fires when you invoke [`AddMember`](./Lobby/AddMember.md) which allows you to add additional members to the lobby. The first local member was the one who created the lobby, it will fire the [`OnLobbyCreateAndJoinCompleted`](./PlayFabMultiplayer/OnLobbyCreateAndJoinCompleted.md) event. If the local member is using [`JoinLobby`](./PlayFabMultiplayer/JoinLobby.md), it will fire the [`OnLobbyJoinCompleted`](./PlayFabMultiplayer/OnLobbyJoinCompleted.md) event. If the local member is using [`JoinArrangedLobby`](./PlayFabMultiplayer/JoinArrangedLobby.md), it will fire the [`OnLobbyJoinArrangedLobbyCompleted`](./PlayFabMultiplayer/OnLobbyJoinArrangedLobbyCompleted.md) event.

## See Also

* class [Lobby](./Lobby.md)
* class [PFEntityKey](./PFEntityKey.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

