---
title: statistic_updated
author: t-sandersg-gith
description: statistic_updated event
ms.author: t-sandersg
ms.date: 8/18/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# statistic_updated

This event is triggered when a statistic is updated for a given entity.

## Properties

| Name | Type | Description |
| --- | --- | --- |
| Name | String | The name of the statistic |
| Version | int32 | The version of the statistic |
| Scores | int64[] | The current scores for the statistic, after the change |
| PreviousScores | int64[] | The previous scores for the statistic, before the change |
| Metadata | String | The metadata associated with the statistic, after the change |
| PreviousMetadata | String | The metadata associated with the statistic, before the change |
| Operation | String | The operation that was performed: `Created`, `Updated`, or `Deleted` |

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
