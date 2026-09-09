---
author: jasonsandlin
title: "PFGameSaveFilesSetUiProgressResponse"
description: "Sets the user response for the PFGameSaveFilesUiProgressCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesSetUiProgressResponse  

Sets the user response for the PFGameSaveFilesUiProgressCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesSetUiProgressResponse(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveFilesUiProgressUserAction action  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user handle.  
  
**`action`** &nbsp; [PFGameSaveFilesUiProgressUserAction](../enums/pfgamesavefilesuiprogressuseraction.md)  
  
The user action.  
  
  
### Return value
Type: HRESULT
  
TBD  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
