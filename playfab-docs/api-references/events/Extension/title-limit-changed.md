---
title: title_limit_changed
author: joannaleecy
description: title_limit_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_limit_changed

This event is triggered when a title changes a service limit.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|LimitDisplayName|String|The display name of the limit that changed.|
|LimitId|String|The unique identifier of the limit that changed.|
|PreviousPriceUSD|double|The price of the limit level in US Dollars before the change, if any.|
|PreviousValue|double|The limit value before the change, if any.|
|PriceUSD|double|The price of the limit level in US Dollars, if any.|
|TransactionId|String|The unique identifier of the limit change transaction.|
|Unit|[MetricUnit](../data-types/metricunit.md)|The unit of the limit that changed.|
|Value|double|The limit value after the change, if any.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
