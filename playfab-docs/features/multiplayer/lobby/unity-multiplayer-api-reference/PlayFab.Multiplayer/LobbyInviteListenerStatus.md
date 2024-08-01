---
author: vicodex
title: LobbyInviteListenerStatus
description: LobbyInviteListenerStatus members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyInviteListenerStatus

Values representing the current status of an invite listener.

```csharp
public enum LobbyInviteListenerStatus : uint
```

## Values

| name | value | description |
| --- | --- | --- |
| NotListening | `0` | The invite listener has not been started or has been stopped and is not listening for invites. |
| Listening | `1` | The invite listener has been established and is listening for invites. |
| NotAuthorized | `2` | The listening entity was not authorized to establish an invite listener. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

