---
title: title_requested_limit_change
author: joannaleecy
description: title_requested_limit_change event.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_requested_limit_change

This event is triggered when a title requests a service limit change.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeveloperId|String||
|LevelName|String|The name of the requested limit level.|
|LimitDisplayName|String|The display name of the limit requested to change.|
|LimitId|String|The unique identifier of the limit requested to change.|
|PreviousLevelName|String|The name of the limit level at the time of the requested change, if any.|
|PreviousPriceUSD|double|The price of the limit level in US Dollars at the time of the requested change, if any.|
|PreviousValue|double|The limit value at the time of the requested change, if any.|
|PriceUSD|double|The price of the requested limit level in US Dollars, if any.|
|TransactionId|String|The unique identifier of the requested limit change transaction.|
|Unit|[MetricUnit](data-types/metricunit.md)|The unit of the limit requested to change.|
|UserId|String||
|Value|double|The limit value of the requested change, if any.|

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