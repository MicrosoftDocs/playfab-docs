---
author: vicodex
title: PlayFabMultiplayerManagerState
description: The possible states that PlayFabMultiplayerManager can be in.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# PlayFabMultiplayerManagerState

The possible states that `PlayFabMultiplayerManager` can be in.

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
| **NotInitialized** | PlayFabMultiplayerManager is not initialized. |
| **Initialized** | PlayFabMultiplayerManager is initialized, but not connected to a network. |
| **ConnectingToNetwork** | PlayFabMultiplayerManager is initialized and in the process of connecting to a network. |
| **ConnectedToNetwork** | PlayFabMultiplayerManager is initialized and connected to a network. At this point messages can be sent and received. |
