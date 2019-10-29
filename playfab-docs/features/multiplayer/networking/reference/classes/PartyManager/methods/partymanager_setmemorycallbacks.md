---
author: jdeweyMSFT
title: "PartyManager::SetMemoryCallbacks"
description: Optionally configures the memory allocation and freeing callbacks the Party library should use.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyManager::SetMemoryCallbacks  

Optionally configures the memory allocation and freeing callbacks the Party library should use.  

## Syntax  
  
```cpp
PartyError SetMemoryCallbacks(  
    PartyAllocateMemoryCallback allocateMemoryCallback,  
    PartyFreeMemoryCallback freeMemoryCallback  
)  
```  
  
### Parameters  
  
**`allocateMemoryCallback`** &nbsp; [PartyAllocateMemoryCallback](../../../callbacks/partyallocatememorycallback.md)  
*optional*  
  
A pointer to the custom allocation callback to use, or nullptr to restore the default.  
  
**`freeMemoryCallback`** &nbsp; [PartyFreeMemoryCallback](../../../callbacks/partyfreememorycallback.md)  
*optional*  
  
A pointer to the custom freeing callback to use, or nullptr to restore the default.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method allows the title to install custom memory allocation routines in order to service all requests by the Party library for new memory buffers instead of using its default allocation routines. <br /><br /> The `allocateMemoryCallback` and `freeMemoryCallback` parameters can be null pointers to restore the default routines. Both callback pointers must be null or both must be non-null. Mixing custom and default routines is not permitted.   <br /><br /> This method must be called prior to the [Initialize()](partymanager_initialize.md) method. The callbacks cannot change while any allocations are outstanding. It also must be only called by one thread at a time as it isn't multithreading safe.   <br /><br /> The configured callbacks are persisted until changed, including across calls to [Cleanup()](partymanager_cleanup.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyAllocateMemoryCallback](../../../callbacks/partyallocatememorycallback.md)  
[PartyFreeMemoryCallback](../../../callbacks/partyfreememorycallback.md)  
[PartyManager::GetMemoryCallbacks](partymanager_getmemorycallbacks.md)
  
  

