---
title: Economy v2 overview
author: cybtachyon
description: Learn the differences and changes from PlayFab Economy v1 to v2
ms.author: derekreese
ms.date: 05/02/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy
ms.localizationpriority: medium
---

# Economy v2.0 overview

[!INCLUDE [notice](../../includes/_economy-release.md)]

Economy v2 is a large change from the existing Playfab Monetization suite of features to support titles with hundreds of millions of active players, large progression systems, and giant inventories. The architecture has been rebuilt on the modern Azure Stack from the ground up, specifically targeting the needs of developers such as:

* Idempotent transactions
* Batch operations
* Handling high [concurrency](catalog/etags.md) rates (especially with inventory interactions)
* Large unified catalog (unlimited number of items) of in-game goods or UGC  
* Individual Catalog Item documents (instead of all items being stored in a single document)
* Large player Inventories ([3,000+ items](catalog/limits.md))
* Integration with PlayFab Entities

It's designed with the same flexibility and extensibility that you would expect from other Playfab services. Although the architecture is new to PlayFab, its battle tested; this same infrastructure supports internal Microsoft titles such as **Minecraft**, **Sea of Thieves**, and **Flight Simulator**.

## Which version of Economy should I use?

You should use version 2, and if you're on version 1, you should look at upgrading. While we are _not_ deprecating v1 and will maintain and support it for all titles, it is in bugfix-only mode and new Economy features are being developed only for version 2.

## Key feature changes

Some Economy features didn't make the cut to v2. These features were ones whose feedback centered around them being too restrictive to be useful. In response, we launched Azure Functions as an enhanced successor to CloudScript and have provided recipe-style documentation as starting points for your own custom implementations. We then focused our efforts on what you told us was most important.

Key v1 features that aren’t included in Economy v2 today include:

* Trading (see the [Roadmap](../../roadmap/index.md))
* Converting items  
* Limited Items
* Drop Tables
* Containers
* Recharge rates
* Store support for Segments

Economy v2 brings new useful features:

* Updated interactions between [Inventory](inventory/index.md) and catalog allow you to support unique items, non-unique items, stacks of items, and multiple stacks of items
* Catalog Items have both [metadata](catalog/content-types-tags-and-properties.md) and actual content that can be uploaded and managed alongside your catalog - including images and files
* [Deep links](catalog/deep-links.md) to game content are now possible using the economy settings
* Customizable [Catalog Search](catalog/search.md) allows you to set up custom views with tags and content types
* Simple [localization](catalog/localization.md) of Item Descriptions and Titles
* APIs to support PlayerEntity facing [Item Ratings and Reviews](catalog/ratings.md)
* Support for custom workflow in [authoring with draft states](catalog/item-status.md) and [Policies permissions sets for Catalog admins and reviewers](settings.md)
  * You can pre-publish Catalog Items with a future start date
* [Bundle items](bundles.md) that can be linked to multiple external marketplace items

## See also

* [Quickstart](quickstart.md)
* [Settings](settings.md)
* [Stores](stores.md)
