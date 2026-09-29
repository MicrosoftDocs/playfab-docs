---
author: jasonsandlin
title: "PFGameSaveFilesUiActiveDeviceContentionCallback"
description: "Active device contention callback."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiActiveDeviceContentionCallback  

Active device contention callback.  

## Syntax  
  
```cpp
void PFGameSaveFilesUiActiveDeviceContentionCallback(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveDescriptor* localGameSave,  
    PFGameSaveDescriptor* remoteGameSave,  
    void* context  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user handle.  
  
**`localGameSave`** &nbsp; [PFGameSaveDescriptor*](../../pfgamesavefilestypes/structs/pfgamesavedescriptor.md)  
  
Descriptor of local save game.  
  
**`remoteGameSave`** &nbsp; [PFGameSaveDescriptor*](../../pfgamesavefilestypes/structs/pfgamesavedescriptor.md)  
  
Descriptor of remote save game.  
  
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

  
  
