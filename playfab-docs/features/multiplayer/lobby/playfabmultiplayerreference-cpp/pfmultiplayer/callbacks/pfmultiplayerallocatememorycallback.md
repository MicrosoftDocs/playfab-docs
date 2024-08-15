---
author: ScottMunroMS
title: "PFMultiplayerAllocateMemoryCallback"
description: "A callback invoked every time a new memory buffer must be dynamically allocated by the PlayFab Multiplayer library."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PFMultiplayerAllocateMemoryCallback  

A callback invoked every time a new memory buffer must be dynamically allocated by the PlayFab Multiplayer library.  

## Syntax  
  
```cpp
typedef
void* (*PFMultiplayerAllocateMemoryCallback)(  
    size_t size,  
    uint32_t memoryTypeId  
)  
```  
  
### Parameters  
  
**`size`** &nbsp; size_t  
  
The size of the allocation to be made. This value will never be zero.  
  
**`memoryTypeId`** &nbsp; uint32_t  
  
An opaque identifier representing the PlayFab Multiplayer library internal category of memory being allocated. This value should be ignored.  
  
  
### Return value
Type: void*
  
A pointer to an allocated block of memory of the specified size, or nullptr if the allocation failed.
  
## Remarks  
  
This callback is optionally installed using the [PFMultiplayerSetMemoryCallbacks()](../functions/pfmultiplayersetmemorycallbacks.md) method. <br /><br /> The callback must allocate and return a pointer to a contiguous block of memory of the specified size that will remain valid until the title's corresponding [PFMultiplayerFreeMemoryCallback](pfmultiplayerfreememorycallback.md) is invoked to release it. If this is not possible, the callback must return nullptr to fail the allocation. Memory allocation failures are sometimes considered benign but will usually cause current PlayFab Multiplayer library operation(s) to fail.   <br /><br /> Every non-nullptr returned by this method will be subsequently passed to the corresponding [PFMultiplayerFreeMemoryCallback](pfmultiplayerfreememorycallback.md) once the memory is no longer needed.
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerFreeMemoryCallback](pfmultiplayerfreememorycallback.md)  
[PFMultiplayerSetMemoryCallbacks](../functions/pfmultiplayersetmemorycallbacks.md)  
  
  
