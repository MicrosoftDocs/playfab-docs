---
title: player_experiment_variants_changed
author: joelku
description: player_experiment_variants_changed event.
ms.author: joelku
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_experiment_variants_changed

This event is triggered when a player's set of experiment variants is changed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|PreviousExperimentVariants|String[]|Previous experiment variant list.|
|ExperimentVariants|String[]|New experiment variant list.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]