---
title: player_consumed_item
author: ernestoc
description: player_consumed_item event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_consumed_item

This event is triggered when a player consumes an item from their inventory.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| CatalogVersion | String | Version of the catalog from which the consumed inventory item was created. |
| ItemId | String | ID of the catalog item from which the consumed inventory item was created. This can be used to look up the item from the catalog. |
| ItemInstanceId | String | The specific ID of the item that was consumed. |
| PreviousUsesRemaining | uint32 | For multiple use items, the number of uses that remained before the item was consumed. |
| TitleId | String | The ID of the title to which this player event applies. |
| UsesRemaining | uint32 | For multiple use items, the number of uses remaining after the item was consumed. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
