---
author: vicodex
title: Lobby.SendInvite
description: Lobby.SendInvite
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.SendInvite

## Method (1 of 2)

Send an invite to this lobby from the local user to the invited entity.

```csharp
public void SendInvite(PFEntityKey sender, PFEntityKey invitee)
```

| parameter | description |
| --- | --- |
| sender | The local user sending the invite. |
| invitee | The invited entity. |

## Remarks (1 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbySendInviteCompleted`](../PlayFabMultiplayer/OnLobbySendInviteCompleted.md) with the `OnLobbySendInviteCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnLobbySendInviteCompleted`](../PlayFabMultiplayer/OnLobbySendInviteCompleted.md) with the `OnLobbySendInviteCompleted result` field set to a failed error code.

The *sender* must be a local user of this lobby which joined from this client.

---

## Method (2 of 2)

Send an invite to this lobby from the local user to the invited entity.

```csharp
public void SendInvite(PlayFabAuthenticationContext sender, PFEntityKey invitee)
```

| parameter | description |
| --- | --- |
| sender | The local user sending the invite. |
| invitee | The invited entity. |

## Remarks (2 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbySendInviteCompleted`](../PlayFabMultiplayer/OnLobbySendInviteCompleted.md) with the `OnLobbySendInviteCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a [`OnLobbySendInviteCompleted`](../PlayFabMultiplayer/OnLobbySendInviteCompleted.md) with the `OnLobbySendInviteCompleted result` field set to a failed error code.

The *sender* must be a local user of this lobby which joined from this client.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

