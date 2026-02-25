---
title: leaderboard_version_ended
author: t-sandersg-gith
description: leaderboard_version_ended event.
ms.author: t-sandersg
ms.date: 08/14/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# leaderboard_version_ended

This event is triggered when a leaderboard version is reset to a new version for a game title.

## Properties

| Name | Type | Description |
| --- | --- | --- |
| Name | String | The name of the leaderboard |
| Version | int32 | The version of the leaderboard |
| TimeStamp | DateTime | The time at which the leaderboard version was changed |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]