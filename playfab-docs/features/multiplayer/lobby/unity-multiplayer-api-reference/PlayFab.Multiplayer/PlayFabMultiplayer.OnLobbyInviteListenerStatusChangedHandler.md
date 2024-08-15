---
author: vicodex
title: PlayFabMultiplayer.OnLobbyInviteListenerStatusChangedHandler
description: PlayFabMultiplayer.OnLobbyInviteListenerStatusChangedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyInviteListenerStatusChangedHandler delegate

Handler for when an invite listener's status has changed.

```csharp
public delegate void OnLobbyInviteListenerStatusChangedHandler(PFEntityKey listeningEntity, 
    LobbyInviteListenerStatus newStatus);
```

| parameter | description |
| --- | --- |
| listeningEntity | The entity associated with the invite listener. |
| newStatus | Value representing the current status of an invite listener. |

## See Also

* class [PFEntityKey](./PFEntityKey.md)
* enum [LobbyInviteListenerStatus](./LobbyInviteListenerStatus.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

