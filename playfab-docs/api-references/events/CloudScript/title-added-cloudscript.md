---
title: title_added_cloudscript
author: joannaleecy
description: title_added_cloudscript event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_added_cloudscript

This event is triggered when new CloudScript is uploaded to PlayFab.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|DeveloperId|String||
|Published|Boolean|Whether the CloudScript that was uploaded is live.|
|Revision|int32|Revision number of the CloudScript file that was added.|
|ScriptNames|[]|Names of the individual script files modified. Currently this is just 'CloudScript.js' but later we'll support multiple files.|
|UserId|String||
|Version|int32|Version number of the CloudScript file that was added.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
