---
author: vicodex
title: PlayFabMultiplayer.OnErrorEventHandler
description: PlayFabMultiplayer.OnErrorEventHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnErrorEventHandler delegate

Handler for when there is an error calling another API to be used for debugging purposes.

```csharp
public delegate void OnErrorEventHandler(PlayFabMultiplayerErrorArgs args);
```

| parameter | description |
| --- | --- |
| args | The error args containing the error message and error code |

## See Also

* class [PlayFabMultiplayerErrorArgs](./PlayFabMultiplayerErrorArgs.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

