---
title: player_action_executed
author: joannaleecy
description: player_action_executed event.
ms.author: jenelleb
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_action_executed

This event is triggered when an action linked to a segmentation change or event rule executes on a player.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ActionName|String|Name of the action that was triggered.|
|Error|[ActionExecutionError](../data-types/actionexecutionerror.md)|Information about the error that occurred during execution, if it failed to complete.|
|ExecutionDuration|double|Action execution time in milliseconds.|
|ExecutionResult|object|The object returned from the action execution, if it completed.|
|ScheduledTimestamp|DateTime|Time that the action was scheduled for execution.|
|TitleId|String|The ID of the title to which this player event applies.|
|TriggeredTimestamp|DateTime|Time that the triggering event or segmentation change occurred.|
|TriggeringEventRuleMatch|[EventRuleMatch](../data-types/eventrulematch.md)|Event rule match, if any, that triggered the action.|
|TriggeringSegmentMembershipChange|[SegmentMembershipChange](../data-types/segmentmembershipchange.md)|Player segmentation change, if any, that triggered the action.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
