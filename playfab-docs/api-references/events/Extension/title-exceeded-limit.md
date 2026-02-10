---
title: title_exceeded_limit
author: joannaleecy
description: title_exceeded_limit event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_exceeded_limit

This event is triggered when a title exceeds a service limit and receives an error.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Details|Object|Additional details about the exceeded limit|
|LimitDisplayName|String|The display name of the limit that was exceeded.|
|LimitId|String|The unique identifier of the limit that was exceeded.|
|LimitValue|double|The limit value that was exceeded.|
|Unit|[MetricUnit](../data-types/metricunit.md)|The unit of the limit that was exceeded.|
|Value|double|The value that exceeded the limit.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
