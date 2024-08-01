---
author: nassosterz-ms
title: PlayFabMultiplayerManager.Get().Resume
description: Resumes execution of Party.
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 10/09/2022
---

# Resume

Re-initializes Party and all resources of the PlayFabMultiplayerManager object. Should be called by the title when it resumes execution after a title suspension.

## Syntax

```csharp
public void PlayFabMultiplayerManager.Get().Resume();
```

### Parameters

None.

## Remarks
Every call to Resume should be preceded by a call to [Suspend()](playfabunitysuspend.md) call. <br /><br /> Titles using the Microsoft Game Core version of the Party Xbox Live Helper library must listen for app state notifications via the RegisterAppStateChangeNotification API. When the app is suspended, the title must call Suspend(). When the app is resumed, the title must wait for the Game Core networking stack to be ready and, then reinitialize resources by calling Resume().
Similarly, for other platforms where suspend - resume notification system is supported, titles should follow a similar logic.


### Return value

None.
