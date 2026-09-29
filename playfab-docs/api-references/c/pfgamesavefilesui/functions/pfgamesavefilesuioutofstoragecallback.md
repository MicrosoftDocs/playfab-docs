---
author: jasonsandlin
title: "PFGameSaveFilesUiOutOfStorageCallback"
description: "Callback triggered when the local device is out of storage space."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiOutOfStorageCallback  

Callback triggered when the local device is out of storage space.  

## Syntax  
  
```cpp
void PFGameSaveFilesUiOutOfStorageCallback(  
    PFLocalUserHandle localUserHandle,  
    uint64_t requiredBytes,  
    void* context  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user handle.  
  
**`requiredBytes`** &nbsp; uint64_t  
  
Required bytes.  
  
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

  
  
