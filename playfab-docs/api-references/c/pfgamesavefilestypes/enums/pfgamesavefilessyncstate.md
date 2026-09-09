---
author: jasonsandlin
title: "PFGameSaveFilesSyncState"
description: "Sync state of the game save system"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesSyncState  

Sync state of the game save system    

## Syntax  
  
```cpp
enum class PFGameSaveFilesSyncState  : uint32_t  
{  
    NotStarted = 0,  
    PreparingForDownload,  
    Downloading,  
    PreparingForUpload,  
    Uploading,  
    SyncComplete,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NotStarted | Not started |  
| PreparingForDownload | Preparing for download |  
| Downloading | Downloading |  
| PreparingForUpload | The system is reading and compressing local save files in preparation for upload. Do not modify files in the save folder during this state. |  
| Uploading | Local save files have been captured and the upload to the cloud is in progress. It is safe to write to the save folder again during this state; the system no longer reads from the original files. |  
| SyncComplete | Sync complete |  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesTypes.h
  
## See also  
[PFGameSaveFilesTypes members](../pfgamesavefilestypes_members.md)  

  
  
