---
title: SegmentMembershipChange
author: joannaleecy
description: SegmentMembershipChange data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# SegmentMembershipChange

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Change|[SegmentMembershipChangeType](segmentmembershipchangetype.md)|Type of the segment membership status change.|
|EventId|String|ID of the PlayStream event that caused the segment membership status to change.|
|SegmentId|String|ID of the segment in which the player's membership status changed.|
