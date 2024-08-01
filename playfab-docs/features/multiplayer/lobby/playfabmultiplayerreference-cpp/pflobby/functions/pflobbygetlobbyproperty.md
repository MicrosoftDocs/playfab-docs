---
author: ScottMunroMS
title: "PFLobbyGetLobbyProperty"
description: "Get the lobby property value from its key."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/07/2023
---

# PFLobbyGetLobbyProperty  

Get the lobby property value from its key.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetLobbyProperty(  
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
  
Lobby properties are only visible to members of the lobby. <br /><br /> If this lobby object is still in the process of asynchronously being created, joined, or claimed via a call to [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md), [PFMultiplayerCreateAndClaimServerLobby](pfmultiplayercreateandclaimserverlobby.md), [PFMultiplayerClaimServerLobby()](pfmultiplayerclaimserverlobby.md) or [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return no properties.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
