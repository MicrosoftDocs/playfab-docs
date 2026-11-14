---
author: ScottMunroMS
title: "PartyXblManager::GetMemoryCallbacks"
description: Retrieves the current memory allocation and freeing callbacks the Party XBOX Live library is using.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblManager::GetMemoryCallbacks  

Retrieves the current memory allocation and freeing callbacks the Party XBOX Live library is using.  

## Syntax  
  
```cpp
static PartyError GetMemoryCallbacks(  
    PartyAllocateMemoryCallback* allocateMemoryCallback,  
    PartyFreeMemoryCallback* freeMemoryCallback  
)  
```  
  
### Parameters  
  
**`allocateMemoryCallback`** &nbsp; [PartyAllocateMemoryCallback*](../../../../reference/callbacks/partyallocatememorycallback.md)  
*output*  
  
A place to store a pointer to the memory allocation callback currently used.  
  
**`freeMemoryCallback`** &nbsp; [PartyFreeMemoryCallback*](../../../../reference/callbacks/partyfreememorycallback.md)  
*output*  
  
A place to store a pointer to the memory freeing callback currently used.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This method does not require the [Initialize()](partyxblmanager_initialize.md) method to have been called first.
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../../party-sdks.md).
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::SetMemoryCallbacks](partyxblmanager_setmemorycallbacks.md)
  
  
