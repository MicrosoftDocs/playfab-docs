---
author: alexatxbox
title: "PartyXblManager::StartProcessingStateChanges"
description: Retrieves an array of all Party Xbox Live state changes to process since the last such call.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyXblManager::StartProcessingStateChanges  

Retrieves an array of all Party Xbox Live state changes to process since the last such call.  

## Syntax  
  
```cpp
PartyError StartProcessingStateChanges(  
    uint32_t* stateChangeCount,  
    PartyXblStateChangeArray* stateChanges  
)  
```  
  
### Parameters  
  
**`stateChangeCount`** &nbsp; uint32_t*  
*library-allocated output*  
  
A place to write the number of PartyXblStateChange entries for the title to handle in the `stateChanges` array.  
  
**`stateChanges`** &nbsp; [PartyXblStateChangeArray*](../../../../../networking/xblreference/xbltypedefs.md)  
*library-allocated output array of size `*stateChangeCount`*  
  
A place to store a pointer to the array of all PartyXblStateChange entries for the title to handle and then pass to FinishProcessingStateChanges().  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This method provides the Party Xbox Live Helper library an opportunity to retrieves a list of all changes currently available for the title since the last call to this method. The title should use the provided array of 0 or more changes to update its own state or UI, and then call [FinishProcessingStateChanges()](partyxblmanager_finishprocessingstatechanges.md) with them in a timely manner. <br /><br /> State exposed by the library can change during this call, so you must be thread-safe in your use of it. StartProcessingStateChanges() should be called frequently-- at least once every 100 milliseconds. It's designed to execute and return quickly such that it can be called on your main UI thread with negligible impact. For best results, you should also minimize the time you spend handling state changes before calling FinishProcessingStateChanges().
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblStateChange](../../../structs/partyxblstatechange.md)  
[PartyXblManager::FinishProcessingStateChanges](partyxblmanager_finishprocessingstatechanges.md)
  
  
