---
author: vicodex
title: PlayFabMultiplayer.OnLobbyLeaveCompletedHandler
description: PlayFabMultiplayer.OnLobbyLeaveCompletedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyLeaveCompletedHandler delegate

Handler for when the operation started by a previous call to [`Leave`](./Lobby/Leave.md) completed.

```csharp
public delegate void OnLobbyLeaveCompletedHandler(Lobby lobby, PFEntityKey localUser);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| localUser | The local user provided to the call associated with this state change. May be null. If this value is null it signifies that the title requested all local members leave the specified lobby. |

## See Also

* class [Lobby](./Lobby.md)
* class [PFEntityKey](./PFEntityKey.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

