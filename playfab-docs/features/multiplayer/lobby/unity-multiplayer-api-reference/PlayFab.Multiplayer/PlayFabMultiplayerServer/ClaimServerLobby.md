---
author: nassosterz-ms
title: ClaimServerLobby
description: ClaimServerLobby
ms.author: aterzakis
ms.topic: reference
ms.service: playfab
ms.date: 08/02/2023
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.ClaimServerLobby method

Claim ownership of a pre-existing server lobby.

## PlayFabMultiplayer.PlayFabMultiplayerServer.ClaimServerLobby (1 of 2)

```csharp
public static Lobby ClaimServerLobby(PFEntityKey server, string lobbyId)
```

| parameter | description |
| --- | --- |
| server | The PlayFab Entity Key of the game server creating the lobby. It's entity type must be game_server. |
| lobbyId | The ID of the Lobby to claim. |

---

## PlayFabMultiplayer.PlayFabMultiplayerServer.ClaimServerLobby (2 of 2)

```csharp
public static Lobby PlayFabMultiplayerServer.ClaimServerLobby(PlayFabAuthenticationContext server, string lobbyId)
```

| parameter | description |
| --- | --- |
| server | The PlayFab Authentication Context of the game server creating the lobby. It's entity type must be game_server. |
| lobbyId | The ID of the Lobby to claim. |

## Remarks

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnServerLobbyClaimCompleted`](OnServerLobbyClaimCompleted.md) with the result field set to `LobbyStateChangeResult.Succeeded`. Upon a failed completion, the title will be provided a [`OnServerLobbyClaimCompleted`](OnServerLobbyClaimCompleted.md) with the result field set to a failure.

While this method is present in the unified, cross-platform header, it is only implemented for Windows and, Xbox. The method will return errors on other platforms.

## See Also

* class [Lobby](../Lobby.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [LobbyCreateConfiguration](../LobbyCreateConfiguration.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

