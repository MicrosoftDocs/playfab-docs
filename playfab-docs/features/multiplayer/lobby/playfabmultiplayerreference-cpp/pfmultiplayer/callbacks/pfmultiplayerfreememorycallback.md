---
author: ScottMunroMS
title: "PFMultiplayerFreeMemoryCallback"
description: "A callback invoked every time a previously allocated memory buffer is no longer needed by the PlayFab Multiplayer library and can be freed."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PFMultiplayerFreeMemoryCallback  

A callback invoked every time a previously allocated memory buffer is no longer needed by the PlayFab Multiplayer library and can be freed.  

## Syntax  
  
```cpp
typedef
void (*PFMultiplayerFreeMemoryCallback)(  
    void* pointer,  
    uint32_t memoryTypeId  
)  
```  
  
### Parameters  
  
**`pointer`** &nbsp; void*  
*_Post_invalid_*  
  
A pointer to a memory buffer previously allocated. This value will never be nullptr.  
  
**`memoryTypeId`** &nbsp; uint32_t  
  
An opaque identifier representing the PlayFab Multiplayer library internal category of memory being freed. This value should be ignored.  
  
  
### Return value
Type: void
  
The callback does not return a value.  
  
## Remarks  
  
This callback is optionally installed using the [PFMultiplayerSetMemoryCallbacks()](../functions/pfmultiplayersetmemorycallbacks.md) method. <br /><br /> The callback is invoked whenever the PlayFab Multiplayer library has finished using a memory buffer previously returned by the title's corresponding [PFMultiplayerAllocateMemoryCallback](pfmultiplayerallocatememorycallback.md), so that the title can free the memory buffer.
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerAllocateMemoryCallback](pfmultiplayerallocatememorycallback.md)  
[PFMultiplayerSetMemoryCallbacks](../functions/pfmultiplayersetmemorycallbacks.md)  
  
  
  
