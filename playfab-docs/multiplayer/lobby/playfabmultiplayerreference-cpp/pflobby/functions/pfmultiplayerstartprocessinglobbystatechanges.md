---
author: ScottMunroMS
title: "PFMultiplayerStartProcessingLobbyStateChanges"
description: "Retrieves an array of all PFLobbyStateChanges to process since the last such call."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/16/2022
---

# PFMultiplayerStartProcessingLobbyStateChanges  

Retrieves an array of all PFLobbyStateChanges to process since the last such call.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerStartProcessingLobbyStateChanges(  
    PFMultiplayerHandle handle,  
    uint32_t* stateChangeCount,  
    const PFLobbyStateChange* const** stateChanges  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`stateChangeCount`** &nbsp; uint32_t*  
*output*  
  
The output number of PFLobbyStateChange entries for the title to handle in the `stateChanges` array.  
  
**`stateChanges`** &nbsp; PFLobbyStateChange* const**  
*library-allocated output array of size `*stateChangeCount`*  
  
A library-allocated output array of all PFLobbyStateChange entries for the title to handle and then pass to [PFMultiplayerFinishProcessingLobbyStateChanges()](pfmultiplayerfinishprocessinglobbystatechanges.md).  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method provides the Lobby library an opportunity to synchronize state with remote devices or services, and retrieves a list of all changes currently available for the title since the last call to this method. The title should use the provided array of 0 or more changes to update its own state or UI, and then call [PFMultiplayerFinishProcessingLobbyStateChanges()](pfmultiplayerfinishprocessinglobbystatechanges.md) with them in a timely manner. <br /><br /> Lobby library state exposed by the library can change during this call, so you must be thread-safe in your use of it. For example, invoking PFMultiplayerStartProcessingLobbyStateChanges() on your UI thread at the same time a separate worker thread is looping through the list of lobby members returned by [PFLobbyGetMembers()](pflobbygetmembers.md) may result in crashes because PFMultiplayerStartProcessingLobbyStateChanges() can alter the memory associated with the member list. PFMultiplayerStartProcessingLobbyStateChanges() should be called frequently-- at least once per graphics frame. It's designed to execute and return quickly such that it can be called on your main UI thread with negligible impact. For best results, you should also minimize the time you spend handling state changes before calling PFMultiplayerFinishProcessingLobbyStateChanges().   <br /><br /> Each state change returned by PFMultiplayerStartProcessingLobbyStateChanges() must be returned to PFMultiplayerFinishProcessingLobbyStateChanges() exactly once, but may be returned out of order and may be interleaved with state changes from other calls to PFMultiplayerStartProcessingLobbyStateChanges(). Any resources associated with a specific state change are guaranteed to stay valid until the state change is returned to PFMultiplayerFinishProcessingLobbyStateChanges().
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  
[PFLobbyStateChange](../structs/pflobbystatechange.md)  
[PFMultiplayerFinishProcessingLobbyStateChanges](pfmultiplayerfinishprocessinglobbystatechanges.md)
  
  
