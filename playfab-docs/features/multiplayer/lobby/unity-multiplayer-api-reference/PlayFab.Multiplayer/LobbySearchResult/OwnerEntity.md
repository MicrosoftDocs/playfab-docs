---
author: vicodex
title: LobbySearchResult.OwnerEntity
description: LobbySearchResult.OwnerEntity
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbySearchResult.OwnerEntity property

The current owner of the lobby.

```csharp
public PFEntityKey OwnerEntity { get; }
```

## Remarks

`LobbySearchResult.OwnerEntity` may be null if the lobby doesn't currently have an owner.

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [LobbySearchResult](../LobbySearchResult.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

