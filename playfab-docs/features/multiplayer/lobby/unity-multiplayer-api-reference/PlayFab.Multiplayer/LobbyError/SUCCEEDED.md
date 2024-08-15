---
author: vicodex
title: LobbyError.SUCCEEDED
description: LobbyError.SUCCEEDED
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyError.SUCCEEDED method

Generic test for success on any status value (non-negative numbers indicate success).

```csharp
public static bool SUCCEEDED(int error)
```

| parameter | description |
| --- | --- |
| error | Error code of an operation |

## Return Value

True for success on any status value, false othwerwise.

## See Also

* class [LobbyError](../LobbyError.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

