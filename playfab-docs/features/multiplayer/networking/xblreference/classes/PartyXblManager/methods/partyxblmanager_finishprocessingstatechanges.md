---
author: alexatxbox
title: "PartyXblManager::FinishProcessingStateChanges"
description: Returns an array of Party Xbox Live state changes that were being processed.
ms.author: alstonge
ms.topic: reference
ms.prod: playfab
ms.date: 11/01/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyXblManager::FinishProcessingStateChanges  

Returns an array of Party Xbox Live state changes that were being processed.  

## Syntax  
  
```cpp
PartyError FinishProcessingStateChanges(  
    uint32_t stateChangeCount,  
    PartyXblStateChangeArray stateChanges  
)  
```  
  
### Parameters  
  
**`stateChangeCount`** &nbsp; uint32_t  
  
The number of changes, provided in the list specified by `stateChanges`, previously returned by StartProcessingStateChanges() that have now been handled by the title.  
  
**`stateChanges`** &nbsp; [PartyXblStateChangeArray](../../../../../networking/xblreference/xbltypedefs.md)  
*input array of size `stateChangeCount`*  
  
The pointer to the array of changes previously returned by StartProcessingStateChanges() that have now been handled by the title.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This method informs the Party Xbox Live Helper library that the state changes reported by a previous call to [StartProcessingStateChanges()](partyxblmanager_startprocessingstatechanges.md) have now been handled by the title, so their associated resources can be reclaimed. You may call FinishProcessingStateChanges() with any number of state changes. Each state change returned by StartProcessingStateChanges() must be included in a call to FinishProcessingStateChanges() exactly once but they may be returned out of order and may be interleaved with state changes from subsequent calls to StartProcessingStateChanges() <br /><br /> For best results, you should minimize the time you spend handling state changes before calling FinishProcessingStateChanges().
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblStateChange](../../../structs/partyxblstatechange.md)  
[PartyXblManager::StartProcessingStateChanges](partyxblmanager_startprocessingstatechanges.md)
  
  
