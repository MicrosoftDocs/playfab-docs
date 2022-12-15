---
author: nassosterz-ms
title: LobbyMemberConnectionStatus
description: Values representing the current status of a member's connection status to the notification service
ms.author: aterzakis
ms.topic: reference
ms.service: playfab
ms.date: 09/12/2022
---

# LobbyMemberConnectionStatus

Values representing the current status of a member's connection status to the notification service.

```csharp
public enum LobbyMemberConnectionStatus : uint
```

## Values

| name | value | description |
| --- | --- | --- |
| NotConnected  | `0` | The lobby member is not connected to the notification service.<br/><br/> Lobby members that are not connected to the notification service may miss updates or see delayed updates while in this state.  |
| Connected | `1` | The lobby member is connected to the notification service.<br/><br/> Lobby members that are connected to the notification service will receive real-time updates indicating changes to the lobby. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

