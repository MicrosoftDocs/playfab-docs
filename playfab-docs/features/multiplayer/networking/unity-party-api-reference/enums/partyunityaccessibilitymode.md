---
author: vicodex
title: AccessibilityMode
description: Options that specify which accessibility settings are enabled.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# AccessibilityMode

Options that specify which accessibility settings are enabled.

## Syntax

```csharp
public enum AccessibilityMode
{
    None,
    PlatformDefault,
    Enabled
}
```

## Constants

| **Constant** | **Description** |
| --- | --- |
| **None** | No accessibility settings are enabled. |
| **PlatformDefault** | The accessibility settings are enabled based on the user and/or platform's settings. |
| **Enabled** | The accessibility settings are always enabled. |