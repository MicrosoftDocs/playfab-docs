---
author: vicodex
title: PlayFabMultiplayer.OnLobbyCreateAndJoinCompletedHandler
description: PlayFabMultiplayer.OnLobbyCreateAndJoinCompletedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyCreateAndJoinCompletedHandler delegate

Handler for when the operation started by a previous call to [`CreateAndJoinLobby`](./PlayFabMultiplayer/CreateAndJoinLobby.md) completed.

```csharp
public delegate void OnLobbyCreateAndJoinCompletedHandler(Lobby lobby, int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby that was created and joined. |
| result | Indicates that the CreateAndJoinLobby operation Succeeded or provides the reason that it failed. |

## See Also

* class [Lobby](./Lobby.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

