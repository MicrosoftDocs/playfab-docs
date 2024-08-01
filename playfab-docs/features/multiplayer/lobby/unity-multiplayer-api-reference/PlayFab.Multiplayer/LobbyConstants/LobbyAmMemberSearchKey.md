---
author: nassosterz-ms
title: LobbyConstants.LobbyAmMemberSearchKey
description: Lobby.LobbyAmMemberSearchKey
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# LobbyConstants.LobbyAmMemberSearchKey field

A special, predefined search key, which can be used in the [`FilterString`](../LobbySearchConfiguration/FilterString.md) filtering string to search for lobbies that you're currently a member of.

```csharp
public static readonly string LobbyAmMemberSearchKey;
```

## Remarks

Example: "lobby/amMember eq true"

## See Also

* class [LobbyConstants](../LobbyConstants.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

