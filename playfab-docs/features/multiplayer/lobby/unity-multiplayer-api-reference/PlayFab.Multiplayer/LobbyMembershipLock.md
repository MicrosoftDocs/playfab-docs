---
author: vicodex
title: LobbyMembershipLock
description: LobbyMembershipLock members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyMembershipLock

Values representing the state of the lobby's membership lock.

```csharp
public enum LobbyMembershipLock : uint
```

## Values

| name | value | description |
| --- | --- | --- |
| Unlocked | `0` | Lobby membership is unlocked. New members will not be prevented from joining. |
| Locked | `1` | Lobby membership is locked. New members will be prevented from joining. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
