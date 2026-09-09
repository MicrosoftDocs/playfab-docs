---
author: jasonsandlin
title: "PFGameSaveFilesIsConnectedToCloud"
description: "Returns if the user is connected to cloud. The user can be disconnected from cloud when calling PFGameSaveFilesAddUserWithUiAsync() without network access and the user chooses PFGameSaveFilesUiSyncFailedUserAction::UseOffline in the PFGameSaveFilesUiSyncFailedCallback. The user can also be disconnected from cloud at anytime if another device becomes the active device. When disconnected from cloud, PFGameSaveFilesAddUserWithUiAsync() can be called again if you want to try connect to the cloud. It will show the failure UI again if the network is still offline. No need to re-init gamesave but you can if desired. While disconnected from cloud, PFGameSaveFilesUploadWithUiAsync() will not do anything but return E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD in the async completion even if there's network access."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesIsConnectedToCloud  

Returns if the user is connected to cloud. The user can be disconnected from cloud when calling PFGameSaveFilesAddUserWithUiAsync() without network access and the user chooses PFGameSaveFilesUiSyncFailedUserAction::UseOffline in the PFGameSaveFilesUiSyncFailedCallback. The user can also be disconnected from cloud at anytime if another device becomes the active device. When disconnected from cloud, PFGameSaveFilesAddUserWithUiAsync() can be called again if you want to try connect to the cloud. It will show the failure UI again if the network is still offline. No need to re-init gamesave but you can if desired. While disconnected from cloud, PFGameSaveFilesUploadWithUiAsync() will not do anything but return E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD in the async completion even if there's network access.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesIsConnectedToCloud(  
    PFLocalUserHandle localUserHandle,  
    bool* isConnectedToCloud  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user whose quota to return.  
  
**`isConnectedToCloud`** &nbsp; bool*  
*output*  
  
Set to true if the user is connected to cloud  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFGameSaveFiles.h
  
## See also  
[PFGameSaveFiles members](../pfgamesavefiles_members.md)  

  
  
