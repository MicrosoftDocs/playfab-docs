---
author: jasonsandlin
title: "PFGameSaveInitArgs"
description: "Init args used by PFGameSave"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveInitArgs  

Init args used by PFGameSave  

## Syntax  
  
```cpp
typedef struct PFGameSaveInitArgs {  
    XTaskQueueHandle backgroundQueue;  
    uint64_t options;  
    const char* saveFolder;  
} PFGameSaveInitArgs;  
```
  
### Members  
  
**`backgroundQueue`** &nbsp; XTaskQueueHandle  
  
An XTaskQueue that should be used for background work. If no queue is provided then a default (threadpool) queue will be used.
  
**`options`** &nbsp; uint64_t  
  
Options from PFGameSaveInitOptions to use when initializing the game save system. Set to PFGameSaveInitOptions::None for default behavior.
  
**`saveFolder`** &nbsp; const char*  
  
On some platforms, the game can store save files in various locations (e.g. My Docs, local app data, etc) On those platforms, this lets the game specify where save files are stored. This should be the root folder of where the game save files are stored. All its files and subfolders will be synchronized with the cloud. This param is ignored on platforms such as XBOX where the game save files are stored in a fixed location. On other platforms such as Steam Deck, it is required to be set to a valid path.
  
  
## Requirements  
  
**Header:** PFGameSaveFilesTypes.h
  
## See also  
[PFGameSaveFilesTypes members](../pfgamesavefilestypes_members.md)  

  
  
