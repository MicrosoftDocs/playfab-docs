---
title: OriginatorObject
author: valexao
description: OriginatorObject data type.
ms.author: vorelien
ms.date: 01/21/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# OriginatorObject

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Id|String|Source of the Playstream event - will be PlayFab if the event originated from us.|
|Type|String|The type of the source of this event. List of possible values found here: [SourceType](../data-types/sourcetype.md)|