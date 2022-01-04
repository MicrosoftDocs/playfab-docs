---
author: ScottMunroMS
title: "PFLobbyGetLobbyPropertyKeys"
description: "Get the list of lobby property keys."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyGetLobbyPropertyKeys  

Get the list of lobby property keys.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetLobbyPropertyKeys(  
    PFLobbyHandle lobby,  
    uint32_t* propertyCount,  
    const char*** keys  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`propertyCount`** &nbsp; uint32_t*  
*output*  
  
The output count of lobby properties.  
  
**`keys`** &nbsp; char***  
*library-allocated output array of size `*propertyCount`*  
  
The output array of lobby property keys.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
Lobby properties are only visible to members of the lobby. <br /><br /> If this lobby object is still in the process of asynchronously being created or joined via a call to [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md) or [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return no keys.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
