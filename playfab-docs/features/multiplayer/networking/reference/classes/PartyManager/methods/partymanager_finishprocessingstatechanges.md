---
author: jdeweyMSFT
title: "PartyManager::FinishProcessingStateChanges"
description: Returns an array of PartyStateChanges that were being processed.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
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
  
This method informs the Party library that the state changes reported by a previous call to [StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md) have now been handled by the title, so their associated resources can be reclaimed. You may call FinishProcessingStateChanges() with any number of state changes. Each state change returned by StartProcessingStateChanges() must be included in a call to FinishProcessingStateChanges() exactly once but they may be returned out of order and may be interleaved with state changes from subsequent calls to StartProcessingStateChanges(). Even if state changes are held across subsequent calls to StartProcessingStateChanges, the Party library state returned by all getters will advance and may no longer reflect the same state that the held state changes refer to. <br /><br /> For best results, you should minimize the time you spend handling state changes before calling FinishProcessingStateChanges().
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyStateChange](../../../structs/partystatechange.md)  
[PartyManager::StartProcessingStateChanges](partymanager_startprocessingstatechanges.md)
  
  
