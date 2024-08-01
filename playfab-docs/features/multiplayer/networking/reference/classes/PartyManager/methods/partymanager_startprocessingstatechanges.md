---
author: jdeweyMSFT
title: "PartyManager::StartProcessingStateChanges"
description: Retrieves an array of all PartyStateChanges to process since the last such call.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::StartProcessingStateChanges  

Retrieves an array of all PartyStateChanges to process since the last such call.  

## Syntax  
  
```cpp
PartyError StartProcessingStateChanges(  
    uint32_t* stateChangeCount,  
    PartyStateChangeArray* stateChanges  
)  
```  
  
### Parameters  
  
**`stateChangeCount`** &nbsp; uint32_t*  
*output*  
  
The output number of PartyStateChange entries for the title to handle in the `stateChanges` array.  
  
**`stateChanges`** &nbsp; [PartyStateChangeArray*](../../../typedefs.md)  
*library-allocated output array of size `*stateChangeCount`*  
  
A library-allocated output array of all PartyStateChange entries for the title to handle and then pass to [FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md).  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method provides the Party library an opportunity to synchronize state with remote devices or services, and retrieves a list of all changes currently available for the title since the last call to this method. The title should use the provided array of 0 or more changes to update its own state or UI, and then call [FinishProcessingStateChanges()](partymanager_finishprocessingstatechanges.md) with them in a timely manner. <br /><br /> Party library state exposed by the library can change during this call, so you must be thread-safe in your use of it. For example, invoking StartProcessingStateChanges() on your UI thread at the same time a separate worker thread is looping through the list of endpoints returned by [PartyNetwork::GetEndpoints()](../../PartyNetwork/methods/partynetwork_getendpoints.md) may result in crashes because StartProcessingStateChanges() can alter the memory associated with the endpoint list. StartProcessingStateChanges() should be called frequently-- at least once per graphics frame. It's designed to execute and return quickly such that it can be called on your main UI thread with negligible impact. For best results, you should also minimize the time you spend handling state changes before calling FinishProcessingStateChanges().   <br /><br /> Each state change returned by StartProcessingStateChanges() must be returned to FinishProcessingStateChanges() exactly once, but may be returned out of order and may be interleaved with state changes from other calls to StartProcessingStateChanges(). Any resources associated with a specific state change are guaranteed to stay valid until the state change is returned to FinishProcessingStateChanges().
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyStateChange](../../../structs/partystatechange.md)  
[PartyManager::FinishProcessingStateChanges](partymanager_finishprocessingstatechanges.md)
  
  
