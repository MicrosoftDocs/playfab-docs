---
title: items_deleted
author: fprotti96
description: ItemsDeleted event.
ms.author: fprotti
ms.date: 09/29/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# items_deleted

Event raised when items have been deleted from an inventory.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|TransactionId|String|The transaction id.|
|CollectionId|String|The collection id.|
|ItemId|String|The item id.|
|StackId|String|The stack id.|
|ItemType|String|The type of the catalog item that was modified in the transaction.|

## Common Properties

[!INCLUDE [common-properties](../../includes/_common-properties-eventsv2.md)]
