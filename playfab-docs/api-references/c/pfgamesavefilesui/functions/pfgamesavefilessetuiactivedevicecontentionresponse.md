---
author: jasonsandlin
title: "PFGameSaveFilesSetUiActiveDeviceContentionResponse"
description: "Sets the user response for the PFGameSaveFilesUiActiveDeviceContentionCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFGameSaveFilesSetUiActiveDeviceContentionResponse  

Sets the user response for the PFGameSaveFilesUiActiveDeviceContentionCallback. This can be called inside or outside of the callback. The state machine won't progress until the the user chooses a response, or the async API is canceled.  

## Syntax  
  
```cpp
HRESULT PFGameSaveFilesSetUiActiveDeviceContentionResponse(  
    PFLocalUserHandle localUserHandle,  
    PFGameSaveFilesUiActiveDeviceContentionUserAction action  
)  
```  
  
### Parameters  
  
**`localUserHandle`** &nbsp; PFLocalUserHandle  
  
Local user handle.  
  
**`action`** &nbsp; [PFGameSaveFilesUiActiveDeviceContentionUserAction](../enums/pfgamesavefilesuiactivedevicecontentionuseraction.md)  
  
The user action.  
  
  
### Return value
Type: HRESULT
  
TBD  
  
  
## Requirements  
  
**Header:** PFGameSaveFilesUi.h
  
## See also  
[PFGameSaveFilesUi members](../pfgamesavefilesui_members.md)  

  
  
