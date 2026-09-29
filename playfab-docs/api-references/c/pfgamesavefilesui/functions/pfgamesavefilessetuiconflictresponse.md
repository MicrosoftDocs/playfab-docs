---
author: jasonsandlin
title: "PFGameSaveFilesSetUiConflictResponse"
description: "Sets the user response for the PFGameSaveFilesUiConflictCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesSetUiConflictResponse  

Sets the user response for the PFGameSaveFilesUiConflictCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesSetUiConflictResponse(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveFilesUiConflictUserAction action  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user handle.  
  
**`action`** &nbsp; [PFGameSaveFilesUiConflictUserAction](../enums/pfgamesavefilesuiconflictuseraction.md)  
  
The user action.  
  
  
### Return value
Type: HRESULT
  
TBD  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
