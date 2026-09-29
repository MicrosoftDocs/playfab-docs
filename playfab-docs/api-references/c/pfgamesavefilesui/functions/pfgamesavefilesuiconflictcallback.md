---
author: jasonsandlin
title: "PFGameSaveFilesUiConflictCallback"
description: "Conflict callback."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiConflictCallback  

Conflict callback.  

## Syntax  
  
```cpp
void PFGameSaveFilesUiConflictCallback(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveDescriptor* localGameSave,  
    PFGameSaveDescriptor* remoteGameSave,  
    void* context  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
TBD    
  
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

  
  
