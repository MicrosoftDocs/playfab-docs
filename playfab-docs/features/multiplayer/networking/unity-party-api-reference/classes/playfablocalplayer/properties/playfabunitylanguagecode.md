---
author: vicodex
title: PlayFabLocalPlayer.LanguageCode
description: Gets or sets the language code for the player.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# LanguageCode

Gets or sets the language code for the player.

Currently, setting the language will only have effect before creating or joining a Party network.

```csharp
public string PlayFabLocalPlayer.LanguageCode { get; set; }
```

## Property Value

LanguageCode

[string](/dotnet/api/system.string?view=netcore-3.1&preserve-view=true)

The BCP 47 language code associated with the player.
