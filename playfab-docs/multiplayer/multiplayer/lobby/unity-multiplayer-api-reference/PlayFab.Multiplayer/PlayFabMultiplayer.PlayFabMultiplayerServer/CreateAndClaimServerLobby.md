---
author: nassosterz-ms
title: CreateAndClaimServerLobby
description: CreateAndClaimServerLobby
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.CreateAndClaimServerLobby

## Method (1 of 2)

Create a new lobby as a game_server entity.

```csharp
public static Lobby CreateAndClaimServerLobby(PFEntityKey server, 
    LobbyCreateConfiguration createConfiguration)
```

| parameter | description |
| --- | --- |
| server | The PlayFab Entity Key of the game server creating the lobby. It's entity type must be "game_server". |
| createConfiguration | The initial configuration data used when creating the lobby. |

## Return Value (1 of 2)

Output lobby object which can be used to queue operations for immediate execution of this operation.

## Remarks (1 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnServerLobbyCreateAndClaimCompleted`](./OnServerLobbyCreateAndClaimCompleted.md) with the `OnServerLobbyCreateAndClaimCompleted.result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnServerLobbyCreateAndClaimCompleted`](./OnServerLobbyCreateAndClaimCompleted.md) with the with the `OnServerLobbyCreateAndClaimCompleted.result` field set to a failed error code.

While this method is present in the unified, cross-platform header, it is only implemented for Windows and, Xbox. The method will return errors on other platforms.

---

## Method (2 of 2)

Create a new lobby as a game_server entity.

```csharp
public static Lobby CreateAndClaimServerLobby(PlayFabAuthenticationContext server, 
    LobbyCreateConfiguration createConfiguration)
```

| parameter | description |
| --- | --- |
| server | The PlayFab Entity Key of the game server creating the lobby. It's entity type must be "game_server". |
| createConfiguration | The initial configuration data used when creating the lobby. |

## Return Value (2 of 2)

Output lobby object which can be used to queue operations for immediate execution of this operation.

## Remarks (2 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnServerLobbyCreateAndClaimCompleted`](./OnServerLobbyCreateAndClaimCompleted.md) with the `OnServerLobbyCreateAndClaimCompleted.result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnServerLobbyCreateAndClaimCompleted`](./OnServerLobbyCreateAndClaimCompleted.md) with the with the `OnServerLobbyCreateAndClaimCompleted.result` field set to a failed error code.

While this method is present in the unified, cross-platform header, it is only implemented for Windows and, Xbox. The method will return errors on other platforms.

## See Also

* class [Lobby](../Lobby.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [LobbyCreateConfiguration](../LobbyCreateConfiguration.md)
* class [PlayFabMultiplayerServer](../PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

