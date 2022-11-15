---
author: jdeweyMSFT
title: "PartyAllocateMemoryCallback"
description: "A callback invoked every time a new memory buffer must be dynamically allocated by the Party library."
ms.author: jdewey
ms.topic: reference
ms.service: playfab
ms.date: 09/25/2019
---

# PartyAllocateMemoryCallback  

A callback invoked every time a new memory buffer must be dynamically allocated by the Party library.  

## Syntax  
  
```cpp
typedef
void* (*PartyAllocateMemoryCallback)(  
    size_t size,  
    uint32_t memoryTypeId  
)  
```  
  
### Parameters  
  
**`size`** &nbsp; size_t  
  
The size of the allocation to be made. This value will never be zero.  
  
**`memoryTypeId`** &nbsp; uint32_t  
  
An opaque identifier representing the Party library internal category of memory being allocated. This value should be ignored.  
  
  
### Return value
Type: void*
  
A pointer to an allocated block of memory of the specified size, or nullptr if the allocation failed.
  
## Remarks  
  
This callback is optionally installed using the [PartyManager::SetMemoryCallbacks()](../classes/PartyManager/methods/partymanager_setmemorycallbacks.md) method. <br /><br /> The callback must allocate and return a pointer to a contiguous block of memory of the specified size that will remain valid until the title's corresponding [PartyFreeMemoryCallback](partyfreememorycallback.md) is invoked to release it. If this is not possible, the callback must return nullptr to fail the allocation. Memory allocation failures are sometimes considered benign but will usually cause current Party library operation(s) to fail.   <br /><br /> Every non-nullptr returned by this method will be subsequently passed to the corresponding [PartyFreeMemoryCallback](partyfreememorycallback.md) once the memory is no longer needed.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyFreeMemoryCallback](partyfreememorycallback.md)  
[PartyManager::SetMemoryCallbacks](../classes/PartyManager/methods/partymanager_setmemorycallbacks.md)  
[PartyManager::GetMemoryCallbacks](../classes/PartyManager/methods/partymanager_getmemorycallbacks.md)
  
  
