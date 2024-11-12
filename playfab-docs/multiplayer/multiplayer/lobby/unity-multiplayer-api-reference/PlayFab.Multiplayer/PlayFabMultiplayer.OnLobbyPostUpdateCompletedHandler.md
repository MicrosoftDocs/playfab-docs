---
author: vicodex
title: PlayFabMultiplayer.OnLobbyPostUpdateCompletedHandler
description: PlayFabMultiplayer.OnLobbyPostUpdateCompletedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyPostUpdateCompletedHandler delegate

Handler for when the operation started by a previous call to [`PostUpdate`](./Lobby/PostUpdate.md) completed.

```csharp
public delegate void OnLobbyPostUpdateCompletedHandler(Lobby lobby, PFEntityKey localUser, 
    int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| localUser | The local user provided to the call associated with this state change. |
| result | Indicates that the update operation Succeeded or provides the reason that it failed. |

## See Also

* class [Lobby](./Lobby.md)
* class [PFEntityKey](./PFEntityKey.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

