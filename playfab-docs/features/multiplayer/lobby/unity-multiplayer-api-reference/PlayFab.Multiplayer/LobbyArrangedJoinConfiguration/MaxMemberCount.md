---
author: vicodex
title: LobbyArrangedJoinConfiguration.MaxMemberCount
description: LobbyArrangedJoinConfiguration.MaxMemberCount
ms.author: victorku
ms.topic: reference
ms.service: playfab
ms.date: 11/23/2021
---

# LobbyArrangedJoinConfiguration.MaxMemberCount property

The maximum number of members allowed in the lobby, if joiner is the first member in the lobby.

```csharp
public uint MaxMemberCount { get; set; }
```

## Remarks

This value must be at least `PlayFabMultiplayer.LobbyMaxMemberCountLowerLimit` and no more than `PlayFabMultiplayer.LobbyMaxMemberCountUpperLimit`.

If a client would violate this limit by calling !:JoinLobby() or !:Lobby.AddMember, the operation will fail asynchronously and !:LobbyJoinCompletedStateChange.result or !:LobbyAddMemberCompletedStateChange.result, respectively, will be set to !:LobbyStateChangeResult.LobbyNotJoinable.

## See Also

* class [LobbyArrangedJoinConfiguration](../LobbyArrangedJoinConfiguration.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

