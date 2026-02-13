---
title: player_data_exported
author: joannaleecy
description: player_data_exported event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_data_exported

This event is triggered when a player's data is exported.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ExportDownloadUrl|String|URL to download the export.|
|JobReceiptId|String|Receipt ID of the export job. This should correspond to the receipt ID returned by the export API call.|
|RequestTime|DateTime|The time of export request.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
