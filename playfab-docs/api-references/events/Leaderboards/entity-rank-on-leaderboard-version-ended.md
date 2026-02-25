---
title: entity_rank_on_leaderboard_version_ended
author: t-sandersg-gith
description: entity_rank_on_leaderboard_version_ended event.
ms.author: t-sandersg
ms.date: 8/14/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# entity_rank_on_leaderboard_version_ended

This event is triggered when a leaderboard version is reset to a new version for a game title, containing the entity's rank and score data from the ended version.

## Properties

| Name | Type | Description |
| --- | --- | --- |
| Name | String | The name of the leaderboard |
| Version | int32 | The version of the leaderboard |
| Metadata | String | Custom metadata associated with the entity |
| Rank | int32 | The rank of the entity in the leaderboard |
| Scores | int32[] | The scores of the entity in the leaderboard |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]