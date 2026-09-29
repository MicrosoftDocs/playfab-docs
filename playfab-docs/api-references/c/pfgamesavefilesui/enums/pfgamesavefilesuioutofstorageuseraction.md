---
author: jasonsandlin
title: "PFGameSaveFilesUiOutOfStorageUserAction"
description: "The user action of the PFGameSaveFilesUiOutOfStorageCallback."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiOutOfStorageUserAction  

The user action of the PFGameSaveFilesUiOutOfStorageCallback.    

## Syntax  
  
```cpp
enum class PFGameSaveFilesUiOutOfStorageUserAction  : uint32_t  
{  
    Cancel = 0,  
    Retry  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Cancel | Cancel the current operation. |  
| Retry | Local storage space was cleared, so retry |  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
