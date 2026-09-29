---
author: jasonsandlin
title: "Services C API overview - PFGameSaveFilesUi.h"
description: "Services C API overview - PFGameSaveFilesUi.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# Services C API overview - PFGameSaveFilesUi.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFGameSaveFilesSetUiActiveDeviceContentionResponse](functions/pfgamesavefilessetuiactivedevicecontentionresponse.md) | Sets the user response for the PFGameSaveFilesUiActiveDeviceContentionCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled. |  
| [PFGameSaveFilesSetUiCallbacks](functions/pfgamesavefilessetuicallbacks.md) | Sets the UI callbacks. These UI callbacks will trigger during PFGameSaveFilesAddUserWithUiAsync() or PFGameSaveFilesUploadWithUiAsync(). PFGameSaveFilesAddUserWithUiAsync() may trigger any UI callback while PFGameSaveFilesUploadWithUiAsync() will only trigger PFGameSaveFilesUiProgressCallback and/or PFGameSaveFilesUiSyncFailedCallback. On non-Windows platforms, setting these callbacks is required to trigger game rendered UI dialogs. On XBOX and Windows platforms, file sync is done in out of process and stock UI is provided by the platform however the title can set these callbacks to render custom UI dialogs as desired. |  
| [PFGameSaveFilesSetUiConflictResponse](functions/pfgamesavefilessetuiconflictresponse.md) | Sets the user response for the PFGameSaveFilesUiConflictCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled. |  
| [PFGameSaveFilesSetUiOutOfStorageResponse](functions/pfgamesavefilessetuioutofstorageresponse.md) | Sets the user response for the PFGameSaveFilesUiOutOfStorageCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled. |  
| [PFGameSaveFilesSetUiProgressResponse](functions/pfgamesavefilessetuiprogressresponse.md) | Sets the user response for the PFGameSaveFilesUiProgressCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled. |  
| [PFGameSaveFilesSetUiSyncFailedResponse](functions/pfgamesavefilessetuisyncfailedresponse.md) | Sets the user response for the PFGameSaveFilesUiSyncFailedCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled. |  
| [PFGameSaveFilesUiActiveDeviceContentionCallback](functions/pfgamesavefilesuiactivedevicecontentioncallback.md) | Active device contention callback. |  
| [PFGameSaveFilesUiConflictCallback](functions/pfgamesavefilesuiconflictcallback.md) | Conflict callback. |  
| [PFGameSaveFilesUiOutOfStorageCallback](functions/pfgamesavefilesuioutofstoragecallback.md) | Callback triggered when the local device is out of storage space. |  
| [PFGameSaveFilesUiProgressCallback](functions/pfgamesavefilesuiprogresscallback.md) | Notification callback fired when the sync operation transitions to a new state. This callback fires once per state transition (e.g., once for PreparingForUpload, once for Uploading) -- it is NOT fired repeatedly as progress advances within a state. To get granular progress within a state, call PFGameSaveFilesUiProgressGetProgress to poll the current and total byte counts. Titles should treat this as a state-change notification (e.g., show or update a progress dialog) rather than expecting it to fire at a high frequency. |  
| [PFGameSaveFilesUiProgressGetProgress](functions/pfgamesavefilesuiprogressgetprogress.md) | Gets the current progress of the sync operation. Call this from within PFGameSaveFilesUiProgressCallback or poll it periodically while a sync is in progress to get up-to-date byte-level progress. During PreparingForUpload, current/total reflect uncompressed bytes processed/expected. During Uploading, current/total reflect uncompressed bytes transferred/expected. During Downloading, current/total reflect bytes downloaded/expected. If total is 0, the total size is not yet known -- titles should treat this as indeterminate progress (e.g., show a spinner) rather than dividing by zero or displaying 0%. |  
| [PFGameSaveFilesUiSyncFailedCallback](functions/pfgamesavefilesuisyncfailedcallback.md) | Sync failed callback. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFGameSaveUICallbacks](structs/pfgamesaveuicallbacks.md) | UI callbacks for game save operations. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFGameSaveFilesUiActiveDeviceContentionUserAction](enums/pfgamesavefilesuiactivedevicecontentionuseraction.md) | The user action of the PFGameSaveFilesUiActiveDeviceContentionCallback.|  
| [PFGameSaveFilesUiConflictUserAction](enums/pfgamesavefilesuiconflictuseraction.md) | The user action of the PFGameSaveFilesUiConflictCallback.|  
| [PFGameSaveFilesUiOutOfStorageUserAction](enums/pfgamesavefilesuioutofstorageuseraction.md) | The user action of the PFGameSaveFilesUiOutOfStorageCallback.|  
| [PFGameSaveFilesUiProgressUserAction](enums/pfgamesavefilesuiprogressuseraction.md) | The user action of the PFGameSaveFilesUiProgressCallback.|  
| [PFGameSaveFilesUiSyncFailedUserAction](enums/pfgamesavefilesuisyncfaileduseraction.md) | The user action of the PFGameSaveFilesUiSyncFailedCallback.|  
