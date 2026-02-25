---
title: title_data_updated
author: ronnyparedes
description: title_data_updated event.
ms.author: ronnyparedes
ms.date: 02/12/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_data_updated

This event is triggered when title data is updated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Keys|String[]|The keys that were updated.|
|OverrideLabel|String|The override label. Empty if primary title data.|
|TitleDataType|[TitleDataType](../data-types/titledatatype.md)|The type of title data.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
