---
author: vicodex
title: PlayFabMultiplayer.OnLobbyInviteReceivedHandler
description: PlayFabMultiplayer.OnLobbyInviteReceivedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyInviteReceivedHandler delegate

Handler for when an entity on this client has received an invite to a lobby.

```csharp
public delegate void OnLobbyInviteReceivedHandler(PFEntityKey listeningEntity, 
    PFEntityKey invitingEntity, string connectionString);
```

| parameter | description |
| --- | --- |
| listeningEntity | The entity which is listening for invites and which has been invited. |
| invitingEntity | The entity which has invited the `listeningEntity` to a lobby. |
| connectionString | The connection string of the lobby to which the `listeningEntity` has been invited. |

## See Also

* class [PFEntityKey](./PFEntityKey.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

