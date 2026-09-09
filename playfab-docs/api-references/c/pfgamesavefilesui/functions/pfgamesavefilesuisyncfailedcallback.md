---
author: jasonsandlin
title: "PFGameSaveFilesUiSyncFailedCallback"
description: "Sync failed callback."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiSyncFailedCallback  

Sync failed callback.  

## Syntax  
  
```cpp
void PFGameSaveFilesUiSyncFailedCallback(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveFilesSyncState syncState,  
    HRESULT error,  
    void* context  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user handle.  
  
**`syncState`** &nbsp; [PFGameSaveFilesSyncState](../../pfgamesavefilestypes/enums/pfgamesavefilessyncstate.md)  
  
Sync state of the operation.  
  
**`error`** &nbsp; HRESULT  
  
The failure error code.  
  
**`context`** &nbsp; void*  
*optional*  
  
Context to pass to the callback.  
  
  
### Return value
Type: void
  
TBD  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
