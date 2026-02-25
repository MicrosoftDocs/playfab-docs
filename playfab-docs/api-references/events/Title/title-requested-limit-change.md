---
title: title_requested_limit_change
author: joannaleecy
description: title_requested_limit_change event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_requested_limit_change

This event is triggered when a title requests a service limit change.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeveloperId|String||
|LevelName|String|The name of the requested limit level.|
|LimitDisplayName|String|The display name of the limit requested to change.|
|LimitId|String|The unique identifier of the limit requested to change.|
|PreviousLevelName|String|The name of the limit level at the time of the requested change, if any.|
|PreviousPriceUSD|double|The price of the limit level in US Dollars at the time of the requested change, if any.|
|PreviousValue|double|The limit value at the time of the requested change, if any.|
|PriceUSD|double|The price of the requested limit level in US Dollars, if any.|
|TransactionId|String|The unique identifier of the requested limit change transaction.|
|Unit|[MetricUnit](../data-types/metricunit.md)|The unit of the limit requested to change.|
|UserId|String||
|Value|double|The limit value of the requested change, if any.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
