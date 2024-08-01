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

* [GetInventoryItems](/rest/api/playfab/economy/inventory/get-inventory-items)
* [GetInventoryCollectionIds](/rest/api/playfab/economy/inventory/get-inventory-collection-ids)
* [GetMicrosoftStoreAccessTokens](/rest/api/playfab/economy/inventory/get-microsoft-store-access-tokens/)
* [RedeemAppleAppStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-apple-app-store-inventory-items)
* [RedeemGooglePlayInventoryItems](/rest/api/playfab/economy/inventory/redeem-google-play-inventory-items)
* [RedeemMicrosoftStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items)
* [RedeemNintendoEShopInventoryItems](/rest/api/playfab/economy/inventory/redeem-nintendo-e-shop-inventory-items)
* [RedeemPlayStationStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-play-station-store-inventory-items)
* [RedeemSteamInventoryItems](/rest/api/playfab/economy/inventory/redeem-steam-inventory-items)

## Resources

* For the most up-to-date view of prices per meter, see [PlayFab pricing](https://playfab.com/pricing/)
* See [Consumption Best Practices](../consumption-best-practices.md) to learn how to maintain the lowest rate of meter usage and cost for your game
