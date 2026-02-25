---
title: item_moderation_state_changed
author: fprotti96
description: ItemModerationStateChanged event.
ms.author: fprotti
ms.date: 09/29/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# item_moderation_state_changed

This event is triggered when an item moderation state is changed.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| ItemId | String | The string ID of the item whos state was changed. |
| TargetStatus | String | The updated moderation status of the item. |
| Reason | String | The current stated reason for the associated item being moderated. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
