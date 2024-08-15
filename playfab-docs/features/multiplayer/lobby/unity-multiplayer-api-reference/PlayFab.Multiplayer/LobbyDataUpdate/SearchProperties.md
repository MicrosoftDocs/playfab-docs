---
author: vicodex
title: LobbyDataUpdate.SearchProperties
description: LobbyDataUpdate.SearchProperties
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyDataUpdate.SearchProperties property

The search properties to update.

```csharp
public IDictionary<string, string> SearchProperties { get; set; }
```

## Remarks

Only the current lobby owner can update the search properties.

There may only be `PlayFabMultiplayer.LobbyMaxSearchPropertyCount` concurrent search properties at any given time. Therefore, at most, twice that many unique properties can be specified in this update if half of those properties are being deleted.

If the property limits are violated, the entire update operation will fail.

## See Also

* class [LobbyDataUpdate](../LobbyDataUpdate.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

