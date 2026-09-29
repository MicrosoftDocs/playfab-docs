---
author: jasonsandlin
title: "Services C API overview - PFGameSaveFiles.h"
description: "Services C API overview - PFGameSaveFiles.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# Services C API overview - PFGameSaveFiles.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFGameSaveFilesActiveDeviceChangedCallback](functions/pfgamesavefilesactivedevicechangedcallback.md) | Callback for when the active device changes. When this callback is triggered, it means the user moved to another device so this title should return to main menu |  
| [PFGameSaveFilesAddUserWithUiAsync](functions/pfgamesavefilesadduserwithuiasync.md) | Adds a user to the game save system. This downloads save state from the cloud as needed, and might trigger these UI callbacks: PFGameSaveFilesUiProgressCallback, PFGameSaveFilesUiSyncFailedCallback, PFGameSaveFilesUiActiveDeviceContentionCallback, PFGameSaveFilesUiConflictCallback, PFGameSaveFilesUiOutOfStorageCallback See PFGameSaveFilesSetUiCallbacks for more detail. PFGameSaveFilesInitialize must be called prior. On XBOX and Windows platforms, stock UI is provided by the system. |  
| [PFGameSaveFilesAddUserWithUiResult](functions/pfgamesavefilesadduserwithuiresult.md) | Retrieves the result of a call to PFGameSaveFilesAddUserWithUiAsync. |  
| [PFGameSaveFilesGetFolder](functions/pfgamesavefilesgetfolder.md) | Returns the root folder of the game save files and folders for this user. All its files and subfolders will be synchronized with the cloud. The user must be added first using PFGameSaveFilesAddUserWithUiAsync. |  
| [PFGameSaveFilesGetFolderSize](functions/pfgamesavefilesgetfoldersize.md) | Returns the size in bytes of the root folder of the game save files and folders for this user. The user must be added first using PFGameSaveFilesAddUserWithUiAsync. |  
| [PFGameSaveFilesGetRemainingQuota](functions/pfgamesavefilesgetremainingquota.md) | Returns the amount of data available to store save data in bytes using the PFGameSaveFiles API. Going over quota will return a negative number and cause the service to block the upload. |  
| [PFGameSaveFilesInitialize](functions/pfgamesavefilesinitialize.md) | Initializes the PlayFab Game Save library instance. |  
| [PFGameSaveFilesIsConnectedToCloud](functions/pfgamesavefilesisconnectedtocloud.md) | Returns if the user is connected to cloud. The user can be disconnected from cloud when calling PFGameSaveFilesAddUserWithUiAsync() without network access and the user chooses PFGameSaveFilesUiSyncFailedUserAction::UseOffline in the PFGameSaveFilesUiSyncFailedCallback. The user can also be disconnected from cloud at anytime if another device becomes the active device. When disconnected from cloud, PFGameSaveFilesAddUserWithUiAsync() can be called again if you want to try connect to the cloud. It will show the failure UI again if the network is still offline. No need to re-init gamesave but you can if desired. While disconnected from cloud, PFGameSaveFilesUploadWithUiAsync() will not do anything but return E_PF_GAMESAVE_DISCONNECTED_FROM_CLOUD in the async completion even if there's network access. |  
| [PFGameSaveFilesResetCloudAsync](functions/pfgamesavefilesresetcloudasync.md) | This resets the cloud game save state for this user. Normally this does not need to be called but might be useful during development or testing. This does not delete or alter the local game save. |  
| [PFGameSaveFilesResetCloudResult](functions/pfgamesavefilesresetcloudresult.md) | Retrieves the result of a call to PFGameSaveFilesResetCloudAsync. |  
| [PFGameSaveFilesSetActiveDeviceChangedCallback](functions/pfgamesavefilessetactivedevicechangedcallback.md) | Sets the active device changed callback. When this callback is triggered, it means the user moved to another device so this title should return to main menu |  
| [PFGameSaveFilesSetSaveDescriptionAsync](functions/pfgamesavefilessetsavedescriptionasync.md) | Set a short save description of the pending game save. This can be seen in the conflict or active device contention UI |  
| [PFGameSaveFilesSetSaveDescriptionResult](functions/pfgamesavefilessetsavedescriptionresult.md) | Retrieves the result of a call to PFGameSaveFilesSetSaveDescriptionAsync. |  
| [PFGameSaveFilesUninitializeAsync](functions/pfgamesavefilesuninitializeasync.md) | Cleanup PlayFab Game Save library instance. |  
| [PFGameSaveFilesUninitializeResult](functions/pfgamesavefilesuninitializeresult.md) | Retrieves the result of a call to PFGameSaveFilesUninitializeAsync. |  
| [PFGameSaveFilesUploadWithUiAsync](functions/pfgamesavefilesuploadwithuiasync.md) | Uploads all the files and folders in the folder returned by PFGameSaveFilesGetFolder(). The user must be added first. On non-Windows platforms, the upload happens in the same process as the game and might trigger these UI callbacks: PFGameSaveFilesUiProgressCallback, PFGameSaveFilesUiSyncFailedCallback On XBOX and Windows platforms, the upload is done out of process and stock UI is provided by the system. Calling this API is optional on XBOX and Windows platforms as the upload will automatically happen when the game isn't running. |  
| [PFGameSaveFilesUploadWithUiResult](functions/pfgamesavefilesuploadwithuiresult.md) | Retrieves the result of a call to PFGameSaveFilesUploadWithUiAsync. |  
