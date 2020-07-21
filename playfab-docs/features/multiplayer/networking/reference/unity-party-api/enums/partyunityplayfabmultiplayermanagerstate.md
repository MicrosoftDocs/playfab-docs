---
author: vicodex
title: PlayFabMultiplayerManagerState
description: The possible states that the PlayFabMultiplayerManager can be in.
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 06/22/2020
---

# PlayFabMultiplayerManagerState

The possible states that the PlayFabMultiplayerManager can be in.

## Syntax

```csharp
public enum PlayFabMultiplayerManagerState
{
    NotInitialized,
    Initialized,
    ConnectingToNetwork,
    ConnectedToNetwork
}
```

## Constants

| **Constant** | **Description** |
| --- | --- |
| **NotInitialized** | The PlayFabMultiplayerManager is not initialized. |
| **Initialized** | The PlayFabMultiplayerManager is initialized, but not connected to a network. |
| **ConnectingToNetwork** | The PlayFabMultiplayerManager is initialized and in the process of connecting to a network. |
| **ConnectedToNetwork** | The PlayFabMultiplayerManager is initialized and connected to a network. At this point messages can be sent and received. |
