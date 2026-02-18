---
title: item_purchased
author: ernestoc
description: item_purchased event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# item_purchased

This event is triggered when an item is purchased.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| CollectionId | String | The id of the collection the item was added to. |
| Currencies | List<[ItemPurchasedCurrency](../data-types/itempurchasedcurrency.md)> | The set of currencies used to pay for the item. |
| IdempotencyId | String | The idempotency id. |
| ItemId | String | The id of the purchased item. |
| ItemsAmountsOverrides | List<[ItemPurchasedOverride](../data-types/itempurchasedoverride.md)> | The set of overrides used to alter item amounts. |
| ItemType | String | The type of the purchased item. |
| OverrideSource | String | The source of the overrides used in the purchase. |
| PayoutAmountOverride | [ItemPurchasedOverride](../data-types/itempurchasedoverride.md) | The override used to alter the payout of the purchase. |
| PriceAmountsOverrides | List<[ItemPurchasedOverride](../data-types/itempurchasedoverride.md)> | The set of overrides used to alter the price in the purchase. |
| Quantity | uint64 | The quantity of purchased items. |
| StoreId | String | The optional id of the store. |
| TransactionDateTime | String | Timestamp of the transaction in ISO-8601 format. |
| TransactionId | String | The id of the transaction which added this item. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
