---
author: vicodex
title: PlayFabLocalPlayer.IsChatControlAvailable
description: Gets the indication whether chat control is available.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# IsChatControlAvailable

Gets the indication whether any public API that relies on a chat control associated with this player can be safely used. Player's chat control becomes available after the user creates or joins a party.

```csharp
public bool PlayFabLocalPlayer.IsChatControlAvailable { get; }
```

## Property Value

IsChatControlAvailable

[bool]()