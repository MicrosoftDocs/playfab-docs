---
author: vicodex
title: PlayFabMultiplayer.OnLobbyMemberRemovedHandler
description: PlayFabMultiplayer.OnLobbyMemberRemovedHandlers
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnLobbyMemberRemovedHandler delegate

Handler for when a PlayFab entity was removed from a lobby as a member.

```csharp
public delegate void OnLobbyMemberRemovedHandler(Lobby lobby, PFEntityKey member, 
    LobbyMemberRemovedReason reason);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| member | The member entity which has been removed from the lobby. |
| reason | The reason `member` was removed from the lobby. |

## See Also

* class [Lobby](./Lobby.md)
* class [PFEntityKey](./PFEntityKey.md)
* enum [LobbyMemberRemovedReason](./LobbyMemberRemovedReason.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

