---
author: jdeweyMSFT
title: "PartyFreeMemoryCallback"
description: "A callback invoked every time a previously allocated memory buffer is no longer needed by the Party library and can be freed."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2021
---

# PartyFreeMemoryCallback  

A callback invoked every time a previously allocated memory buffer is no longer needed by the Party library and can be freed.  

## Syntax  
  
```cpp
typedef
void (*PartyFreeMemoryCallback)(  
    void* pointer,  
    uint32_t memoryTypeId  
)  
```  
  
### Parameters  
  
**`pointer`** &nbsp; void*  
*_Post_invalid_*  
  
A pointer to a memory buffer previously allocated. This value will never be nullptr.  
  
**`memoryTypeId`** &nbsp; uint32_t  
  
An opaque identifier representing the Party library internal category of memory being freed. This value should be ignored.  
  
  
### Return value
Type: void
  
The callback does not return a value.  
  
## Remarks  
  
This callback is optionally installed using the [PartyManager::SetMemoryCallbacks()](../classes/PartyManager/methods/partymanager_setmemorycallbacks.md) method. <br /><br /> The callback is invoked whenever the Party library has finished using a memory buffer previously returned by the title's corresponding [PartyAllocateMemoryCallback](partyallocatememorycallback.md), so that the title can free the memory buffer.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyAllocateMemoryCallback](partyallocatememorycallback.md)  
[PartyManager::SetMemoryCallbacks](../classes/PartyManager/methods/partymanager_setmemorycallbacks.md)  
[PartyManager::GetMemoryCallbacks](../classes/PartyManager/methods/partymanager_getmemorycallbacks.md)
  
  
