---
author: raymondcha
title: LobbyServerDataUpdate.NewServer
description: LobbyServerDataUpdate.NewServer
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# LobbyServerDataUpdate.NewServer property

An optional, new server to be associated with the client-owned lobby.

```csharp
public PFEntityKey NewServer { get; set; }
```

## Remarks

If specified, this entity must be a game_server entity.

There can only be one server associated with a lobby at a time. Setting a new server here replaces the currently associated server in the lobby.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [LobbyServerDataUpdate](../LobbyServerDataUpdate.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

