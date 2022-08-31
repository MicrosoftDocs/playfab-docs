---
author: vicodex
title: PlayFabMultiplayer.GetLobbyInviteListenerStatus
description: PlayFabMultiplayer.GetLobbyInviteListenerStatus
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.GetLobbyInviteListenerStatus method
## PlayFabMultiplayer.GetLobbyInviteListenerStatus (1 of 2)

Retrieve the status of the entity's invite listener.

```csharp
public static LobbyInviteListenerStatus GetLobbyInviteListenerStatus(PFEntityKey listeningEntity)
```

| parameter | description |
| --- | --- |
| listeningEntity | The entity which is listening for invites. |

## Return Value 1

The output status value.

## Remarks 1

This value is used to understand the state of an entity's invite listener. If the invite listener encounters a fatal error, non-fatal error, or diagnostic change, the listener's status value will reflect it.

When the invite listener's status changes, a [`OnLobbyInviteListenerStatusChanged`](./OnLobbyInviteListenerStatusChanged.md) struct will be provided by !:PlayFabMultiplayer.OnMultiplayerStartProcessingLobby. This method can then be called to retrieve the latest status and act accordingly.

## See Also 1

* enum [LobbyInviteListenerStatus](../LobbyInviteListenerStatus.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

---

## PlayFabMultiplayer.GetLobbyInviteListenerStatus (2 of 2)

Retrieve the status of the entity's invite listener.

```csharp
public static LobbyInviteListenerStatus GetLobbyInviteListenerStatus(
    PlayFabAuthenticationContext listeningEntity)
```

| parameter | description |
| --- | --- |
| listeningEntity | The entity which is listening for invites. |

## Return Value 2

The output status value.

## Remarks 2

This value is used to understand the state of an entity's invite listener. If the invite listener encounters a fatal error, non-fatal error, or diagnostic change, the listener's status value will reflect it.

When the invite listener's status changes, a [`OnLobbyInviteListenerStatusChanged`](./OnLobbyInviteListenerStatusChanged.md) struct will be provided by !:PlayFabMultiplayer.OnMultiplayerStartProcessingLobby. This method can then be called to retrieve the latest status and act accordingly.

## See Also 2

* enum [LobbyInviteListenerStatus](../LobbyInviteListenerStatus.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

