---
author: vicodex
title: LobbyArrangedJoinConfiguration.OwnerMigrationPolicy
description: LobbyArrangedJoinConfiguration.OwnerMigrationPolicy
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyArrangedJoinConfiguration.OwnerMigrationPolicy property

The owner migration policy for the lobby, if the joiner is the first member in the lobby.

```csharp
public LobbyOwnerMigrationPolicy OwnerMigrationPolicy { get; set; }
```

## Remarks

This value cannot be set to `LobbyOwnerMigrationPolicy.Server`.

## See Also

* enum [LobbyOwnerMigrationPolicy](../LobbyOwnerMigrationPolicy.md)
* class [LobbyArrangedJoinConfiguration](../LobbyArrangedJoinConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

