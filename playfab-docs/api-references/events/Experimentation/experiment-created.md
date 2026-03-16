---
title: experiment_created
author: joelku
description: experiment_created event.
ms.author: joelku
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# experiment_created

This event is triggered when an experiment is created.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Id|String|The unique identifier of the experiment.|
|Name|String|The friendly name of the experiment.|
|UsesOverrides|Boolean|Specifies whether the experiment uses title data overrides.|
|UsesExclusionGroup|Boolean|Specifies whether the experiment uses an exclusion group.|
|Experiment|[Experiment](../data-types/experiment.md)|The experiment configuration payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]