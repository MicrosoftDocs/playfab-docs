---
author: vicodex
title: MatchmakingMatchDetails.LobbyArrangementString
description: MatchmakingMatchDetails.LobbyArrangementString
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# MatchmakingMatchDetails.LobbyArrangementString property

The lobby arrangement string associated with the match.

```csharp
public string LobbyArrangementString { get; }
```

## Remarks

This connection string can optionally be used with [`JoinArrangedLobby`](../PlayFabMultiplayer/JoinArrangedLobby.md) to join a lobby associated with this match result. The lobby is not created until a user attempts to join it.

## See Also

* class [MatchmakingMatchDetails](../MatchmakingMatchDetails.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

