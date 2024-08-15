---
author: vicodex
title: PlayFabMultiplayer.FindLobbies
description: PlayFabMultiplayer.FindLobbies
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.FindLobbies

## Method (1 of 2)

Search for lobbies on behalf of the local user.

```csharp
public static void FindLobbies(PFEntityKey searchingEntity, 
    LobbySearchConfiguration searchConfiguration)
```

| parameter | description |
| --- | --- |
| searchingEntity | The PlayFab entity performing the search. |
| searchConfiguration | The configuration used to filter and sort the searched lobbies. |

## Remarks (1 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyFindLobbiesCompleted`](./OnLobbyFindLobbiesCompleted.md) with the with the `OnLobbyFindLobbiesCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a Upon a failed completion, the title will be provided a [`OnLobbyFindLobbiesCompleted`](./OnLobbyFindLobbiesCompleted.md) with the `OnLobbyFindLobbiesCompleted result` field set to a failed error code.

---

## Method (2 of 2)

Search for lobbies on behalf of the local user.

```csharp
public static void FindLobbies(PlayFabAuthenticationContext searchingEntity, 
    LobbySearchConfiguration searchConfiguration)
```

| parameter | description |
| --- | --- |
| searchingEntity | The PlayFab entity performing the search. |
| searchConfiguration | The configuration used to filter and sort the searched lobbies. |

## Remarks (2 of 2)

This is an asynchronous operation. Upon successful completion, the title will be provided a [`OnLobbyFindLobbiesCompleted`](./OnLobbyFindLobbiesCompleted.md) with the with the `OnLobbyFindLobbiesCompleted result` field set to [`Success`](../LobbyError/Success.md). Upon a failed completion, the title will be provided a Upon a failed completion, the title will be provided a [`OnLobbyFindLobbiesCompleted`](./OnLobbyFindLobbiesCompleted.md) with the `OnLobbyFindLobbiesCompleted result` field set to a failed error code.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [LobbySearchConfiguration](../LobbySearchConfiguration.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
