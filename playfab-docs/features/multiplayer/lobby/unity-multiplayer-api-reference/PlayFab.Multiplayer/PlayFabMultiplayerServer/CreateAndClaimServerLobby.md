---
author: nassosterz-ms
title: CreateAndClaimServerLobby
description: CreateAndClaimServerLobby
ms.author: aterzakis
ms.topic: reference
ms.service: playfab
ms.date: 08/02/2023
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.CreateAndClaimServerLobby method

Create a new lobby as a game_server entity.

## PlayFabMultiplayer.PlayFabMultiplayerServer.CreateAndClaimServerLobby (1 of 2)

```csharp
public static Lobby CreateAndClaimServerLobby(PFEntityKey server, 
    LobbyCreateConfiguration createConfiguration)
```

| parameter | description |
| --- | --- |
| server | The PlayFab Entity Key of the game server creating the lobby. It's entity type must be game_server. |
| createConfiguration | The initial configuration data used when creating the lobby. |

---

## PlayFabMultiplayer.PlayFabMultiplayerServer.CreateAndClaimServerLobby (2 of 2)

```csharp
public static Lobby PlayFabMultiplayerServer.CreateAndClaimServerLobby(PlayFabAuthenticationContext server, 
    LobbyCreateConfiguration createConfiguration)
```

| parameter | description |
| --- | --- |
| server | The PlayFab Authentication Context of the game server creating the lobby. It's entity type must be game_server. |
| createConfiguration | The initial configuration data used when creating the lobby. |

## Remarks

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnServerLobbyCreateAndClaimCompleted`](OnServerLobbyCreateAndClaimCompleted.md) with the result field set to `LobbyStateChangeResult.Succeeded`. Upon a failed completion, the title will be provided a [`OnServerLobbyCreateAndClaimCompleted`](OnServerLobbyCreateAndClaimCompleted.md) with the result field set to a failure.

While this method is present in the unified, cross-platform header, it is only implemented for Windows and, Xbox.
The method will return errors on other platforms.

## See Also

* class [Lobby](../Lobby.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [LobbyCreateConfiguration](../LobbyCreateConfiguration.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

