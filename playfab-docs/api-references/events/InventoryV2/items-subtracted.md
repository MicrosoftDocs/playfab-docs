---
title: items_subtracted
author: ernestoc
description: ItemsSubtracted event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# items_subtracted

Event raised when items have been subtracted from an inventory.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| TransactionId | String | The transaction id. |
| CollectionId | String | The collection id. |
| ItemId | String | The item id. |
| StackId | String | The stack id. |
| Amount | int? | The amount of items that were subtracted. |
| DurationInSeconds | long? | The duration of the item that was subtracted. |
| ItemType | String | The type of the catalog item that was modified in the transaction. |
| Balance | int? | The balance of the items changed as a result of the transaction. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
