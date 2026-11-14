---
author: ScottMunroMS
title: "PartyXblManager::SetMemoryCallbacks"
description: Optionally configures the memory allocation and freeing callbacks the Party XBOX Live Helper library should use.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblManager::SetMemoryCallbacks  

Optionally configures the memory allocation and freeing callbacks the Party XBOX Live Helper library should use.  

## Syntax  
  
```cpp
static PartyError SetMemoryCallbacks(  
    PartyAllocateMemoryCallback allocateMemoryCallback,  
    PartyFreeMemoryCallback freeMemoryCallback  
)  
```  
  
### Parameters  
  
**`allocateMemoryCallback`** &nbsp; [PartyAllocateMemoryCallback](../../../../reference/callbacks/partyallocatememorycallback.md)  
  
A pointer to the custom allocation callback to use.  
  
**`freeMemoryCallback`** &nbsp; [PartyFreeMemoryCallback](../../../../reference/callbacks/partyfreememorycallback.md)  
  
A pointer to the custom freeing callback to use.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise.
  
## Remarks  
  
This method allows the application to install custom memory allocation routines in order to service all requests by the Party Xbox Live Helper library for new memory buffers instead of using its default allocation routines. <br /><br /> The `allocateMemoryCallback` and `freeMemoryCallback` parameters must both be non-null.   <br /><br /> To use this method, it must be called before any other Party Xbox Live Helper library method except for [GetMemoryCallbacks()](partyxblmanager_getmemorycallbacks.md). This method cannot be called again for the lifetime of this process.
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../../party-sdks.md).
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::GetMemoryCallbacks](partyxblmanager_getmemorycallbacks.md)
  
  
