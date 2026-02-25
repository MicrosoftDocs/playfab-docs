---
title: export_completed
author: ronnyparedes
description: export_completed event.
ms.author: ronnyparedes
ms.date: 02/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# export_completed

This event is triggered when an export operation is completed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Artifacts|[Artifact](../data-types/artifact.md)[]|An array of artifact objects representing the exported files or resources.|
|FailureReason|String|The reason for the export failure, if the export did not succeed.|
|Id|String|The unique identifier for this export operation.|
|Name|String|The name of the export operation.|
|StartTime|DateTime|The timestamp when the export operation started.|
|Status|[EventExportCompletionStatus](../data-types/eventexportcompletionstatus.md)|The status of the export operation indicating whether it succeeded, failed, or was cancelled.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]