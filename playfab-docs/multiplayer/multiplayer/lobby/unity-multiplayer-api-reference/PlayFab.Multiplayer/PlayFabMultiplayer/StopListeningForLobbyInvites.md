---
author: vicodex
title: PlayFabMultiplayer.StopListeningForLobbyInvites
description: PlayFabMultiplayer.StopListeningForLobbyInvites
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.StopListeningForLobbyInvites

## Method (1 of 2)

Disables the Lobby invite listener for a given entity.

```csharp
public static void StopListeningForLobbyInvites(PFEntityKey listeningEntity)
```

| parameter | description |
| --- | --- |
| listeningEntity | The entity which is listening for invites. |

## Remarks (1 of 2)

This operation will synchronously stop listening for invites on behalf of the provided entity.

Invite notifications which have already been queued internally will still be provided via the next call to [`ProcessLobbyStateChanges`](./ProcessLobbyStateChanges.md).

Lobby invites and this invite listener are unrelated to and unaffected by platform invite mechanisms.

This method may only be called if the Lobby invite listener is already enabled for the given entity.

---

## Method (2 of 2)

Disables the Lobby invite listener for a given entity.

```csharp
public static void StopListeningForLobbyInvites(PlayFabAuthenticationContext listeningEntity)
```

| parameter | description |
| --- | --- |
| listeningEntity | The entity which is listening for invites. |

## Remarks (2 of 2)

This operation will synchronously stop listening for invites on behalf of the provided entity.

Invite notifications which have already been queued internally will still be provided via the next call to [`ProcessLobbyStateChanges`](./ProcessLobbyStateChanges.md).

Lobby invites and this invite listener are unrelated to and unaffected by platform invite mechanisms.

This method may only be called if the Lobby invite listener is already enabled for the given entity.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
