---
author: jasonsandlin
title: "PFGameSaveFilesActiveDeviceChangedCallback"
description: "Callback for when the active device changes. When this callback is triggered, it means the user moved to another device so this title should return to main menu"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesActiveDeviceChangedCallback  

Callback for when the active device changes. When this callback is triggered, it means the user moved to another device so this title should return to main menu  

## Syntax  
  
```cpp
void PFGameSaveFilesActiveDeviceChangedCallback(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveDescriptor* activeDevice,  
    void* context  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user handle.  
  
**`activeDevice`** &nbsp; [PFGameSaveDescriptor*](../../pfgamesavefilestypes/structs/pfgamesavedescriptor.md)  
  
Active device metadata.  
  
**`context`** &nbsp; void*  
*optional*  
  
Context passed to the callback.  
  
  
### Return value
Type: void
  
TBD  
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
