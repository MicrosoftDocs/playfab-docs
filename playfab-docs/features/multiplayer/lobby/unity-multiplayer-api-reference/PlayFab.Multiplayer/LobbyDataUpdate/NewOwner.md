---
author: vicodex
title: LobbyDataUpdate.NewOwner
description: LobbyDataUpdate.NewOwner
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyDataUpdate.NewOwner property

An optional, new owner of the lobby.

```csharp
public PFEntityKey NewOwner { get; set; }
```

## Remarks

This value can only be updated under one of the following conditions: ` * The member updating this field is the lobby's current owner ` * The owner migration policy is `LobbyOwnerMigrationPolicy.Manual` and there is currently no owner ` * The owner migration policy is `LobbyOwnerMigrationPolicy.None`

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [LobbyDataUpdate](../LobbyDataUpdate.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
