---
title: title_news_updated
author: joannaleecy
description: title_news_updated event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_news_updated

This event is triggered when a title news is created or updated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DateCreated|DateTime|When the title news was initially created.|
|NewsId|String|Id of the news that is new or updated.|
|NewsTitle|String|The current title of the news that is new or updated.|
|Status|[NewsStatus](../data-types/newsstatus.md)|The current status of the news that is new or updated.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
