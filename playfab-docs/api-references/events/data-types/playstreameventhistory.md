---
title: PlayStreamEventHistory
author: v-thopra
description: PlayStreamEventHistory data type.
ms.author: v-thopra
ms.date: 02/19/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# PlayStreamEventHistory

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ParentEventId|String|The ID of the previous event that caused this event to be created by hitting a trigger.|
|ParentTriggerId|String|The ID of the trigger that caused this event to be created.|
|TriggeredEvents|Boolean|If true, then this event was allowed to trigger subsequent events in a trigger.|
