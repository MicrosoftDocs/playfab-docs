---
author: vicodex
title: PlayFabMultiplayer.Initialize
description: PlayFabMultiplayer.Initialize
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.Initialize method

Initializes an instance of the PlayFab Multiplayer library.

```csharp
public static void Initialize()
```

## Remarks

Initialize() cannot be called again without a subsequent [`Uninitialize`](./Uninitialize.md) call.

Every call to Initialize() should have a corresponding Uninitialize() call.

The playFabTitleId is read from PlayFab's static PlayFabSettings asset. It can be changed Using Unity menu, PlayFab &#x7C; MakePlayFabSharedSettings menu. It must be the same PlayFab Title ID used to acquire the PlayFab Entity Keys and Entity Tokens that will be passed to [`SetEntityToken`](./SetEntityToken.md).

## See Also

* method [Uninitialize](./Uninitialize.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

