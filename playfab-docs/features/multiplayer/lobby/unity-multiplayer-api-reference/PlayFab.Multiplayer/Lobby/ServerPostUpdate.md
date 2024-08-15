---
author: nassosterz-ms
title: Lobby.ServerPostUpdate
description: Lobby.ServerPostUpdate
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# Lobby.ServerPostUpdate method

Post an update to the lobby as the server-owner.

```csharp
public void ServerPostUpdate(LobbyDataUpdate lobbyUpdate)
```

| parameter | description |
| --- | --- |
| lobbyUpdate | An update to apply to the shared portion of the lobby on behalf of the server owner. |

## Remarks

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnServerLobbyPostUpdateCompleted`](../PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyPostUpdateCompleted.md) with the `OnServerLobbyPostUpdateCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnServerLobbyPostUpdateCompleted`](../PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyPostUpdateCompleted.md) with the `OnServerLobbyPostUpdateCompleted result` field set to a failed error code. If applying the update would change the state of the lobby, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) sometime afterwards.

This operation completing successfully only indicates that the Lobby service has accepted the update. The title's local view of the lobby state won't reflect this update until a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) is provided to the title with the updated state.

While this method is present in the unified, cross-platform header, it is only implemented for Windows and, Xbox. The method returns errors on other platforms.

## See Also

* class [LobbyDataUpdate](../LobbyDataUpdate.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

