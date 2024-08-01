---
author: vicodex
title: PFEntityKey class
description: PFEntityKey members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class PFEntityKey

PFEntityKey data model. Combined entity type and ID structure which uniquely identifies a single entity.

```csharp
public class PFEntityKey
```

## Public Members

| name | description |
| --- | --- |
| [PFEntityKey](PFEntityKey/PFEntityKey.md)(…) | Initializes a new instance of the [`PFEntityKey`](./PFEntityKey.md) class. Pass in a PlayFabAuthenticationContext *authContext* returned by a PlayFab login method. (2 constructors) |
| [Id](PFEntityKey/Id.md) { get; set; } | Unique ID of the entity. |
| [Type](PFEntityKey/Type.md) { get; set; } | Entity type. See //docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types. |

## Remarks

For more information about entities, see //docs.microsoft.com/gaming/playfab/features/data/entities/.

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
