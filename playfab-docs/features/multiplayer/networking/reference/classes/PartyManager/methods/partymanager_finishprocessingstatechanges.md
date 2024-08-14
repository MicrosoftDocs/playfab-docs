---
author: jdeweyMSFT
title: "PartyManager::FinishProcessingStateChanges"
description: Returns an array of PartyStateChanges that were being processed.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::FinishProcessingStateChanges  

Returns an array of PartyStateChanges that were being processed.  

## Syntax  
  
```cpp
PartyError FinishProcessingStateChanges(  
    uint32_t stateChangeCount,  
    PartyStateChangeArray stateChanges  
)  
```  
  
### Parameters  
  
**`stateChangeCount`** &nbsp; uint32_t  
  
The number of changes, provided in the list specified by `stateChanges`, previously returned by [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md) that have now been handled by the title.  
  
**`stateChanges`** &nbsp; [PartyStateChangeArray](../../../typedefs.md)  
*input array of size `stateChangeCount`*  
  
The array of changes previously returned by [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md) that have now been handled by the title.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method informs the Party library that the state changes reported by a previous call to [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md) have now been handled by the title, so their associated resources can be reclaimed. You may call FinishProcessingStateChanges() with any number of state changes. Each state change returned by StartProcessingStateChanges() must be returned to FinishProcessingStateChanges() exactly once, but may be returned out of order and may be interleaved with state changes from other calls to StartProcessingStateChanges(). Even if state changes are held across subsequent calls to StartProcessingStateChanges(), the Party library state returned by all getters will advance and may no longer reflect the same state that the held state changes refer to. <br /><br /> Any resources associated with a specific state change are guaranteed to stay valid until the state change is returned to FinishProcessingStateChanges().   <br /><br /> For best results, you should minimize the time you spend handling state changes before calling FinishProcessingStateChanges().
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyStateChange](../../../structs/partystatechange.md)  
[PartyManager::StartProcessingStateChanges](partymanager_startprocessingstatechanges.md)
  
  
