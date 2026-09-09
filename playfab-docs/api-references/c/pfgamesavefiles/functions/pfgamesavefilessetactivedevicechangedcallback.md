---
author: jasonsandlin
title: "PFGameSaveFilesSetActiveDeviceChangedCallback"
description: "Sets the active device changed callback. When this callback is triggered, it means the user moved to another device so this title should return to main menu"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesSetActiveDeviceChangedCallback  

Sets the active device changed callback. When this callback is triggered, it means the user moved to another device so this title should return to main menu  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesSetActiveDeviceChangedCallback(  
    XTaskQueueHandle callbackQueue,  
    PFGameSaveFilesActiveDeviceChangedCallback* callback,  
    void* context  
)  
```  
  
### Parameters  
  
**`callbackQueue`** &nbsp; XTaskQueueHandle  
*optional*  
  
The async queue the callback should be invoked on.  
  
**`callback`** &nbsp; PFGameSaveFilesActiveDeviceChangedCallback*  
  
The callback to be invoked when the active device changes.  
  
**`context`** &nbsp; void*  
*optional*  
  
The context to be passed to the callback.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
