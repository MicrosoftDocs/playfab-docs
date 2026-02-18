---
title: player_redeemed_coupon
author: ernestoc
description: player_redeemed_coupon event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_redeemed_coupon

This event is triggered when a player redeems a coupon.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| CouponCode | String | Coupon code the player redeemed. |
| GrantedInventoryItems | [CouponGrantedInventoryItem](../data-types/coupongrantedinventoryitem.md) | Items added to the player's inventory by redeeming the coupon. |
| TitleId | String | The ID of the title to which this player event applies. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
