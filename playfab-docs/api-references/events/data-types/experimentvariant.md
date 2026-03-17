---
title: ExperimentVariant
author: joelku
description: ExperimentVariant data type.
ms.author: joelku
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# ExperimentVariant

A variant within an experiment.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Id|String|The unique identifier of the variant.|
|Name|String|The name of the variant.|
|TrafficPercentage|int32|The percentage (0 to 100) of players in the experiment that will see this variant.|
|IsControl|Boolean|Specifies if variant is the control for the experiment.|
|TitleDataOverrideLabel|String|The title data override label.|
|Variables|[ExperimentVariable](experimentvariable.md)[]|The variables returned by this variant.|
