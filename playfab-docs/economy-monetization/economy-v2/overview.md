---
title: Economy v2 overview
author: fprotti96
description: Learn the differences and changes from PlayFab Economy v1 to v2
ms.author: fprotti
ms.date: 02/20/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy
ms.localizationpriority: medium
---

# Economy v2 overview

[!INCLUDE [notice](../../includes/_economy-release.md)]

Economy v2 is a major change from the existing PlayFab Monetization suite of features. The goal of the change is to support titles with hundreds of millions of active players, large progression systems, and giant inventories. The architecture is rebuilt on the modern Azure Stack from the ground up. It targets developers' needs related to the following features.

* Idempotent transactions
* Batch operations
* Handling of high [concurrency](catalog/etags.md) rates, especially with inventory interactions
* Large unified catalog (up to 20 GB per entity) of in-game goods or user-generated content (UGC), supporting multiple entities
* Individual Catalog Item documents instead of all items stored in a single document
* Large player inventories ([thousands of items](limits.md))
* Integration with PlayFab Entities

Economy v2 is designed with the same flexibility and extensibility that you expect from other PlayFab services. Although the architecture is new to PlayFab, it's battle-tested and supports internal Microsoft titles, such as **Minecraft**, **Sea of Thieves**, and **Flight Simulator**.

Interested to find out why we made Economy v2 and how you can use the improvements in your title?
>[!VIDEO https://www.youtube.com/embed/NcvFFgTZ6ek]

## Which version of Economy should I use?

Use version 2. If you're on version 1, consider upgrading. Although Microsoft isn't deprecating v1 and will maintain and support it for all titles, it's in bugfix-only mode. The new Economy features are developed only for version 2. For more information on the differences between the two versions, see [FAQ](faq.md).

## New in Economy v2

Economy v2 introduces several new capabilities that aren't available in v1:

* Updated interactions between the [inventory](inventory/index.md) and catalog allow you to support unique items, nonunique items, stacks of items, and multiple stacks of items.
* You can upload and manage [metadata](catalog/content-types-tags-and-properties.md) and content, including images and files, alongside your catalog items.
* You can create [deep links](catalog/deep-links.md) to game content by using the economy settings.
* Customizable [catalog search](catalog/search.md) enables you to set up custom views with tags and content types.
* A simple way to [localize](catalog/localization.md) item descriptions and titles.
* APIs that support PlayerEntity-facing [Item Ratings and Reviews](catalog/ratings.md).
* Support for custom workflow in [authoring with draft states](catalog/item-status.md) and [policy permissions sets for catalog admins and reviewers](settings.md). You can prepublish catalog items with a future start date.
* [Bundle items](catalog/bundles.md) that you can link to multiple external marketplace items.
* [Inventory Collections](inventory/collections.md) that allow a single player to have multiple inventories, such as per-character or per-platform.
* [Inventory Stacks](inventory/stacks.md) that enable multiple distinct instances of the same item within one inventory, each with its own amount and properties.
* [TurboLoading](inventory/turboloading.md) that loads an entire inventory (up to 10,000 items) in a single compressed API call for faster startup.
* [User Generated Content (UGC)](ugc/overview.md) that empowers players to create, upload, and search for moderated content by using a built-in moderation pipeline.
* [ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations) batches inventory operations atomically in a single request. If any operation fails, the entire batch is rolled back.
* [ETags](catalog/etags.md) that provide optimistic concurrency control for catalog and inventory updates, preventing race conditions.
* Built-in [fraud prevention and receipt validation](fraud-prevention/index.md) across Apple, Google, Steam, Nintendo, PlayStation Store, and Microsoft Store marketplaces.
* [Targeted offers](player-segmented-monetization/targeted-offers.md) that enable segment-exclusive stores with dynamic pricing tailored to different player groups.

## Changes from v1

Features of Economy that were too restrictive to be useful didn't make the cut to v2. To remediate this limitation, the product team launched Azure Functions as an enhanced successor to CloudScript. The team also provided recipe-style documentation as a starting point for your own custom implementations. The product team then focused efforts on what you told them was most important.

The following v1 features aren't included as native item types in Economy v2. Some features can be partially replicated by using v2 building blocks, while others require custom logic through [Azure Functions](/azure/azure-functions/functions-overview).

### Partially supported

You can achieve these v1 features by using existing v2 APIs and building blocks:

* **Converting items**: You can achieve item conversion (crafting) by using the [ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations) API, which atomically subtracts input items and adds the result in a single request. For an example, see the [Crafting Game tutorial](tutorials/craftingGame/game-context.md).
* **Containers (fixed contents)**: You can implement containers that always grant the same items by using [bundles and virtual currency](tutorials/containers-with-fixed-contents.md). A currency token represents the container, and purchasing a bundle priced at one token grants the contents.

### Not supported

These v1 features have no native v2 equivalent and require custom logic (for example, by using Azure Functions):

* **Trading**: V1 provided atomic two-way item swaps between players. V2 doesn't have a native trading API. Implementing player-to-player trading requires custom orchestration with [Azure Functions](/azure/azure-functions/functions-overview).
* **Limited items**: V1 supported catalog items with a finite global supply. V2 requires server-side logic to track and enforce a global quantity cap.
* **Drop tables**: V1 had built-in weighted random loot tables. V2 requires custom random selection logic by using Azure Functions. For a complete implementation, see the [drop tables and randomized loot tutorial](tutorials/drop-tables-and-randomized-loot.md).
* **Containers (randomized)**: V1 containers paired with drop tables granted random items on open. V2 requires custom logic to subtract the container and grant randomly selected items. See the [drop tables and randomized loot tutorial](tutorials/drop-tables-and-randomized-loot.md).
* **Recharge rates**: V1 allowed items with usage counts that regenerated over time. V2 requires custom time-based logic to calculate and grant regenerated amounts.
* **Store support for segments**: V1 allowed automatic linking between player segments and stores. V2 has both [Stores](catalog/stores.md) and [Segments](../../player-progression/player-data/player-segments.md) and supports [targeted offers](player-segmented-monetization/targeted-offers.md) with segment-exclusive stores, but you must manually set up the configuration rather than use automatic assignment.


## See also

* [Quickstart](quickstart.md)
* [Settings](settings.md)
* [Stores](catalog/stores.md)
* [Inventory](inventory/index.md)
* [Marketplace Integrations](marketplace/marketplace-integrations/overview.md)
* [Fraud Prevention](fraud-prevention/index.md)
* [TurboLoading](inventory/turboloading.md)
* [Limits](limits.md)
* [FAQ](faq.md)
