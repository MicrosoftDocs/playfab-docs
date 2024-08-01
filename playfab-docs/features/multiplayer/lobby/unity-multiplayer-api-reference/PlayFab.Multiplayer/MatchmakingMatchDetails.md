---
author: vicodex
title: MatchmakingMatchDetails
description: MatchmakingMatchDetails members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# MatchmakingMatchDetails class

The resulting match information found by a completed ticket.

```csharp
public class MatchmakingMatchDetails
```

## Public Members

| name | description |
| --- | --- |
| [LobbyArrangementString](MatchmakingMatchDetails/LobbyArrangementString.md) { get; } | The lobby arrangement string associated with the match. |
| [MatchId](MatchmakingMatchDetails/MatchId.md) { get; } | The ID of the match. |
| [Members](MatchmakingMatchDetails/Members.md) { get; } | The members that have been matched together. |
| [RegionPreferences](MatchmakingMatchDetails/RegionPreferences.md) { get; } | Preferred regions for the match, sorted from most to least preferred. |
| [ServerDetails](MatchmakingMatchDetails/ServerDetails.md) { get; } | The details of the server associated with this match. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
