---
author: nassosterz-ms
title: Lobby.LobbyMemberCountSearchKey
description: Lobby.LobbyMemberCountSearchKey
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# LobbyConstants.LobbyMemberCountSearchKey field

A special, predefined search key, which can be used in the [`FilterString`](../LobbySearchConfiguration/FilterString.md) filtering and sorting strings to search for lobbies based on the current number of members in the lobby.

```csharp
public static readonly string LobbyMemberCountSearchKey;
```

## Remarks

Example: "lobby/memberCount lt 5"

## See Also

* class [LobbyConstants](../LobbyConstants.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

