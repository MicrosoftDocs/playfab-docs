---
author: ScottMunroMS
title: "PFLobbyGetSearchPropertyKeys"
description: "Get the list of search property keys."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/07/2023
---

# PFLobbyGetSearchPropertyKeys  

Get the list of search property keys.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetSearchPropertyKeys(  
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
  
The output count of search properties.  
  
**`keys`** &nbsp; char* const**  
*library-allocated output array of size `*propertyCount`*  
  
The output array of search property keys.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
Search properties are visible to non-members of the lobby as metadata which can be used to filter and sort lobby search results. <br /><br /> If this lobby object is still in the process of asynchronously being created, joined, or claimed via a call to [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md), [PFMultiplayerCreateAndClaimServerLobby](pfmultiplayercreateandclaimserverlobby.md), [PFMultiplayerClaimServerLobby()](pfmultiplayerclaimserverlobby.md) or [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return no keys.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
