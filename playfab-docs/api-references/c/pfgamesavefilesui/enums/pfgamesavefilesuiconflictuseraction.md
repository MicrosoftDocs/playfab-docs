---
author: jasonsandlin
title: "PFGameSaveFilesUiConflictUserAction"
description: "The user action of the PFGameSaveFilesUiConflictCallback."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiConflictUserAction  

The user action of the PFGameSaveFilesUiConflictCallback.    

## Syntax  
  
```cpp
enum class PFGameSaveFilesUiConflictUserAction  : uint32_t  
{  
    Cancel = 0,  
    TakeLocal,  
    TakeRemote,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Cancel | Cancel the current operation. |  
| TakeLocal | Take the local version. |  
| TakeRemote | Take the remote version. |  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
