---
title: display_name_filtered
author: joannaleecy
description: display_name_filtered event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# display_name_filtered

This event is triggered when a display name is filtered by community sift.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DisplayName|String|Value of the display name that was filtered|
|PlayerId|String|If event occurs at account creation, then no player exists yet. Otherwise, the player whose displayname update was filtered|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
