---
author: raymondcha
title: LobbyServerDataUpdate class
description: This document describes the LobbyServerDataUpdate class.
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# LobbyServerDataUpdate class

A request to make an update to the associated server state of a client-owned lobby.

```csharp
public class LobbyServerDataUpdate
```

## Public Members

| name | description |
| --- | --- |
| [LobbyServerDataUpdate](LobbyServerDataUpdate/LobbyServerDataUpdate.md)() | The default constructor. |
| [NewServer](LobbyServerDataUpdate/NewServer.md) { get; set; } | An optional, new server to be associated with the client-owned lobby. |
| [SearchProperties](LobbyServerDataUpdate/SearchProperties.md) { get; set; } | The server properties to update. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

