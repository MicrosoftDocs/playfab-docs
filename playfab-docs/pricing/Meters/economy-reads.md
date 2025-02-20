---
title: Inventory Reads Meter API Description
author: cybtachyon
description: This article details the APIs that cause economy reads meter to increment.
ms.author: derekreese
ms.date: 09/07/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Economy v2 Inventory Reads

Inventory reads are the more common than writes and are comparatively inexpensive.
The following APIs cause the Economy v2 Inventory reads meter to increment.

* [/rest/api/playfab/economy/inventory/get-inventory-items](/rest/api/playfab/economy/inventory/get-inventory-items)
* [/rest/api/playfab/economy/inventory/get-inventory-collection-ids](/rest/api/playfab/economy/inventory/get-inventory-collection-ids)
* [/rest/api/playfab/economy/inventory/get-microsoft-store-access-tokens/](/rest/api/playfab/economy/inventory/get-microsoft-store-access-tokens/)
* [/rest/api/playfab/economy/inventory/redeem-apple-app-store-inventory-items](/rest/api/playfab/economy/inventory/redeem-apple-app-store-inventory-items)
* [/rest/api/playfab/economy/inventory/redeem-google-play-inventory-items](/rest/api/playfab/economy/inventory/redeem-google-play-inventory-items)
* [/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items)
* [/rest/api/playfab/economy/inventory/redeem-nintendo-e-shop-inventory-items](/rest/api/playfab/economy/inventory/redeem-nintendo-e-shop-inventory-items)
* [/rest/api/playfab/economy/inventory/redeem-play-station-store-inventory-items](/rest/api/playfab/economy/inventory/redeem-play-station-store-inventory-items)
* [/rest/api/playfab/economy/inventory/redeem-steam-inventory-items](/rest/api/playfab/economy/inventory/redeem-steam-inventory-items)

## Resources

* For the most up-to-date view of prices per meter, see [https://playfab.com/pricing/](https://playfab.com/pricing/)
* See [../consumption-best-practices.md](../consumption-best-practices.md) to learn how to maintain the lowest rate of meter usage and cost for your game
