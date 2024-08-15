---
title: player_action_executed
author: joannaleecy
description: player_action_executed event.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_action_executed

This event is triggered when an action linked to a segmentation change or event rule executes on a player.

Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ActionName|String|Name of the action that was triggered.|
|Error|[ActionExecutionError](data-types/actionexecutionerror.md)|Information about the error that occurred during execution, if it failed to complete.|
|ExecutionDuration|double|Action execution time in milliseconds.|
|ExecutionResult|object|The object returned from the action execution, if it completed.|
|ScheduledTimestamp|DateTime|Time that the action was scheduled for execution.|
|TitleId|String|The ID of the title to which this player event applies.|
|TriggeredTimestamp|DateTime|Time that the triggering event or segmentation change occurred.|
|TriggeringEventRuleMatch|[EventRuleMatch](data-types/eventrulematch.md)|Event rule match, if any, that triggered the action.|
|TriggeringSegmentMembershipChange|[SegmentMembershipChange](data-types/segmentmembershipchange.md)|Player segmentation change, if any, that triggered the action.|

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