---
title: items_redeemed
author: ernestoc
description: ItemsRedeemed event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# items_redeemed

Event raised when items have been redeemed to an inventory.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| TransactionId | String | The transaction id. |
| CollectionId | String | The collection id. |
| ItemId | String | The item id. |
| StackId | String | The stack id. |
| Amount | int? | The amount of items that were redeemed. |
| DurationInSeconds | long? | The duration of the item that was redeemed. |
| Marketplace | String | The name of the marketplace that the items were redeemed from. |
| MarketplaceTransactionId | String | The transaction id in the marketplace that the items were redeemed from. |
| ItemType | String | The type of the catalog item that was modified in the transaction. |
| Balance | int? | The balance of the items changed as a result of the transaction. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
