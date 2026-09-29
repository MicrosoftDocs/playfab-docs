---
author: jasonsandlin
title: "PFGameSaveFilesSetUiCallbacks"
description: "Sets the UI callbacks. These UI callbacks will trigger during PFGameSaveFilesAddUserWithUiAsync() or PFGameSaveFilesUploadWithUiAsync(). PFGameSaveFilesAddUserWithUiAsync() may trigger any UI callback while PFGameSaveFilesUploadWithUiAsync() will only trigger PFGameSaveFilesUiProgressCallback and/or PFGameSaveFilesUiSyncFailedCallback. On non-Windows platforms, setting these callbacks is required to trigger game rendered UI dialogs. On XBOX and Windows platforms, file sync is done in out of process and stock UI is provided by the platform however the title can set these callbacks to render custom UI dialogs as desired."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesSetUiCallbacks  

Sets the UI callbacks. These UI callbacks will trigger during PFGameSaveFilesAddUserWithUiAsync() or PFGameSaveFilesUploadWithUiAsync(). PFGameSaveFilesAddUserWithUiAsync() may trigger any UI callback while PFGameSaveFilesUploadWithUiAsync() will only trigger PFGameSaveFilesUiProgressCallback and/or PFGameSaveFilesUiSyncFailedCallback. On non-Windows platforms, setting these callbacks is required to trigger game rendered UI dialogs. On XBOX and Windows platforms, file sync is done in out of process and stock UI is provided by the platform however the title can set these callbacks to render custom UI dialogs as desired.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesSetUiCallbacks(  
    PFGameSaveUICallbacks* callbacks  
)  
```  
  
### Parameters  
  
**`callbacks`** &nbsp; [PFGameSaveUICallbacks*](../structs/pfgamesaveuicallbacks.md)  
  
The callbacks to set.  
  
  
### Return value
Type: HRESULT
  
TBD  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
