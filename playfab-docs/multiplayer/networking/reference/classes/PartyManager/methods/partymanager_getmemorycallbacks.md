---
author: jdeweyMSFT
title: "PartyManager::GetMemoryCallbacks"
description: Retrieves the memory allocation and freeing callbacks the Party library is using.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyManager::GetMemoryCallbacks  

Retrieves the memory allocation and freeing callbacks the Party library is using.  

## Syntax  
  
```cpp
PartyError GetMemoryCallbacks(  
    PartyAllocateMemoryCallback* allocateMemoryCallback,  
    PartyFreeMemoryCallback* freeMemoryCallback  
)  
```  
  
### Parameters  
  
**`allocateMemoryCallback`** &nbsp; [PartyAllocateMemoryCallback*](../../../callbacks/partyallocatememorycallback.md)  
*output*  
  
A place to store a pointer to the memory allocation callback currently used.  
  
**`freeMemoryCallback`** &nbsp; [PartyFreeMemoryCallback*](../../../callbacks/partyfreememorycallback.md)  
*output*  
  
A place to store a pointer to the memory freeing callback currently used.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This retrieves the memory allocation functions servicing requests by the Party library for new memory. <br /><br /> This method does not require the [Initialize()](partymanager_initialize.md) method to have been called first.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyAllocateMemoryCallback](../../../callbacks/partyallocatememorycallback.md)  
[PartyFreeMemoryCallback](../../../callbacks/partyfreememorycallback.md)  
[PartyManager::SetMemoryCallbacks](partymanager_setmemorycallbacks.md)
  
  
