---
author: ScottMunroMS
title: "PFLobbyGetCustomContext"
description: "Retrieves the app's private, custom pointer-sized context value previously associated with this lobby object."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFLobbyGetCustomContext  

Retrieves the app's private, custom pointer-sized context value previously associated with this lobby object.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetCustomContext(  
    PFLobbyHandle lobby,  
    void** customContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`customContext`** &nbsp; void**  
*output, may return nullptr*  
  
The output custom context.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if retrieving the custom context succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If no custom context has been set yet, the value pointed to by `customContext` is set to nullptr.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  
[PFLobbySetCustomContext](pflobbysetcustomcontext.md)
  
  
