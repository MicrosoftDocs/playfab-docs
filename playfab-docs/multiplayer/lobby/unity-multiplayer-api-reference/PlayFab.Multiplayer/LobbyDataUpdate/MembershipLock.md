---
author: vicodex
title: LobbyDataUpdate.MembershipLock
description: LobbyDataUpdate.MembershipLock
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# LobbyDataUpdate.MembershipLock property

An optional update to the membership lock on this lobby.

```csharp
public LobbyMembershipLock? MembershipLock { get; set; }
```

## Remarks

This value can only be updated by the current lobby owner.

## See Also

* enum [LobbyMembershipLock](../LobbyMembershipLock.md)
* class [LobbyDataUpdate](../LobbyDataUpdate.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

