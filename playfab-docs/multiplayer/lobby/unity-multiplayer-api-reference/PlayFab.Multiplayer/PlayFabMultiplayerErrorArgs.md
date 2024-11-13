---
author: vicodex
title: PlayFabMultiplayerErrorArgs
description: PlayFabMultiplayerErrorArgs members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class PlayFabMultiplayerErrorArgs

An event argument class representing a PFMultiplayer error.

```csharp
public class PlayFabMultiplayerErrorArgs : EventArgs
```

## Public Members

| name | description |
| --- | --- |
| [Code](PlayFabMultiplayerErrorArgs/Code.md) { get; protected set; } | Gets the error code indicating the result of the operation. |
| [Message](PlayFabMultiplayerErrorArgs/Message.md) { get; protected set; } | Gets a call-specific error message with debug information. This message is not localized as it is meant to be used for debugging only. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
