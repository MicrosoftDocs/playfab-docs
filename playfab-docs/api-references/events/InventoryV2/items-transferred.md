---
title: items_transferred
author: ernestoc
description: ItemsTransferred event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# items_transferred

Event raised when items have been transferred to or from an inventory.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| TransactionId | String | The transaction id. |
| CollectionId | String | The collection id. |
| ItemId | String | The item id. |
| StackId | String | The stack id. |
| Amount | int? | The amount of items that were transferred. |
| DurationInSeconds | long? | The duration of the item that was transferred. |
| GivingEntity | [EntityKey](../data-types/entitykey.md)? | The entity the items were transferred from or null if it was the current entity. |
| ReceivingEntity | [EntityKey](../data-types/entitykey.md)? | The entity the items were transferred to or null if it was the current entity. |
| GivingCollectionId | String | The collection if the items were transferred from or null if it was the current collection. |
| ReceivingCollectionId | String | The collection id the items were transferred to or null if it was the current collection. |
| ItemType | String | The type of the catalog item that was modified in the transaction. |
| Balance | int? | The balance of the items changed as a result of the transaction. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
