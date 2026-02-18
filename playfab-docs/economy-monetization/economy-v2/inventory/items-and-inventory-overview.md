---
title: Items and Inventory Overview
author: thomasgu
description: Overview of Economy v2 Items and Inventory concepts and APIs.
ms.author: thomg
ms.date: 02/20/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, items, catalogs, inventory, v2
ms.localizationpriority: medium
---

# PlayFab Items and Inventory Overview

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Items and inventories are essential features for creating engaging and immersive games. They allow you to offer customization options, rewards, progression systems, and monetization opportunities for your players.

PlayFab Economy v2 provides a flexible and powerful platform for creating and managing virtual goods. You can define different types of items — such as durables, consumables, bundles, subscriptions, and virtual currencies — and track the ownership and usage of items across your players' inventories.

## Key concepts

* **Catalog** - A catalog is a collection of all the items that are available in your game. Catalogs offer an easy way to manage your game's virtual items. For more information, see the [Catalog Overview](../catalog/catalog-overview.md).
* **Catalog Items** – Individual items defined in your catalog. They can represent any kind of virtual good, such as weapons, outfits, power-ups, loot boxes, etc. You can customize properties and behaviors to suit your game design.
* **Catalog Stores** - Stores allow you to create multiple item listings for different purposes, such as seasonal events, promotions, or testing. See [Stores](../catalog/stores.md).
* **Bundles** - Bundles are catalog items that contain references to other items. When a player purchases a bundle, the referenced items are unpacked and added to their inventory.
* **Subscriptions** - Subscriptions grant time-based access to durable goods. Items within a subscription are available in a player's inventory for the duration of the subscription. See [Subscriptions](../catalog/subscriptions.md).
* **Player Inventory Collections** - Inventory is a record of the items that a player owns in your game. It contains information about item amounts, virtual currency balances, and custom properties. All player accounts can have one or more inventories called [Collections](collections.md).
* **Stacks** - Stacks allow multiple distinct instances of the same item to exist within a single inventory, each with their own amount and custom properties. See [Stacks](stacks.md).
* **Virtual Currency** - Virtual currency is a type of item used as a medium of exchange in your game. You can use virtual currency to buy items from the catalog or a store, implement soft currency from in-app purchases, or drive gameplay mechanics.

## Key APIs

A rich set of APIs is available for interacting with items and inventories in your game. You can use these APIs to perform actions such as purchasing items, granting items, updating inventory, transferring items between players, and querying transaction history.

### Inventory Management

* **[GetInventoryItems](/rest/api/playfab/economy/inventory/get-inventory-items)** - Retrieve the current inventory of an entity. Supports pagination with `ContinuationToken` and bulk loading via [TurboLoading](turboloading.md).
* **[AddInventoryItems](/rest/api/playfab/economy/inventory/add-inventory-items)** - Add items directly to a player's inventory.
* **[SubtractInventoryItems](/rest/api/playfab/economy/inventory/subtract-inventory-items)** - Reduce item amounts in a player's inventory.
* **[UpdateInventoryItems](/rest/api/playfab/economy/inventory/update-inventory-items)** - Set item amounts or modify [Display Properties](index.md#display-properties) on inventory items.
* **[DeleteInventoryItems](/rest/api/playfab/economy/inventory/delete-inventory-items)** - Remove entire stacks of items from a player's inventory.

### Purchasing and Trading

* **[PurchaseInventoryItems](/rest/api/playfab/economy/inventory/purchase-inventory-items)** - Buy catalog items or bundles using virtual currency. Deducts the currency from the player's inventory and grants the purchased item.
* **[TransferInventoryItems](/rest/api/playfab/economy/inventory/transfer-inventory-items)** - Transfer items between players, between a player's inventory collections, or between stacks within the same inventory.

### Batch Operations

* **[ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations)** - Batch up to 10 inventory operations (Add, Subtract, Update, Purchase, Transfer, Delete) in a single atomic request. If any operation fails, the entire batch is rolled back.

### History and Diagnostics

* **[GetTransactionHistory](/rest/api/playfab/economy/inventory/get-transaction-history)** - Retrieve transaction events from a player's inventory. Supports filtering by timestamp and pagination for reviewing the full operation history. See [Transaction History](transaction-history.md).

### Reliability

* **Idempotency** - All inventory APIs support an `IdempotencyId` parameter to safely retry requests without duplicate side effects. IDs are enforced for 14 days. See [Idempotency](index.md#idempotency).

For the full API reference and detailed examples for each operation, see the [Inventory API documentation](index.md) and the [PlayFab REST API reference](/rest/api/playfab/economy/inventory).
