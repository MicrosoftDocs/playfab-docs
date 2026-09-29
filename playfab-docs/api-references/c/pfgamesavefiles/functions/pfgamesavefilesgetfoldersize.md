---
author: jasonsandlin
title: "PFGameSaveFilesGetFolderSize"
description: "Returns the size in bytes of the root folder of the game save files and folders for this user. The user must be added first using PFGameSaveFilesAddUserWithUiAsync."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesGetFolderSize  

Returns the size in bytes of the root folder of the game save files and folders for this user. The user must be added first using PFGameSaveFilesAddUserWithUiAsync.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesGetFolderSize(  
    PFLocalUserHandle localUserHandle,  
    size_t* saveRootFolderSize  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user whose game save folder to return.  
  
**`saveRootFolderSize`** &nbsp; size_t*  
*output*  
  
The size in bytes of the root folder of the game save files and folders.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
