---
author: vicodex
title: PlayFabMultiplayer.OnLobbySendInviteCompletedHandler
description: PlayFabMultiplayer.OnLobbySendInviteCompletedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbySendInviteCompletedHandler delegate

Handler for when the operation started by a previous call to [`SendInvite`](./Lobby/SendInvite.md) completed.

```csharp
public delegate void OnLobbySendInviteCompletedHandler(Lobby lobby, PFEntityKey sender, 
    PFEntityKey invitee, int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| sender | The local user which attempted to send the invite. |
| invitee | The entity which was invited. |
| result | Indicates that the SendInvite operation Succeeded or provides the reason that it failed. |

## See Also

* class [Lobby](./Lobby.md)
* class [PFEntityKey](./PFEntityKey.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

