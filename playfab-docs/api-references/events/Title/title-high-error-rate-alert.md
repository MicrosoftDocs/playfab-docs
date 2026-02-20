---
title: title_high_error_rate_alert
author: joannaleecy
description: title_high_error_rate_alert event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_high_error_rate_alert

This event is triggered when a game title experiences a high rate of errors.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AlertEventId|String|Unique identifier of the alert that triggered this event.|
|AlertState|[AlertStates](../data-types/alertstates.md)|State of the alert. Values include Triggered, Recovered, ReTriggered.|
|API|String|The PlayFab API that is generating the high rate of errors.|
|ErrorCode|String|Error message that was returned to the client.|
|GraphUrl|String|URL of an image graph of the counter that triggered the alert.|
|Level|[AlertLevel](../data-types/alertlevel.md)|Level of the alert. Values include Warn, Alert, Critical.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
