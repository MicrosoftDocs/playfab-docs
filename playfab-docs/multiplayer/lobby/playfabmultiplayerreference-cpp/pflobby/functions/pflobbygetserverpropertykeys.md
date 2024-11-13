---
author: ScottMunroMS
title: "PFLobbyGetServerPropertyKeys"
description: "Get a list of the lobby server's property keys."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyGetServerPropertyKeys  

Get a list of the lobby server's property keys.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetServerPropertyKeys(  
    PFLobbyHandle lobby,  
    uint32_t* propertyCount,  
    const char* const** keys  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`propertyCount`** &nbsp; uint32_t*  
*output*  
  
The output count of lobby server properties.  
  
**`keys`** &nbsp; char* const**  
*library-allocated output array of size `*propertyCount`*  
  
The output array of lobby server property keys.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby isn't a client-owned lobby, no property keys are returned.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
