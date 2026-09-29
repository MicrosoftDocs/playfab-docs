---
author: jasonsandlin
title: "PFGameSaveFilesUiProgressCallback"
description: "Notification callback fired when the sync operation transitions to a new state. This callback fires once per state transition (e.g., once for PreparingForUpload, once for Uploading) -- it is NOT fired repeatedly as progress advances within a state. To get granular progress within a state, call PFGameSaveFilesUiProgressGetProgress to poll the current and total byte counts. Titles should treat this as a state-change notification (e.g., show or update a progress dialog) rather than expecting it to fire at a high frequency."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiProgressCallback  

Notification callback fired when the sync operation transitions to a new state. This callback fires once per state transition (e.g., once for PreparingForUpload, once for Uploading) -- it is NOT fired repeatedly as progress advances within a state. To get granular progress within a state, call PFGameSaveFilesUiProgressGetProgress to poll the current and total byte counts. Titles should treat this as a state-change notification (e.g., show or update a progress dialog) rather than expecting it to fire at a high frequency.  

## Syntax  
  
```cpp
void PFGameSaveFilesUiProgressCallback(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveFilesSyncState syncState,  
    void* context  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user handle.  
  
**`syncState`** &nbsp; [PFGameSaveFilesSyncState](../../pfgamesavefilestypes/enums/pfgamesavefilessyncstate.md)  
  
The new sync state of the operation.  
  
**`context`** &nbsp; void*  
*optional*  
  
Context pointer passed during callback registration.  
  
  
### Return value
Type: void
  
TBD  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
