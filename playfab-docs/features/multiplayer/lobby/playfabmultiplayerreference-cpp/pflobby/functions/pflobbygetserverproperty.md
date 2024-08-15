---
author: ScottMunroMS
title: "PFLobbyGetServerProperty"
description: "Get the lobby server property's value from its key."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyGetServerProperty  

Get the lobby server property's value from its key.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetServerProperty(  
    PFLobbyHandle lobby,  
    const char* key,  
    const char** value  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`key`** &nbsp; char*  
*is null-terminated*  
  
The key of the property.  
  
**`value`** &nbsp; char**  
*library-allocated output, may return nullptr*  
  
The output value associated with the key. An output null value signifies the property wasn't present.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby isn't a client-owned lobby, no property value is returned.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
