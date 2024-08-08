---
author: jdeweyMSFT
title: "PartyManager::SetMemoryCallbacks"
description: Optionally configures the memory allocation and freeing callbacks the Party library should use.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
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
  
A pointer to the custom allocation callback to use.  
  
**`freeMemoryCallback`** &nbsp; [PartyFreeMemoryCallback](../../../callbacks/partyfreememorycallback.md)  
  
A pointer to the custom freeing callback to use.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method allows the title to install custom memory allocation functions in order to service all requests by the Party library for new memory buffers instead of using its default allocation functions. <br /><br /> The `allocateMemoryCallback` and `freeMemoryCallback` parameters must both be non-null.   <br /><br /> To use this method, it must be called before any other Party method except for PartyManager::GetMemoryCallbacks(). This method cannot be called again for the lifetime of this process.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyAllocateMemoryCallback](../../../callbacks/partyallocatememorycallback.md)  
[PartyFreeMemoryCallback](../../../callbacks/partyfreememorycallback.md)  
[PartyManager::GetMemoryCallbacks](partymanager_getmemorycallbacks.md)
  
  
