---
title: player_inventory_item_added
author: ernestoc
description: player_inventory_item_added event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_inventory_item_added

This event is triggered when an item is granted to a player.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| Annotation | String | Optional details about the inventory item. |
| BundleContents | [] | Catalog item IDs of any other items granted to the player along with this one as part of a bundle. |
| CatalogVersion | String | Catalog version in which the item that was added is defined. |
| Class | String | Class of the item that was added. |
| CouponCode | String | Redeemed coupon (if any) that granted the item. |
| DisplayName | String | Display name of the item that was added. |
| Expiration | DateTime | When the item expires. The value is null if the item does not expire. |
| InstanceId | String | Unique instance ID of the inventory item that was added. |
| ItemId | String | Catalog item ID of the inventory item that was added. |
| RemainingUses | uint32 | How many uses the item has, if it has a limited number of uses. |
| TitleId | String | The ID of the title to which this player event applies. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
