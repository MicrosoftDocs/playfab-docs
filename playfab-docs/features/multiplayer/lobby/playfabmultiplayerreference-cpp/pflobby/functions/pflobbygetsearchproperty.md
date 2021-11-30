---
author: tomcoMSFT
title: "PFLobbyGetSearchProperty"
description: "Get the search property value from its key."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PFLobbyGetSearchProperty  

Get the search property value from its key.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetSearchProperty(  
    PFLobbyHandle lobby,  
    const char* key,  
    const char** value  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`key`** &nbsp; char*  
*_Null_terminated_*  
  
The key of the property.  
  
**`value`** &nbsp; char**  
*library-allocated output, may return nullptr*  
  
The output value associated with the key. An output null value signifies the property wasn't present.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
Search properties are visible to non-members of the lobby as metadata which can be used to filter and sort lobby search results. <br /><br /> If this lobby object is still in the process of asynchronously being created or joined via a call to [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md) or [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return no properties.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
