---
author: vicodex
title: DeliveryOption
description: The type of delivery guarantee for a message.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# DeliveryOption

The type of delivery guarantee for a message.

## Syntax

```csharp
public enum DeliveryOption
{
    BestEffort,
    Guaranteed
}
```

## Constants

| **Constant** | **Description** |
| --- | --- |
| **BestEffort** | The message is sent without reliability or sequential guarantees. |
| **Guaranteed** | The message is guaranteed to arrive and in the correct order. |
