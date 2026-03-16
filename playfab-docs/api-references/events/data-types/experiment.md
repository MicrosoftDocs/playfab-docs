---
title: Experiment
author: joelku
description: Experiment data type.
ms.author: joelku
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# Experiment

Payload representing updates to experiment configuration.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|StartTime|DateTime|When the experiment should start or was started.|
|DurationInDays|int32|The duration of the experiment in days.|
|SegmentId|String|The ID of the segment to which this experiment applies.|
|ExclusionGroupId|String|The ID of the exclusion group to which this experiment applies.|
|ExclusionGroupTrafficAllocation|int32|Percentage of exclusion-group traffic seen by this experiment.|
|Variants|[ExperimentVariant](experimentvariant.md)[]|List of variants for the experiment.|
