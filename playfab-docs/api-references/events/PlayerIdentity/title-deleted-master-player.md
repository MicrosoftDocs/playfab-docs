---
title: title_deleted_master_player
author: joannaleecy
description: title_deleted_master_player event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_deleted_master_player

This event is triggered when a GDPR delete is finished.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|MetaData|String|Identifying information for title entered by developer.|
|PlayerId|String|Master Player ID who was deleted.|
|ReceiptId|String|Receipt ID of the delete that has been finished.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
