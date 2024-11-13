---
author: ScottMunroMS
title: "PFLobbyGetServer"
description: "Gets the server entity joined to the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyGetServer  

Gets the server entity joined to the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetServer(  
    PFLobbyHandle lobby,  
    const PFEntityKey** server  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`server`** &nbsp; [PFEntityKey**](../../pfmultiplayer/pfentitykey_clientsdk.md)  
*library-allocated output, may return nullptr*  
  
The output lobby server entity.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby isn't a client-owned lobby, no server is returned.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
