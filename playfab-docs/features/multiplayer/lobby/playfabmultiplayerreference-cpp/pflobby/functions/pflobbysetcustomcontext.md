---
author: ScottMunroMS
title: "PFLobbySetCustomContext"
description: "Configures an optional, custom pointer-sized context value with this lobby object."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFLobbySetCustomContext  

Configures an optional, custom pointer-sized context value with this lobby object.  

## Syntax  
  
```cpp
HRESULT PFLobbySetCustomContext(  
    PFLobbyHandle lobby,  
    void* customContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`customContext`** &nbsp; void*  
*optional*  
  
An arbitrary, pointer-sized value to store with the player object.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if configuring the custom context succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
The custom context is typically used as a "shortcut" that simplifies accessing local, title-specific memory associated with the lobby without requiring a mapping lookup. The value is retrieved using the [PFLobbyGetCustomContext()](pflobbygetcustomcontext.md) method. <br /><br /> Any configured value is treated as opaque by the library, and is only valid on the local device; it is not transmitted over the network.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  
[PFLobbyGetCustomContext](pflobbygetcustomcontext.md)
  
  
