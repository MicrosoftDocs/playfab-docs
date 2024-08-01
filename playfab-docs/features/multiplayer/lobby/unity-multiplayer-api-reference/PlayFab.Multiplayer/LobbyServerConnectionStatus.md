---
author: raymondcha
title: LobbyServerConnectionStatus
description: LobbyServerConnectionStatus
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# LobbyServerConnectionStatus enumeration

Values representing the current status of the Lobby Server's connection status to the notification service.

```csharp
public enum LobbyServerConnectionStatus : uint
```

## Values

| name | value | description |
| --- | --- | --- |
| NotConnected | `0` | The Lobby Server isn't connected to the notification service. |
| Connected | `1` | The Lobby Server is connected to the notification service. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

