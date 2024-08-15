---
author: vicodex
title: LobbyCreateConfiguration.OwnerMigrationPolicy
description: LobbyCreateConfiguration.OwnerMigrationPolicy
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyCreateConfiguration.OwnerMigrationPolicy property

The owner migration policy for the new lobby.

```csharp
public LobbyOwnerMigrationPolicy OwnerMigrationPolicy { get; set; }
```

## Remarks

This value cannot be set to `LobbyOwnerMigrationPolicy.Server`.

## See Also

* enum [LobbyOwnerMigrationPolicy](../LobbyOwnerMigrationPolicy.md)
* class [LobbyCreateConfiguration](../LobbyCreateConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

