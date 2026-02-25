---
title: player_display_name_filtered
author: joannaleecy
description: player_display_name_filtered event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_display_name_filtered

This event is triggered when a display name is filtered by community sift only if there is an associated player EntityId for the event.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DisplayName|String|Value of the display name that was filtered|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
