---
author: vicodex
title: PFEntityKey class
description: PFEntityKey members
ms.author: victorku
ms.topic: reference
ms.service: playfab
ms.date: 11/23/2021
---

# Class PFEntityKey

PFEntityKey data model. Combined entity type and ID structure which uniquely identifies a single entity.

```csharp
public class PFEntityKey
```

## Constructors

| name | description |
| --- | --- |
| [PFEntityKey](PFEntityKey/PFEntityKey.md) | Initializes a new instance of the [`PFEntityKey`](./PFEntityKey.md) class. Pass in a PlayFabAuthenticationContext *authContext* returned by a PlayFab login method. (2 constructors) |

## Properties

| name | description |
| --- | --- |
| [Id](PFEntityKey/Id.md) | Unique ID of the entity. |
| [Type](PFEntityKey/Type.md) | Entity type. See [Available built-in entity types](/gaming/playfab/features/data/entities/available-built-in-entity-types). |

## Remarks

For more information about entities, see [Entity Programming Model](/gaming/playfab/features/data/entities/).

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
