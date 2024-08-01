---
author: ScottMunroMS
title: "PFMultiplayerFinishProcessingLobbyStateChanges"
description: "Returns an array of PFLobbyStateChanges that were being processed."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/16/2022
---

# PFMultiplayerFinishProcessingLobbyStateChanges  

Returns an array of PFLobbyStateChanges that were being processed.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerFinishProcessingLobbyStateChanges(  
    PFMultiplayerHandle handle,  
    uint32_t stateChangeCount,  
    const PFLobbyStateChange* const* stateChanges  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`stateChangeCount`** &nbsp; uint32_t  
  
The number of changes, provided in the list specified by `stateChanges`, previously returned by [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) that have now been handled by the title.  
  
**`stateChanges`** &nbsp; PFLobbyStateChange* const*  
*input array of size `stateChangeCount`*  
  
The array of changes previously returned by [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) that have now been handled by the title.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method informs the Lobby library that the state changes reported by a previous call to [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) have now been handled by the title, so their associated resources can be reclaimed. You may call PFMultiplayerFinishProcessingLobbyStateChanges() with any number of state changes. Each state change returned by PFMultiplayerStartProcessingLobbyStateChanges() must be returned to PFMultiplayerFinishProcessingLobbyStateChanges() exactly once, but may be returned out of order and may be interleaved with state changes from other calls to PFMultiplayerStartProcessingLobbyStateChanges(). <br /><br /> Any resources associated with a specific state change are guaranteed to stay valid until the state change is returned to PFMultiplayerFinishProcessingLobbyStateChanges().   <br /><br /> For best results, you should minimize the time you spend handling state changes before calling PFMultiplayerFinishProcessingLobbyStateChanges().
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  
[PFLobbyStateChange](../structs/pflobbystatechange.md)  
[PFMultiplayerStartProcessingLobbyStateChanges](pfmultiplayerstartprocessinglobbystatechanges.md)
  
  
