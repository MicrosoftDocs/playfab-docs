---
author: vicodex
title: PlayFabMultiplayer.JoinArrangedLobby
description: PlayFabMultiplayer.JoinArrangedLobby
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.JoinArrangedLobby

## Method (1 of 2)

Joins a lobby using an arrangement string provided by another service, such as matchmaking. If no one has joined the lobby yet, the lobby is initialized using the configuration parameters.

```csharp
public static Lobby JoinArrangedLobby(PFEntityKey newMember, string arrangementString, 
    LobbyArrangedJoinConfiguration config)
```

| parameter | description |
| --- | --- |
| newMember | The local PlayFab entity joining the lobby. |
| arrangementString | The arrangement string used by the entity to join the lobby. |
| config | The initial configuration data used to initialize the lobby, if no one has joined the lobby yet. |

## Return Value (1 of 2)

Output lobby object which can be used to queue operations for immediate execution of this operation

## Remarks (1 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyMemberAdded`](./OnLobbyMemberAdded.md) followed by a [`OnLobbyJoinArrangedLobbyCompleted`](./OnLobbyJoinArrangedLobbyCompleted.md) with the `OnLobbyJoinArrangedLobbyCompleted.result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnLobbyJoinArrangedLobbyCompleted`](./OnLobbyJoinArrangedLobbyCompleted.md) with the with the `result` field set to a failure.

When using matchmaking through this library, the [`LobbyArrangementString`](../MatchmakingMatchDetails/LobbyArrangementString.md) can be used with this method to join a lobby with all of the users that have been matched together.

---

## Method (2 of 2)

Joins a lobby using an arrangement string provided by another service, such as matchmaking. If no one has joined the lobby yet, the lobby is initialized using the configuration parameters.

```csharp
public static Lobby JoinArrangedLobby(PlayFabAuthenticationContext newMember, 
    string arrangementString, LobbyArrangedJoinConfiguration config)
```

| parameter | description |
| --- | --- |
| newMember | The local PlayFab entity joining the lobby. |
| arrangementString | The arrangement string used by the entity to join the lobby. |
| config | The initial configuration data used to initialize the lobby, if no one has joined the lobby yet. |

## Return Value (2 of 2)

Output lobby object which can be used to queue operations for immediate execution of this operation

## Remarks (2 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyMemberAdded`](./OnLobbyMemberAdded.md) followed by a [`OnLobbyJoinArrangedLobbyCompleted`](./OnLobbyJoinArrangedLobbyCompleted.md) with the `OnLobbyJoinArrangedLobbyCompleted.result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnLobbyJoinArrangedLobbyCompleted`](./OnLobbyJoinArrangedLobbyCompleted.md) with the with the `result` field set to a failure.

When using matchmaking through this library, the [`LobbyArrangementString`](../MatchmakingMatchDetails/LobbyArrangementString.md) can be used with this method to join a lobby with all of the users that have been matched together.

## See Also

* class [Lobby](../Lobby.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [LobbyArrangedJoinConfiguration](../LobbyArrangedJoinConfiguration.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

