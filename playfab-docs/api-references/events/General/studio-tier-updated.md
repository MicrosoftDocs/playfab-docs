---
title: studio_tier_updated
author: joannaleecy
description: studio_tier_updated event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# studio_tier_updated

This event is triggered when a studio tier is updated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ContactCompanyName|String|Contact Company Name|
|IsPayAsYouGo|Boolean|IsPayAsYouGo PaymentOption|
|IsReservedCapacity|Boolean|IsReservedCapacity PaymentOption|
|IsReservedCapacityAnnual|Boolean|IsReservedCapacityAnnual PaymentOption|
|MonthlyMinimumUSD|double|Monthly Minimum Price in USD|
|OveragePricePerMauTiers|[PaymentOptionPerMauPriceTier](../data-types/paymentoptionpermaupricetier.md)|OveragePricePerMauTiers Definitions|
|PaymentSystemAccountId|String|Payment System AccountId|
|PricePerMauTiers|[PaymentOptionPerMauPriceTier](../data-types/paymentoptionpermaupricetier.md)|PricePerMauTiers Definitions|
|ReservedMAU|int32|Reserved Capacity MAU|
|StudioIds|IEnumerable_String|Studio Ids|
|TierDisplayName|String|Tier Display Name|
|TierId|String|Tier Id|
|TransactionId|String|Transaction Id|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
