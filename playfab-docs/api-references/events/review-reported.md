---
title: review_reported
author: fprotti96
description: ReviewReported event.
ms.author: fprotti
ms.date: 09/29/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# review_reported

This event is triggered when a review is reported.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ItemId|String|The string ID of the item associated with the review.|
|ReviewId|String|The string ID of the review being reported.|
|ConcernCategory|String|The category for which this review was reported.|
|Reason|String|The string reason for this report.|
|CreatorEntityKey|[EntityKey](data-types/entitykey.md)|The EntityKey of the creator of the review that was reported.|

## Common Properties

[!INCLUDE [common-properties](../../includes/_common-properties-eventsv2.md)]