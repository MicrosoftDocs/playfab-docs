---
title: item_reported
author: ernestoc
description: ItemReported event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# item_reported

This event is triggered when an item is reported.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| ItemId | String | The string ID of the item that was reported. |
| ItemType | String | The string type of the item that was reported. |
| CreatorEntityKey | [EntityKey](../data-types/entitykey.md) | The item's creator. |
| ConcernCategory | String | The category for which this item was reported. |
| Reason | String | The reason for which this item was reported. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
