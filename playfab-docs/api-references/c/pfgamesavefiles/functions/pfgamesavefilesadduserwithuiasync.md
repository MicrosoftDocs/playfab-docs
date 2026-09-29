---
author: jasonsandlin
title: "PFGameSaveFilesAddUserWithUiAsync"
description: "Adds a user to the game save system. This downloads save state from the cloud as needed, and might trigger these UI callbacks: PFGameSaveFilesUiProgressCallback, PFGameSaveFilesUiSyncFailedCallback, PFGameSaveFilesUiActiveDeviceContentionCallback, PFGameSaveFilesUiConflictCallback, PFGameSaveFilesUiOutOfStorageCallback See PFGameSaveFilesSetUiCallbacks for more detail. PFGameSaveFilesInitialize must be called prior. On XBOX and Windows platforms, stock UI is provided by the system."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesAddUserWithUiAsync  

Adds a user to the game save system. This downloads save state from the cloud as needed, and might trigger these UI callbacks: PFGameSaveFilesUiProgressCallback, PFGameSaveFilesUiSyncFailedCallback, PFGameSaveFilesUiActiveDeviceContentionCallback, PFGameSaveFilesUiConflictCallback, PFGameSaveFilesUiOutOfStorageCallback See PFGameSaveFilesSetUiCallbacks for more detail. PFGameSaveFilesInitialize must be called prior. On XBOX and Windows platforms, stock UI is provided by the system.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesAddUserWithUiAsync(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveFilesAddUserOptions options,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user to add.  
  
**`options`** &nbsp; [PFGameSaveFilesAddUserOptions](../../pfgamesavefilestypes/enums/pfgamesavefilesadduseroptions.md)  
  
Options to use when adding the user.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
An XAsyncBlock for polling the call's status and retrieving the call results.  
  
  
### Return value
Type: HRESULT
  
To retrieve the result of a call to PFGameSaveFilesAddUserWithUiAsync, call PFGameSaveFilesAddUserWithUiResult. After this call completes, you can call PFGameSaveFilesGetFolder to get the root folder of the game save files and folders for this user. All the root folder's files and subfolders will be synchronized with the cloud. This can only be called once per user, typically before showing the game's main menu. To re-trigger the download the same user, call PFGameSaveFilesUninitializeAsync and wait for it to complete first
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
