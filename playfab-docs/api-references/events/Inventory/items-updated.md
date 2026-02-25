---
title: items_updated
author: ernestoc
description: ItemsUpdated event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# items_updated

Event raised when items have been updated in an inventory.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| TransactionId | String | The transaction id. |
| CollectionId | String | The collection id. |
| ItemId | String | The item id. |
| StackId | String | The stack id. |
| Amount | int? | The amount of item. |
| Expiration | String | The date the item expires. |
| ItemType | String | The type of the catalog item that was modified in the transaction. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
