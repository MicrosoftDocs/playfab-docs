---
title: action_executed
author: joelku
description: action_executed event.
ms.author: joelku
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# action_executed

This event is emitted when an action is executed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Data|[ActionResultDetails](../data-types/actionresultdetails.md)|The result of the action.|
|Trigger|[ActionTrigger](../data-types/actiontrigger.md)|Information about the trigger that initiated the action.|
|EventDetails|[ActionEventDetails](../data-types/actioneventdetails.md)|Information about the event that triggered the action.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
