---
author: vicodex
title: PlayFabMultiplayer.JoinLobby
description: PlayFabMultiplayer.JoinLobby
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.JoinLobby

## Method (1 of 2)

Join a lobby as the local PlayFab entity.

```csharp
public static Lobby JoinLobby(PFEntityKey newMember, string connectionString, 
    IDictionary<string, string> memberKeyValuePairs)
```

| parameter | description |
| --- | --- |
| newMember | The local entity joining the lobby. |
| connectionString | The connection string used by the entity to join the lobby. |
| memberKeyValuePairs | The number of initial member properties for the joiner of the lobby. |

## Return Value (1 of 2)

Output lobby object which can be used to queue operations for immediate execution of this operation.

## Remarks (1 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyMemberAdded`](./OnLobbyMemberAdded.md) followed by a [`OnLobbyUpdated`](./OnLobbyUpdated.md) and [`OnLobbyJoinCompleted`](./OnLobbyJoinCompleted.md) with the `OnLobbyJoinCompleted.result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnLobbyJoinCompleted`](./OnLobbyJoinCompleted.md) with the `result` field set to a failure.

---

## Method (2 of 2)

Join a lobby as the local PlayFab entity.

```csharp
public static Lobby JoinLobby(PlayFabAuthenticationContext newMember, string connectionString, 
    IDictionary<string, string> memberKeyValuePairs)
```

| parameter | description |
| --- | --- |
| newMember | The local entity joining the lobby. |
| connectionString | The connection string used by the entity to join the lobby. |
| memberKeyValuePairs | The number of initial member properties for the joiner of the lobby. |

## Return Value (2 of 2)

Output lobby object which can be used to queue operations for immediate execution of this operation.

## Remarks (2 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyMemberAdded`](./OnLobbyMemberAdded.md) followed by a [`OnLobbyUpdated`](./OnLobbyUpdated.md) and [`OnLobbyJoinCompleted`](./OnLobbyJoinCompleted.md) with the `OnLobbyJoinCompleted.result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnLobbyJoinCompleted`](./OnLobbyJoinCompleted.md) with the `result` field set to a failure.

## See Also

* class [Lobby](../Lobby.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

