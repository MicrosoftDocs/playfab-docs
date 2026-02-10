---
title: GameSaveConflict
author: alzakrze
description: GameSaveConflict data type.
ms.author: alzakrze
ms.date: 01/22/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events, gamesave
ms.localizationpriority: medium
---

# GameSaveConflict

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ConflictingVersion|Int64|The ID of the version that was in conflict with this version. That version should be assumed to have the opposite IsWinner value.|
|IsWinner|Boolean|Whether this version is the winner of the conflict resolution process.|
