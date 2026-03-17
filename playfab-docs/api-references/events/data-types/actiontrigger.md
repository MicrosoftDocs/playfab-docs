---
title: ActionTrigger
author: joelku
description: ActionTrigger data type.
ms.author: joelku
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# ActionTrigger

Information about the trigger that initiated the action.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|RuleId|String|The ID of the rule that triggered the action.|
|RuleName|String|The friendly name of the rule that triggered the action.|
|Timestamp|DateTime|The server time when the rule was evaluated.|
|ActionIndex|int32|The position of the action within the rule, starting from 0.|
|ActionId|String|The ID of the action.|
|ActionName|String|The friendly name of the action.|
|ActionType|[ActionType](actiontype.md)|The type of the action.|
