---
title: title_completed_task
author: joannaleecy
description: title_completed_task event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_completed_task

This event is triggered when a scheduled task has completed

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AbortedAt|DateTime|Timestamp on when the task was aborted. Null if task never was aborted.|
|IsAborted|Boolean|Whether the task was aborted.|
|Result|[TaskInstanceStatus](../data-types/taskinstancestatus.md)|Result of the task run, whether it has succeeded, failed or aborted.|
|Summary|object|Summary of the task run. Different task types have different summary structure.|
|TaskInstanceId|String|ID of the running instance of the task|
|TaskType|String|Type of the scheduled task|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
