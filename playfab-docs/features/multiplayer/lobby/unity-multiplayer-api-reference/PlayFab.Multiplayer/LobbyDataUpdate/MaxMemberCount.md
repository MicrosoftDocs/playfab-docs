---
author: vicodex
title: LobbyDataUpdate.MaxMemberCount
description: LobbyDataUpdate.MaxMemberCount
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyDataUpdate.MaxMemberCount property

An optional, updated capacity for the number of members in this lobby.

```csharp
public uint? MaxMemberCount { get; set; }
```

## Remarks

This new value must be greater than than the number of members currently in the lobby and less than `LobbyMaxMemberCountUpperLimit`.

This value can only be updated by the current lobby owner.

## See Also

* class [LobbyDataUpdate](../LobbyDataUpdate.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

