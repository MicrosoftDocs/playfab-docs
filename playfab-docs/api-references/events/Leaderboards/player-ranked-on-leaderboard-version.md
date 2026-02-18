---
title: player_ranked_on_leaderboard_version
author: joannaleecy
description: player_ranked_on_leaderboard_version event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_ranked_on_leaderboard_version

This event is triggered when a leaderboard version changes, generating events for top‑ranked players up to the limit defined by the "Leaderboard version change top rank events sent" setting.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|LeaderboardSource|[LeaderboardSource](../data-types/leaderboardsource.md)|Source of the values for the leaderboard.|
|Rank|uint32|Player's rank on the leaderboard.|
|TitleId|String|The ID of the title to which this player event applies.|
|Value|int32|Player's leaderboard value.|
|Version|uint32|Version of the leaderboard on which the player is ranked. For player statistic leaderboards, this matches the version of the statistic.|
|VersionChangeBehavior|[LeaderboardVersionChangeBehavior](../data-types/leaderboardversionchangebehavior.md)|Behavior with respect to the leaderboard values when the version changed.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]