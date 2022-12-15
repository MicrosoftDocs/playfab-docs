---
author: vicodex
title: LobbyCreateConfiguration.MaxMemberCount
description: LobbyCreateConfiguration.MaxMemberCount
ms.author: victorku
ms.topic: reference
ms.service: playfab
ms.date: 11/23/2021
---

# LobbyCreateConfiguration.MaxMemberCount property

The maximum number of members allowed in the new lobby.

```csharp
public uint MaxMemberCount { get; set; }
```

## Remarks

This value must be at least `PlayFabMultiplayer.LobbyMaxMemberCountLowerLimit` and no more than `PlayFabMultiplayer.LobbyMaxMemberCountUpperLimit`.

If a client would violate this limit by calling !:JoinLobby() or !:Lobby.AddMember, the operation will fail asynchronously and !:OnLobbyJoinCompleted.result or !:OnLobbyAddMemberCompleted.result, respectively, will be set to !:LobbyStateChangeResult.LobbyNotJoinable.

## See Also

* class [LobbyCreateConfiguration](../LobbyCreateConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

