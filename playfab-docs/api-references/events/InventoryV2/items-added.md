---
title: items_added
author: ernestoc
description: ItemsAdded event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# items_added

Event raised when items have been added to an inventory.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| TransactionId | String | The transaction id. |
| CollectionId | String | The collection id. |
| ItemId | String | The item id. |
| StackId | String | The stack id. |
| Amount | int? | The amount of items that were added. |
| DurationInSeconds | long? | The duration of the item that was added. |
| ItemType | String | The type of the catalog item that was modified in the transaction. |
| Balance | int? | The balance of the items changed as a result of the transaction. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
