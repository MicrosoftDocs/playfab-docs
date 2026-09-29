---
author: jasonsandlin
title: "PFGameSaveFilesUploadWithUiAsync"
description: "Uploads all the files and folders in the folder returned by PFGameSaveFilesGetFolder(). The user must be added first. On non-Windows platforms, the upload happens in the same process as the game and might trigger these UI callbacks: PFGameSaveFilesUiProgressCallback, PFGameSaveFilesUiSyncFailedCallback On XBOX and Windows platforms, the upload is done out of process and stock UI is provided by the system. Calling this API is optional on XBOX and Windows platforms as the upload will automatically happen when the game isn't running."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUploadWithUiAsync  

Uploads all the files and folders in the folder returned by PFGameSaveFilesGetFolder(). The user must be added first. On non-Windows platforms, the upload happens in the same process as the game and might trigger these UI callbacks: PFGameSaveFilesUiProgressCallback, PFGameSaveFilesUiSyncFailedCallback On XBOX and Windows platforms, the upload is done out of process and stock UI is provided by the system. Calling this API is optional on XBOX and Windows platforms as the upload will automatically happen when the game isn't running.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesUploadWithUiAsync(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveFilesUploadOption option,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user whose game save files and folders to upload.  
  
**`option`** &nbsp; [PFGameSaveFilesUploadOption](../../pfgamesavefilestypes/enums/pfgamesavefilesuploadoption.md)  
  
Option to use when uploading the files and folders.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
An XAsyncBlock for polling the call's status and retrieving the call results.  
  
  
### Return value
Type: HRESULT
  
To retrieve the result of a call to PFGameSaveFilesUploadWithUiAsync, call PFGameSaveFilesUploadWithUiResult.
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
