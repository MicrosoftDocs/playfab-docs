---
author: jasonsandlin
title: "PFGameSaveFilesUiProgressGetProgress"
description: "Gets the current progress of the sync operation. Call this from within PFGameSaveFilesUiProgressCallback or poll it periodically while a sync is in progress to get up-to-date byte-level progress. During PreparingForUpload, current/total reflect uncompressed bytes processed/expected. During Uploading, current/total reflect uncompressed bytes transferred/expected. During Downloading, current/total reflect bytes downloaded/expected. If total is 0, the total size is not yet known -- titles should treat this as indeterminate progress (e.g., show a spinner) rather than dividing by zero or displaying 0%."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiProgressGetProgress  

Gets the current progress of the sync operation. Call this from within PFGameSaveFilesUiProgressCallback or poll it periodically while a sync is in progress to get up-to-date byte-level progress. During PreparingForUpload, current/total reflect uncompressed bytes processed/expected. During Uploading, current/total reflect uncompressed bytes transferred/expected. During Downloading, current/total reflect bytes downloaded/expected. If total is 0, the total size is not yet known -- titles should treat this as indeterminate progress (e.g., show a spinner) rather than dividing by zero or displaying 0%.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesUiProgressGetProgress(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveFilesSyncState* syncState,  
    uint64_t* current,  
    uint64_t* total  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user handle.  
  
**`syncState`** &nbsp; [PFGameSaveFilesSyncState*](../../pfgamesavefilestypes/enums/pfgamesavefilessyncstate.md)  
*optional output*  
  
Sync state of the operation.  
  
**`current`** &nbsp; uint64_t*  
*optional output*  
  
Current bytes processed in the active state.  
  
**`total`** &nbsp; uint64_t*  
*optional output*  
  
Total bytes expected in the active state.  
  
  
### Return value
Type: HRESULT
  
TBD  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
