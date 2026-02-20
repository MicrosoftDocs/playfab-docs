---
title: player_started_purchase
author: ernestoc
description: player_started_purchase event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_started_purchase

This event is triggered when a player starts a purchase.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| CatalogVersion | String | Catalog version for the items to be purchased. Defaults to most recent catalog. |
| Contents | [CartItem](../data-types/cartitem.md) | Cart items to be purchased. |
| OrderId | String | Purchase order identifier. |
| StoreId | String | Store through which to purchase items. If not set, prices will be pulled from the catalog itself. |
| TitleId | String | The ID of the title to which this player event applies. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
