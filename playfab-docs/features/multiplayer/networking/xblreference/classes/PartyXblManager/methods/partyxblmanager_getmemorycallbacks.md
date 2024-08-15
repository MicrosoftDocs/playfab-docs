---
author: ScottMunroMS
title: "PartyXblManager::GetMemoryCallbacks"
description: Retrieves the current memory allocation and freeing callbacks the Party Xbox Live library is using.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyXblManager::GetMemoryCallbacks  

Retrieves the current memory allocation and freeing callbacks the Party Xbox Live library is using.  

## Syntax  
  
```cpp
PartyError GetMemoryCallbacks(  
    PartyAllocateMemoryCallback* allocateMemoryCallback,  
    PartyFreeMemoryCallback* freeMemoryCallback  
)  
```  
  
### Parameters  
  
**`allocateMemoryCallback`** &nbsp; [PartyAllocateMemoryCallback*](../../../../../networking/reference/callbacks/partyallocatememorycallback.md)  
*output*  
  
A place to store a pointer to the memory allocation callback currently used.  
  
**`freeMemoryCallback`** &nbsp; [PartyFreeMemoryCallback*](../../../../../networking/reference/callbacks/partyfreememorycallback.md)  
*output*  
  
A place to store a pointer to the memory freeing callback currently used.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This method does not require the [Initialize()](partyxblmanager_initialize.md) method to have been called first.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::SetMemoryCallbacks](partyxblmanager_setmemorycallbacks.md)
  
  
