---
author: vicodex
title: PlayFabMultiplayer.CreateAndJoinLobby
description: PlayFabMultiplayer.CreateAndJoinLobby
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.CreateAndJoinLobby

## Method (1 of 2)

Create a new lobby and add the creating PlayFab entity to it.

```csharp
public static Lobby CreateAndJoinLobby(PFEntityKey creator, 
    LobbyCreateConfiguration createConfiguration, LobbyJoinConfiguration joinConfiguration)
```

| parameter | description |
| --- | --- |
| creator | The local PlayFab entity creating the lobby. |
| createConfiguration | The initial configuration data used when creating the lobby. |
| joinConfiguration | The initial configuration data for the member creating and joining the lobby. |

## Return Value (1 of 2)

Output lobby object which can be used to queue operations for immediate execution of this operation.

## Remarks (1 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyMemberAdded`](./OnLobbyMemberAdded.md) followed by a [`OnLobbyCreateAndJoinCompleted`](./OnLobbyCreateAndJoinCompleted.md) with the `OnLobbyCreateAndJoinCompleted.result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnLobbyCreateAndJoinCompleted`](./OnLobbyCreateAndJoinCompleted.md) with the `OnLobbyCreateAndJoinCompleted.result` field set to a failed error code.

---

## Method (2 of 2)

Create a new lobby and add the creating PlayFab entity to it.

```csharp
public static Lobby CreateAndJoinLobby(PlayFabAuthenticationContext creator, 
    LobbyCreateConfiguration createConfiguration, LobbyJoinConfiguration joinConfiguration)
```

| parameter | description |
| --- | --- |
| creator | The local PlayFab entity creating the lobby. |
| createConfiguration | The initial configuration data used when creating the lobby. |
| joinConfiguration | The initial configuration data for the member creating and joining the lobby. |

## Return Value (2 of 2)

Output lobby object which can be used to queue operations for immediate execution of this operation.

## Remarks (2 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyMemberAdded`](./OnLobbyMemberAdded.md) followed by a [`OnLobbyCreateAndJoinCompleted`](./OnLobbyCreateAndJoinCompleted.md) with the `OnLobbyCreateAndJoinCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnLobbyCreateAndJoinCompleted`](./OnLobbyCreateAndJoinCompleted.md) with the `OnLobbyCreateAndJoinCompleted result` field set to a failed error code.

## See Also

* class [Lobby](../Lobby.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [LobbyCreateConfiguration](../LobbyCreateConfiguration.md)
* class [LobbyJoinConfiguration](../LobbyJoinConfiguration.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

