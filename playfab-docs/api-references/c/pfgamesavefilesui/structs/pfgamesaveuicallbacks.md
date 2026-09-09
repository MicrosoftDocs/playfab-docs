---
author: jasonsandlin
title: "PFGameSaveUICallbacks"
description: "UI callbacks for game save operations."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveUICallbacks  

UI callbacks for game save operations.  

## Syntax  
  
```cpp
typedef struct PFGameSaveUICallbacks {  
    PFGameSaveFilesUiProgressCallback* progressCallback;  
    void* progressContext;  
    PFGameSaveFilesUiSyncFailedCallback* syncFailedCallback;  
    void* syncFailedContext;  
    PFGameSaveFilesUiActiveDeviceContentionCallback* activeDeviceContentionCallback;  
    void* activeDeviceContentionContext;  
    PFGameSaveFilesUiConflictCallback* conflictCallback;  
    void* conflictContext;  
    PFGameSaveFilesUiOutOfStorageCallback* outOfStorageCallback;  
    void* outOfStorageContext;  
} PFGameSaveUICallbacks;  
```
  
### Members  
  
**`progressCallback`** &nbsp; PFGameSaveFilesUiProgressCallback*  
  
Optional callback for upload and download progress.
  
**`progressContext`** &nbsp; void*  
  
Context to pass to the progressCallback.
  
**`syncFailedCallback`** &nbsp; PFGameSaveFilesUiSyncFailedCallback*  
  
Optional callback for sync failure.
  
**`syncFailedContext`** &nbsp; void*  
  
Context to pass to the syncFailedCallback.
  
**`activeDeviceContentionCallback`** &nbsp; PFGameSaveFilesUiActiveDeviceContentionCallback*  
  
Optional callback for active device contention
  
**`activeDeviceContentionContext`** &nbsp; void*  
  
Context to pass to the activeDeviceContentionCallback.
  
**`conflictCallback`** &nbsp; PFGameSaveFilesUiConflictCallback*  
  
Optional callback for conflict between local and remote save data.
  
**`conflictContext`** &nbsp; void*  
  
Context to pass to the conflictCallback.
  
**`outOfStorageCallback`** &nbsp; PFGameSaveFilesUiOutOfStorageCallback*  
  
Optional callback for out of local storage.
  
**`outOfStorageContext`** &nbsp; void*  
  
Context to pass to the outOfStorageCallback.
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
