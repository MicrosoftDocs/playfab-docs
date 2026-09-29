---
author: jasonsandlin
title: "PFGameSaveFilesGetFolder"
description: "Returns the root folder of the game save files and folders for this user. All its files and subfolders will be synchronized with the cloud. The user must be added first using PFGameSaveFilesAddUserWithUiAsync."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesGetFolder  

Returns the root folder of the game save files and folders for this user. All its files and subfolders will be synchronized with the cloud. The user must be added first using PFGameSaveFilesAddUserWithUiAsync.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesGetFolder(  
    PFLocalUserHandle localUserHandle,  
    size_t saveRootFolderSize,  
    char* saveRootFolderBuffer,  
    size_t* saveRootFolderUsed  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user whose game save folder to return.  
  
**`saveRootFolderSize`** &nbsp; size_t  
  
The size in bytes of the root folder of the game save files and folders.  
  
**`saveRootFolderBuffer`** &nbsp; char*  
*_Out_writes_(saveRootFolderSize)*  
  
The buffer to receive the root folder of the game save files and folders.  
  
**`saveRootFolderUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
