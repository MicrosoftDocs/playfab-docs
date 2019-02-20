---
title: gameserverhost_started
author: v-thopra
description: gameserverhost_started event.
ms.author: v-thopra
ms.date: 02/19/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# gameserverhost_started

This event is triggered when a multiplayer game lobby starts.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|InstanceId|String|Unique identifier of the host.|
|InstanceProvider|String|Server hosting provider of host machine or VM.|
|InstanceType|String|Provider specific type of the host machine or VM.|
|Region|String|Region in which the host is running.|
|ServerBuildVersion|String|Build version of the custom game server installed on the host.|
|ServerHost|String|Publicly visible domain name or IPV4 address of the host.|
|ServerIPV4Address|String|Publicly visible IPV4 address of the host.|
|ServerIPV6Address|String|Publicly visible IPV6 address of the host.|
|StartTime|DateTime|Time that the host was started.|
|TitleId|String|The ID of the title associated with this host|

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