---
author: jasonsandlin
title: "PFGameSaveFilesUiSyncFailedUserAction"
description: "The user action of the PFGameSaveFilesUiSyncFailedCallback."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesUiSyncFailedUserAction  

The user action of the PFGameSaveFilesUiSyncFailedCallback.    

## Syntax  
  
```cpp
enum class PFGameSaveFilesUiSyncFailedUserAction  : uint32_t  
{  
    Cancel = 0,  
    Retry,  
    UseOffline  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Cancel | Cancel the current operation. |  
| Retry | Retry the current operation. |  
| UseOffline | Treat the user as disconnected from cloud. This action may only be set during PFGameSaveFilesAddUserWithUiAsync() If PFGameSaveFilesAddUserWithUiAsync() was called without network access and the user chooses PFGameSaveFilesUiSyncFailedUserAction::UseOffline in the PFGameSaveFilesUiSyncFailedCallback then the user is considered disconnected from cloud. When the user is disconnected from cloud, PFGameSaveFilesAddUserWithUiAsync() can be called again if you want to try to make the user connected to cloud. It will show the failure UI again if the network is still offline. No need to re-init gamesave but you can if desired. While the user is disconnected from cloud, PFGameSaveFilesUploadWithUiAsync() will not do anything but return E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD in the async completion even if there's network access. |  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
