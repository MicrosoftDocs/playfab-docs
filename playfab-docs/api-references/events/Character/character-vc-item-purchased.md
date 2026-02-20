---
title: character_vc_item_purchased
author: ernestoc
description: character_vc_item_purchased event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# character_vc_item_purchased

This event is triggered when the character makes a purchase using virtual currency.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| CatalogVersion | String | Version of the catalog from which the item was purchased. |
| CurrencyCode | String | Currency that was used to purchase the item. |
| ItemId | String | Identifier of the catalog item that was purchased. |
| PlayerId | String |  |
| PurchaseId | String | Unique identifier of the purchase transaction. |
| Quantity | int32 | Quantity of items that were purchased. |
| StoreId | String | The StoreId where the item was purchased. |
| TitleId | String |  |
| UnitPrice | uint32 | Price paid per item, expressed in the virtual currency. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
