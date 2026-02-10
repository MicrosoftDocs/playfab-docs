---
title: title_started_task
author: joannaleecy
description: title_started_task event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_started_task

This event is triggered when a task is scheduled to run.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeveloperId|String||
|Parameter|object|Parameter of the scheduled task|
|ScheduledByUserId|String|ID of user who manually scheduled the task, null if scheduled automatically|
|ScheduledTask|[NameIdentifier](../data-types/nameidentifier.md)|Identity of the scheduled task|
|TaskInstanceId|String|ID of the running instance of the task|
|TaskType|String|Type of the scheduled task|
|UserId|String||

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
