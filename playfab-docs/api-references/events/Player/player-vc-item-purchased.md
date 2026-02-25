---
title: player_vc_item_purchased
author: ernestoc
description: player_vc_item_purchased event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_vc_item_purchased

This event is triggered when the player makes a purchase using virtual currency.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| CatalogVersion | String | Version of the catalog from which the item was purchased. |
| CurrencyCode | String | Currency that was used to purchase the item. |
| ItemId | String | Identifier of the catalog item that was purchased. |
| PurchaseId | String | Unique identifier of the purchase transaction. |
| Quantity | int32 | Quantity of items that were purchased. |
| StoreId | String | The StoreId where the item was purchased. |
| TitleId | String | The ID of the title to which this player event applies. |
| UnitPrice | uint32 | Price paid per item, expressed in the virtual currency. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
