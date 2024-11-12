---
author: vicodex
title: LobbyDataUpdate.LobbyProperties
description: LobbyDataUpdate.LobbyProperties
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyDataUpdate.LobbyProperties property

The lobby properties to update.

```csharp
public IDictionary<string, string> LobbyProperties { get; set; }
```

## Remarks

Only the current lobby owner can update the lobby properties.

There may only be `PlayFabMultiplayer.LobbyMaxLobbyPropertyCount` concurrent lobby properties at any given time. Therefore, at most, twice that many unique properties can be specified in this update if half of those properties are being deleted.

If the property limits are violated, the entire update operation will fail.

## See Also

* class [LobbyDataUpdate](../LobbyDataUpdate.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

