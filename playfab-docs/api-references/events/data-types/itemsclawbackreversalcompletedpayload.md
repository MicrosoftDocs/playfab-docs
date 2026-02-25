---
title: ItemsClawbackReversalCompletedPayload
author: ernestoc
description: ItemsClawbackReversalCompletedPayload data type.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# ItemsClawbackReversalCompletedPayload

Items clawback reversal completed event payload.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| Amount | int | The amount of items that were added. |
| Balance | int | The balance of the item after the transaction. |
| ClawbackDetails | ClawbackDetails | The details of the original clawback operation. |
| CollectionId | String | The collection ID the item was added to. |
| ItemId | String | The ID of the item that was added. |
| ItemType | String | The type of the catalog item. |
| Marketplace | String | The name of the marketplace that triggered this clawback reversal. |
| MarketplaceAlternateId | String | The alternate ID of the item for the marketplace. |
| MarketplaceEventId | String | The event ID from the marketplace that triggered this clawback reversal. |
| MarketplaceTransactionId | String | The ID of the marketplace transaction. |
| StackId | String | The stack ID that the item was added to. |
| TransactionId | String | ID of the transaction which performed a clawback reversal on this item. |
