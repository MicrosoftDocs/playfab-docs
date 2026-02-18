---
title: ItemsClawbackCompletedPayload
author: ernestoc
description: ItemsClawbackCompletedPayload data type.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# ItemsClawbackCompletedPayload

Items clawback completed event payload.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| Amount | int | The amount of items that were clawed back. |
| Balance | int | The balance of the item after the transaction. |
| CollectionId | String | The collection ID the item was clawed back from. |
| ItemId | String | The ID of the item that was clawed back. |
| ItemType | String | The type of the catalog item that was clawed back. |
| Marketplace | String | The name of the marketplace the items were clawed back from. |
| MarketplaceAlternateId | String | The alternate ID of the item for the marketplace. |
| MarketplaceEventId | String | The event ID from the marketplace that triggered this clawback. |
| MarketplaceTransactionId | String | The ID of the marketplace transaction. |
| RedemptionDetails | RedemptionDetails | The details of the original redeem operation. |
| StackId | String | The stack ID that the item was clawed back from. |
| TransactionId | String | ID of the transaction which clawed back this item. |
