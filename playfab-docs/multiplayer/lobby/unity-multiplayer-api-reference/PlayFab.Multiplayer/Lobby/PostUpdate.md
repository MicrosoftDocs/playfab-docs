---
author: vicodex
title: Lobby.PostUpdate
description: Lobby.PostUpdate
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Lobby.PostUpdate

## Method (1 of 6)

Post an update to the lobby.

```csharp
public void PostUpdate(PFEntityKey localUser, IDictionary<string, string> memberProperties)
```

| parameter | description |
| --- | --- |
| localUser | The local user posting the update. |
| memberProperties | The member properties to update for the updating member. |

## Remarks (1 of 6)

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to a failed error code. If applying the update would change the state of the lobby, the title is provided a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) sometime afterwards.

This operation completing successfully only indicates that the Lobby service has accepted the update. The title's local view of the Lobby state won't reflect this update until a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) is provided to the title with the updated state.

---

## Method (2 of 6)

Post an update to the lobby.

```csharp
public void PostUpdate(PFEntityKey localUser, LobbyDataUpdate lobbyUpdate)
```

| parameter | description |
| --- | --- |
| localUser | The local user posting the update. |
| lobbyUpdate | An optional update to apply to the shared portion of the lobby on behalf of *localUser*. |

## Remarks (2 of 6)

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to a failed error code. If applying the update would change the state of the lobby, the title is provided a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) sometime afterwards.

This operation completing successfully only indicates that the Lobby service has accepted the update. The title's local view of the Lobby state won't reflect this update until a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) is provided to the title with the updated state.

The *lobbyUpdate* contains fields that can only be modified by the owner of the lobby. This method fails and [`OnError`](../PlayFabMultiplayer/OnError.md) is called if one of those fields is specified and *localUser* is not the owner of the lobby.

---

## Method (3 of 6)

Post an update to the lobby.

```csharp
public void PostUpdate(PlayFabAuthenticationContext localUser, 
    IDictionary<string, string> memberProperties)
```

| parameter | description |
| --- | --- |
| localUser | The local user posting the update. |
| memberProperties | The member properties to update for the updating member. |

## Remarks (3 of 6)

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to a failed error code. If applying the update would change the state of the lobby, the title is provided a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) sometime afterwards.

This operation completing successfully only indicates that the Lobby service has accepted the update. The title's local view of the Lobby state won't reflect this update until a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) is provided to the title with the updated state.

---

## Method (4 of 6)

Post an update to the lobby.

```csharp
public void PostUpdate(PlayFabAuthenticationContext localUser, LobbyDataUpdate lobbyUpdate)
```

| parameter | description |
| --- | --- |
| localUser | The local user posting the update. |
| lobbyUpdate | An optional update to apply to the shared portion of the lobby on behalf of *localUser*. |

## Remarks (4 of 6)

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to a failed error code. If applying the update would change the state of the lobby, the title is provided a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) sometime afterwards.

This operation completing successfully only indicates that the Lobby service has accepted the update. The title's local view of the Lobby state won't reflect this update until a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) is provided to the title with the updated state.

The *lobbyUpdate* contains fields that can only be modified by the owner of the lobby. This method fails and [`OnError`](../PlayFabMultiplayer/OnError.md) is called if one of those fields is specified and *localUser* is not the owner of the lobby.

---

## Method (5 of 6)

Post an update to the lobby.

```csharp
public void PostUpdate(PFEntityKey localUser, LobbyDataUpdate lobbyUpdate, 
    IDictionary<string, string> memberProperties)
```

| parameter | description |
| --- | --- |
| localUser | The local user posting the update. |
| lobbyUpdate | An update to apply to the shared portion of the lobby on behalf of *localUser*. |
| memberProperties | The member properties to update for the updating member. |

## Remarks (5 of 6)

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to a failed error code. If applying the update would change the state of the lobby, the title is provided a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) sometime afterwards.

This operation completing successfully only indicates that the Lobby service has accepted the update. The title's local view of the Lobby state won't reflect this update until a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) is provided to the title with the updated state.

The *lobbyUpdate* contains fields that can only be modified by the owner of the lobby. This method fails and [`OnError`](../PlayFabMultiplayer/OnError.md) is called if one of those fields is specified and *localUser* is not the owner of the lobby.

---

## Method (6 of 6)

Post an update to the lobby.

```csharp
public void PostUpdate(PlayFabAuthenticationContext localUser, LobbyDataUpdate lobbyUpdate, 
    IDictionary<string, string> memberProperties)
```

| parameter | description |
| --- | --- |
| localUser | The local user posting the update. |
| lobbyUpdate | An update to apply to the shared portion of the lobby on behalf of *localUser*. |
| memberProperties | The member properties to update for the updating member. |

## Remarks (6 of 6)

This is an asynchronous operation. Upon successful completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title is provided a [`OnLobbyPostUpdateCompleted`](../PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) with the `OnLobbyPostUpdateCompleted result` field set to a failed error code. If applying the update would change the state of the lobby, the title is provided a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) sometime afterwards.

This operation completing successfully only indicates that the Lobby service has accepted the update. The title's local view of the Lobby state won't reflect this update until a [`OnLobbyUpdated`](../PlayFabMultiplayer/OnLobbyUpdated.md) is provided to the title with the updated state.

The *lobbyUpdate* contains fields that can only be modified by the owner of the lobby. This method fails and [`OnError`](../PlayFabMultiplayer/OnError.md) is called if one of those fields is specified and *localUser* is not the owner of the lobby.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [LobbyDataUpdate](../LobbyDataUpdate.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

