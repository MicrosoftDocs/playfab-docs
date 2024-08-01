---
title: Economy v2 overview
author: joannaleecy
description: Learn the differences and changes from PlayFab Economy v1 to v2
ms.author: joanlee
ms.date: 09/28/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy
ms.localizationpriority: medium
---

# Economy v2 overview

[!INCLUDE [notice](../../includes/_economy-release.md)]

Economy v2 is a major change from the existing PlayFab Monetization suite of features. The goal of the change is to support titles with hundreds of millions of active players, large progression systems, and giant inventories. The architecture has been rebuilt on the modern Azure Stack from the ground up and it targets developers' needs related to the following features.

* Idempotent transactions
* Batch operations
* Handling of high [concurrency](catalog/etags.md) rates, especially with inventory interactions
* Large unified catalog (unlimited number of items) of in-game goods or user-generated content (UGC)  
* Individual Catalog Item documents instead of all items being stored in a single document
* Large player inventories ([3,000+ items](catalog/limits.md))
* Integration with PlayFab Entities

Economy v2 is designed with the same flexibility and extensibility that you would expect from other PlayFab services. Although the architecture is new to PlayFab, it's battle-tested and it supports internal Microsoft titles, such as **Minecraft**, **Sea of Thieves**, and **Flight Simulator**.

Interested to find out why we made Economy V2 and how you can use the improvements in your title?
>[!VIDEO https://www.youtube.com/embed/NcvFFgTZ6ek]

## Which version of Economy should I use?

You should use version 2. If you're on version 1, you should look at upgrading. Although we're _not_ deprecating v1 and will maintain and support it for all titles, it's in bugfix-only mode. The new Economy features are being developed only for version 2. For more information on the differences between the two versions, see [FAQ](faq.md).

## Changes in key features

Features of Economy that were too restrictive to be useful didn't make the cut to v2. To remediate this, we launched Azure Functions as an enhanced successor to CloudScript. We also provided a recipe-style documentation as a starting point for your own custom implementations. We then focused our efforts on what you told us was most important.

The following v1 features aren’t included in Economy v2:

* Trading (see the [Roadmap](../../roadmap/index.md))
* Converting items  
* Limited items
* Drop tables
* Containers
* Recharge rates
* Store support for segments

Economy v2 brings new useful features:

* Updated interactions between the [inventory](inventory/index.md) and catalog allow you to support unique items, non-unique items, stacks of items, and multiple stacks of items.
* Catalog items have [metadata](catalog/content-types-tags-and-properties.md) and content, including images and files, can be uploaded and managed alongside your catalog.
* [Deep links](catalog/deep-links.md) to game content can now be created using the economy settings.
* Customizable [catalog search](catalog/search.md) allows you to set up custom views with tags and content types.
* Simple way to [localize](catalog/localization.md) item descriptions and titles.
* APIs that support PlayerEntity-facing [Item Ratings and Reviews](catalog/ratings.md).
* Support for custom workflow in [authoring with draft states](catalog/item-status.md) and [policy permissions sets for catalog admins and reviewers](settings.md). You can prepublish catalog items with a future start date.
* [Bundle items](bundles.md) that can be linked to multiple external marketplace items.

## See also

* [Quickstart](quickstart.md)
* [Settings](settings.md)
* [Stores](stores.md)
