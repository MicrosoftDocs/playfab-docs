---
title: experiment_stop_requested
author: joelku
description: experiment_stop_requested event.
ms.author: joelku
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# experiment_stop_requested

This event is triggered when an experiment is requested to stop.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Id|String|The unique identifier of the experiment.|
|Name|String|The friendly name of the experiment.|
|RequestOrigin|[ExperimentRequestOrigin](../data-types/experimentrequestorigin.md)|The origin of the request to stop the experiment.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]