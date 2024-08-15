---
author: vicodex
title: LobbyDataUpdate.AccessPolicy
description: LobbyDataUpdate.AccessPolicy
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyDataUpdate.AccessPolicy property

An optional, updated access policy for this lobby.

```csharp
public LobbyAccessPolicy? AccessPolicy { get; set; }
```

## Remarks

This value can only be updated by the current lobby owner.

## See Also

* enum [LobbyAccessPolicy](../LobbyAccessPolicy.md)
* class [LobbyDataUpdate](../LobbyDataUpdate.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

