---
author: ScottMunroMS
title: "PFMultiplayerUninitialize"
description: "Immediately reclaims all resources associated with all Multiplayer library objects."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFMultiplayerUninitialize  

Immediately reclaims all resources associated with all Multiplayer library objects.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerUninitialize(  
    PFMultiplayerHandle handle  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
*input not valid afterwards*  
  
The handle of the PFMultiplayer API instance.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If local users were participating in a Lobby, they are removed (it appears to remote lobby clients as if network connectivity to these users has been lost), so best practice is to call ```PFLobbyLeave``` on all lobbies and wait for the corresponding ```PFLobbyLeaveLobbyCompletedStateChange``` to have the local users exit any existing lobbies. <br /><br /> This method is not thread-safe and may not be called concurrently with other Multiplayer library methods. After calling this method, all Multiplayer library state is invalidated.   <br /><br /> Every call to [PFMultiplayerInitialize()](pfmultiplayerinitialize.md) should have a corresponding PFMultiplayerUninitialize() call.
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerInitialize](pfmultiplayerinitialize.md)
  
  
