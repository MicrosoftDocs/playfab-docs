---
title: api_operation
author: joelku
description: api_operation event.
ms.author: joelku
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# api_operation

This event is triggered to summarize the actions taken during an invocation of the segmentation CRUD API.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Created|DateTime|The date and time when the operation was submitted.|
|Completed|DateTime|The date and time when the operation was completed.|
|Operation|[SegmentOperation](../data-types/segmentoperation.md)|The segment operation that was performed.|
|OperationStatus|[SegmentOperationStatus](../data-types/segmentoperationstatus.md)|The status of the operation.|
|SegmentId|String|The ID of the segment.|
|SegmentName|String|The name of the segment.|
|SegmentDefinition|String|The segment definition.|
|EnteredSegmentActions|String|The actions triggered when a profile enters the segment.|
|LeftSegmentActions|String|The actions triggered when a profile exits the segment.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
