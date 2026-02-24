---
title: FileDetails
author: ronnyparedes
description: FileDetails data type.
ms.author: ronnyparedes
ms.date: 02/12/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# FileDetails

Details about a file attached to an entity.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ByteCount|int32|The current size of the file in bytes.|
|Checksum|String|The current checksum of the file.|
|FileName|String|The name of the file.|
|Operation|[OperationTypes](operationtypes.md)|The type of operation that was performed on the file.|
|PreviousByteCount|int32|The previous size of the file in bytes.|
|PreviousChecksum|String|The previous checksum of the file.|
|PreviousStoragePath|String|The previous storage path of the file.|
|StoragePath|String|The current storage path of the file.|
|StorageSystem|[ProfileFileStorage](profilefilestorage.md)|The storage system where the file is stored.|
