---
title: player_ranked_on_leaderboard_version
author: joannaleecy
description: player_ranked_on_leaderboard_version event.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_ranked_on_leaderboard_version

This event is triggered for the top-ranked players on a leaderboard when the leaderboard version changes (e.g. when a leaderboard statistic version is incremented). The maximum number of leaderboard entries for which the event is generated is controlled by the "Leaderboard version change top rank events sent" title limit.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|LeaderboardSource|[LeaderboardSource](data-types/leaderboardsource.md)|Source of the values for the leaderboard.|
|Rank|uint32|Player's rank on the leaderboard.|
|TitleId|String|The ID of the title to which this player event applies.|
|Value|int32|Player's leaderboard value.|
|Version|uint32|Version of the leaderboard on which the player is ranked. For player statistic leaderboards, this matches the version of the statistic.|
|VersionChangeBehavior|[LeaderboardVersionChangeBehavior](data-types/leaderboardversionchangebehavior.md)|Behavior with respect to the leaderboard values when the version changed.|

## Common Properties

All PlayStream events are formatted as JSON objects and share the following common properties:

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CustomTags|Object|Key-Value pair storage. Any provider of this event schema is allowed to send additional values in this property.|
|EntityId|String|The identifier for the entity (title, player, etc) to which this event applies.|
|EntityType|String|The type of entity (player, title, etc.) to which this event applies. If PlayFab is meant to take action on this entity, then the EntityType must be either 'player', 'character', or 'title'. It is required that any entity type that PlayFab does not currently parse should be prepended with a namespace (like 'com.mygame.guild') as PlayFab may begin to parse root entities at any time.|
|EventId|String|PlayFab-assigned unique identifier for this event.|
|EventName|String|The name of this event.|
|EventNamespace|String|The assigned namespacing for this event. For example: 'com.myprogram.ads'|
|History|[PlayStreamEventHistory](data-types/playstreameventhistory.md)|The history of events associated with this event. This is set in cases where an event has generated children events via a trigger action.|
|Reserved|object|Reserved exclusively for PlayFab internal use.|
|Source|String|The name of the source of this PlayStream event; will be PlayFab if the event originated from us.|
|SourceType|[SourceType](data-types/sourcetype.md)|The type of source of this event (PlayFab partner, other backend, or from the PlayFab API).|
|Timestamp|DateTime|The time (in UTC) associated with this event.|