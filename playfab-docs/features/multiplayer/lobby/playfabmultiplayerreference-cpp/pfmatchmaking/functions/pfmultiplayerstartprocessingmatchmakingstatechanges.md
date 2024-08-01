---
author: ScottMunroMS
title: "PFMultiplayerStartProcessingMatchmakingStateChanges"
description: "Retrieves an array of all matchmaking state changes to process since the last such call."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/16/2022
---

# PFMultiplayerStartProcessingMatchmakingStateChanges  

Retrieves an array of all matchmaking state changes to process since the last such call.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerStartProcessingMatchmakingStateChanges(  
    PFMultiplayerHandle handle,  
    uint32_t* stateChangeCount,  
    const PFMatchmakingStateChange* const** stateChanges  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`stateChangeCount`** &nbsp; uint32_t*  
*output*  
  
The output number of PFMatchmakingStateChange entries for the title to handle in the `stateChanges` array.  
  
**`stateChanges`** &nbsp; PFMatchmakingStateChange* const**  
*library-allocated output array of size `*stateChangeCount`*  
  
A library-allocated output array of all PFMatchmakingStateChange entries for the title to handle and then pass to [PFMultiplayerFinishProcessingMatchmakingStateChanges()](pfmultiplayerfinishprocessingmatchmakingstatechanges.md).  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method provides the Matchmaking library an opportunity to synchronize state with remote devices or services, and retrieves a list of all changes currently available for the title since the last call to this method. The title should use the provided array of 0 or more changes to update its own state or UI, and then call [PFMultiplayerFinishProcessingMatchmakingStateChanges()](pfmultiplayerfinishprocessingmatchmakingstatechanges.md) with them in a timely manner. <br /><br /> Matchmaking library state exposed by the library can change during this call, so you must be thread-safe in your use of it. PFMultiplayerStartProcessingMatchmakingStateChanges() should be called frequently-- at least once per graphics frame. It's designed to execute and return quickly such that it can be called on your main UI thread with negligible impact. For best results, you should also minimize the time you spend handling state changes before calling PFMultiplayerFinishProcessingMatchmakingStateChanges().   <br /><br /> Each state change returned by PFMultiplayerStartProcessingMatchmakingStateChanges() must be returned to PFMultiplayerFinishProcessingMatchmakingStateChanges() exactly once, but may be returned out of order and may be interleaved with state changes from other calls to PFMultiplayerStartProcessingMatchmakingStateChanges(). Any resources associated with a specific state change are guaranteed to stay valid until the state change is returned to PFMultiplayerFinishProcessingMatchmakingStateChanges().
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  
[PFMatchmakingStateChange](../structs/pfmatchmakingstatechange.md)  
[PFMultiplayerFinishProcessingMatchmakingStateChanges](pfmultiplayerfinishprocessingmatchmakingstatechanges.md)
  
  
