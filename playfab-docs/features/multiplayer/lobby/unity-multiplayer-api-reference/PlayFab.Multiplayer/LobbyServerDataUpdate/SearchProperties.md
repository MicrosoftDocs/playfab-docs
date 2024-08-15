---
author: raymondcha
title: LobbyServerDataUpdate.SearchProperties
description: LobbyServerDataUpdate.SearchProperties
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# LobbyServerDataUpdate.SearchProperties property

The server properties to update.

```csharp
public IDictionary<string, string> SearchProperties { get; set; }
```

## Remarks

There might only be `PFLobbyMaxServerPropertyCount` concurrent properties at any given time. Therefore, at most, twice that many unique properties can be specified in this update if half of those properties are being deleted.

If the property limits are violated, the entire update operation fails.

## See Also

* class [LobbyServerDataUpdate](../LobbyServerDataUpdate.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

