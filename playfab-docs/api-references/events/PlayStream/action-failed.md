---
title: action_failed
author: joelku
description: action_failed event.
ms.author: joelku
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# action_failed

This event is emitted when an action failed to execute.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Error|[ActionFailure](../data-types/actionfailure.md)|Information about the error that occurred during execution.|
|Trigger|[ActionTrigger](../data-types/actiontrigger.md)|Information about the trigger that initiated the action.|
|EventDetails|[ActionEventDetails](../data-types/actioneventdetails.md)|Information about the event that triggered the action.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
