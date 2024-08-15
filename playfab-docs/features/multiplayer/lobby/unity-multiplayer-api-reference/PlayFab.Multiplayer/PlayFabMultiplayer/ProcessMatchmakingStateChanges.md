---
author: vicodex
title: PlayFabMultiplayer.ProcessMatchmakingStateChanges
description: PlayFabMultiplayer.ProcessMatchmakingStateChanges
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.ProcessMatchmakingStateChanges method

Triggers all the lobby related PlayFabMultiplayer.OnMatchmaking* events since the last such call.

```csharp
public static void ProcessMatchmakingStateChanges()
```

## Remarks

This method provides the Lobby library an opportunity to synchronize state with remote devices or services

Lobby library state exposed by the library can change during this call, so you must be thread-safe in your use of it. For example, invoking ProcessLobbyStateChanges() on your UI thread at the same time a separate worker thread is looping through the list of endpoints returned by [`GetMembers`](../Lobby/GetMembers.md) may result in crashes because ProcessLobbyStateChanges() can alter the memory associated with the member list. ProcessLobbyStateChanges() should be called frequently-- at least once per graphics frame. It's designed to execute and return quickly such that it can be called on your main UI thread with negligible impact. For best results, you should also minimize the time you spend handling state events.

## See Also

* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

