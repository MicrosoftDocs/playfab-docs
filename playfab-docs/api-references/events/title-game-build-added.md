---
title: title_game_build_added
author: v-thopra
description: title_game_build_added event.
ms.author: v-thopra
ms.date: 02/19/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_game_build_added

This event is triggered when a new game build is uploaded for a game title.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|Unique identifier of the build that was uploaded.|
|DeveloperId|String||
|MaxGamesPerHost|int32|The maximum number of game sessions that can be run on a single server.|
|MinFreeGameSlots|int32|The minimum number of free slots to maintain across all servers for this build.|
|Regions|[Region](data-types/region.md)|This build is being deployed in these regions and will shortly be available for players to join.|
|UserId|String||

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