---
author: ScottMunroMS
title: "PFMultiplayerFinishProcessingMatchmakingStateChanges"
description: "Returns an array of matchmaking state changes that were being processed."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/16/2022
---

# PFMultiplayerFinishProcessingMatchmakingStateChanges  

Returns an array of matchmaking state changes that were being processed.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerFinishProcessingMatchmakingStateChanges(  
    PFMultiplayerHandle handle,  
    uint32_t stateChangeCount,  
    const PFMatchmakingStateChange* const* stateChanges  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`stateChangeCount`** &nbsp; uint32_t  
  
The number of changes, provided in the list specified by `stateChanges`, previously returned by [PFMultiplayerStartProcessingMatchmakingStateChanges()](pfmultiplayerstartprocessingmatchmakingstatechanges.md) that have now been handled by the title.  
  
**`stateChanges`** &nbsp; PFMatchmakingStateChange* const*  
*input array of size `stateChangeCount`*  
  
The array of changes previously returned by [PFMultiplayerStartProcessingMatchmakingStateChanges()](pfmultiplayerstartprocessingmatchmakingstatechanges.md) that have now been handled by the title.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method informs the Matchmaking library that the state changes reported by a previous call to [PFMultiplayerStartProcessingMatchmakingStateChanges()](pfmultiplayerstartprocessingmatchmakingstatechanges.md) have now been handled by the title, so their associated resources can be reclaimed. You may call PFMultiplayerFinishProcessingMatchmakingStateChanges() with any number of state changes. Each state change returned by PFMultiplayerStartProcessingMatchmakingStateChanges() must be returned to PFMultiplayerFinishProcessingMatchmakingStateChanges() exactly once, but may be returned out of order and may be interleaved with state changes from other calls to PFMultiplayerStartProcessingMatchmakingStateChanges(). <br /><br /> Any resources associated with a specific state change are guaranteed to stay valid until the state change is returned to PFMultiplayerFinishProcessingMatchmakingStateChanges().   <br /><br /> For best results, you should minimize the time you spend handling state changes before calling PFMultiplayerFinishProcessingMatchmakingStateChanges().
  
## Requirements  
  
**Header:** PFMatchmaking.h
  
## See also  
[PFMatchmaking members](../pfmatchmaking_members.md)  
[PFMatchmakingStateChange](../structs/pfmatchmakingstatechange.md)  
[PFMultiplayerStartProcessingMatchmakingStateChanges](pfmultiplayerstartprocessingmatchmakingstatechanges.md)
  
  
