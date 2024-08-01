---
title: player_consumed_item
author: joannaleecy
description: player_consumed_item event.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_consumed_item

This event is triggered when a player consumes an item from their inventory.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CatalogVersion|String|Version of the catalog from which the consumed inventory item was created.|
|ItemId|String|ID of the catalog item from which the consumed inventory item was created. This can be used to look up the item from the catalog.|
|ItemInstanceId|String|The specific ID of the item that was consumed.|
|PreviousUsesRemaining|uint32|For multiple use items, the number of uses that remained before the item was consumed.|
|TitleId|String|The ID of the title to which this player event applies.|
|UsesRemaining|uint32|For multiple use items, the number of uses remaining after the item was consumed.|

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