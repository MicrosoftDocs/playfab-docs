---
title: FileSet
author: joannaleecy
description: FileSet data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# FileSet

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ByteCount|int32|The storage size according to the underlying provider.|
|Checksum|String|The checksum according to the underlying provider.|
|FileName|String|File that was updated.|
|Operation|[OperationTypes](operationtypes.md)|The operation that was performed.|
|PreviousByteCount|int32|The storage size of the old file, if there was one.|
|PreviousChecksum|String|The storage size of the old file, if there was one.|
|PreviousStoragePath|String|The old file's unique storage path that was deleted by this operation, if there was one.|
|StoragePath|String|The unique storage path for this set operation.|



