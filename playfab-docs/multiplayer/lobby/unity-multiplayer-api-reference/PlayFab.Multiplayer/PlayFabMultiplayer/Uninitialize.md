---
author: vicodex
title: PlayFabMultiplayer.Uninitialize
description: PlayFabMultiplayer.Uninitialize
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.Uninitialize method

Immediately reclaims all resources associated with all Multiplayer library objects.

```csharp
public static void Uninitialize()
```

## Remarks

If local users were participating in a Lobby, they are removed (it appears to remote lobby clients as if network connectivity to these users has been lost), so best practice is to call [`Leave`](../Lobby/Leave.md) on all lobbies and wait for the corresponding [`OnLobbyLeaveCompleted`](./OnLobbyLeaveCompleted.md) event to have the local users exit any existing lobbies.

This method is not thread-safe and may not be called concurrently with other Multiplayer library methods. After calling this method, all Multiplayer library state is invalidated.

Titles using the Microsoft Game Core version of the Multiplayer library must listen for app state notifications via the RegisterAppStateChangeNotification API. When the app is suspended, the title must call Uninitialize(). When the app is resumed, the title must wait for the Game Core networking stack to be ready and then re-initialize the Multiplayer library by calling Initialize().

Every call to [`Initialize`](./Initialize.md) should have a corresponding Uninitialize() call.

## See Also

* method [Initialize](./Initialize.md)
* class [PlayFabMultiplayer](../PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

