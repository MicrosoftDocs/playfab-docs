---
author: vicodex
title: PlayFabMultiplayer.StartListeningForLobbyInvites
description: PlayFabMultiplayer.StartListeningForLobbyInvites
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.StartListeningForLobbyInvites method
## PlayFabMultiplayer.StartListeningForLobbyInvites (1 of 2)

Enables the Lobby invite listener for a given entity.

```csharp
public static void StartListeningForLobbyInvites(PFEntityKey listeningEntity)
```

| parameter | description |
| --- | --- |
| listeningEntity | The entity which will listen for invites. |

## Remarks 1

This operation will synchronously start listening for invites on behalf of the provided entity. When invites are received, they will be provided via [`OnLobbyInviteReceived`](./OnLobbyInviteReceived.md) events. When the status of the invite listener changes, notifications will be provided via [`OnLobbyInviteListenerStatusChanged`](./OnLobbyInviteListenerStatusChanged.md) events.

Only invites sent after the listener has been started will be received on this client. Invites sent while this listener is not active will not be queued.

Invite listening is, by default, disabled for all entities. This method should be called for each local entity that the title wants to receive Lobby invites.

Lobby invites and this invite listener are unrelated to and unaffected by platform invite mechanisms.

This method may only be called if the Lobby invite listener is not already enabled for the given entity.

## See Also 1

* class [PFEntityKey](../PFEntityKey.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

---

## PlayFabMultiplayer.StartListeningForLobbyInvites (2 of 2)

Enables the Lobby invite listener for a given entity.

```csharp
public static void StartListeningForLobbyInvites(PlayFabAuthenticationContext listeningEntity)
```

| parameter | description |
| --- | --- |
| listeningEntity | The entity which will listen for invites. |

## Remarks 2

This operation will synchronously start listening for invites on behalf of the provided entity. When invites are received, they will be provided via [`OnLobbyInviteReceived`](./OnLobbyInviteReceived.md) events. When the status of the invite listener changes, notifications will be provided via [`OnLobbyInviteListenerStatusChanged`](./OnLobbyInviteListenerStatusChanged.md) events.

Only invites sent after the listener has been started will be received on this client. Invites sent while this listener is not active will not be queued.

Invite listening is, by default, disabled for all entities. This method should be called for each local entity that the title wants to receive Lobby invites.

Lobby invites and this invite listener are unrelated to and unaffected by platform invite mechanisms.

This method may only be called if the Lobby invite listener is not already enabled for the given entity.

## See Also 2

* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

