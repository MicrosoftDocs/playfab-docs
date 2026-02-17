---
title: gamesave_version_finalized
author: alzakrze
description: gamesave_version_finalized event.
ms.author: alzakrze
ms.date: 01/22/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events, gamesave
ms.localizationpriority: medium
---

# gamesave_version_finalized

This event is triggered when a game save version is finalized with all the files fully uploaded.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Version|Int64|The version of the game save that was finalized.|
|PlayerIdentityProvider|String|The login identity provider used by the player uploading the game save.|
|DeviceType|String|The type of device used for this game save version.|
|FinalizedAt|DateTime|The time at which the game save version was finalized.|
|NewFileCount|Int32|The number of new files that were added to the game save store for this version.|
|NewFilesSizeBytes|Int64|The size in bytes of the new files that were added to the game save store for this version.|
|TotalFileCount|Int32|The total number of files that were included in the finalized game save version.|
|TotalSizeBytes|Int64|The total size in bytes of the finalized game save version, including all files.|
|IsGeneratedByRollback|Boolean|Whether the version was generated and finalized by a rollback operation.|
|Conflict|[GameSaveConflict](../data-types/gamesaveconflict.md)|Data about any conflict that occurred during the finalization of the game save version. This will usually be null if the version was not finalized during a conflict resolution operation.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]