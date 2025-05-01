---
author: vicodex
title: PlayFabMultiplayerManagerErrorType
description: The types of errors PlayFabMultiplayerManager can raise.
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2020
---

# PlayFabMultiplayerManagerErrorType

The types of errors `PlayFabMultiplayerManager` can raise.

## Syntax

```csharp
public enum PlayFabMultiplayerManagerErrorType
{
    Unknown,
    Error,
    NetworkCreateError,
    NetworkJoinError,
    NetworkLeaveError
}
```

### Constants

| **Constant** | **Description** |
| --- | --- |
| **Unknown** | The type of error is unknown. |
| **Error** | The error is a generic error. |
| **NetworkCreateError** | The error is related to creating a network. |
| **NetworkJoinError** | The error is related to joining a network. |
| **NetworkLeaveError** | The error is related to leaving a network. |