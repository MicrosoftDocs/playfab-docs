---
author: nassosterz-ms
title: PlayFabMultiplayerManager.Get().Suspend
description: Suspends execution of Party.
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 10/09/2022
---

# Suspend

Cleans up Party and all resources of the PlayFabMultiplayerManager object. Should be called by the title during a title suspension.

## Syntax

```csharp
public void PlayFabMultiplayerManager.Get().Suspend();
```

### Parameters

None.

## Remarks
Every call to Suspend should have a corresponding [Resume()](playfabunityresume.md) call. <br /><br /> Titles using the Microsoft Game Core version of the Party Xbox Live Helper library must listen for app state notifications via the RegisterAppStateChangeNotification API. When the app is suspended, the title must call Suspend(). When the app is resumed, the title must wait for the Game Core networking stack to be ready and then re-initialize resources by calling Resume().
Similarly, for other platforms where suspend - resume notification system is supported, titles should follow a similar logic.

### Return value

None.