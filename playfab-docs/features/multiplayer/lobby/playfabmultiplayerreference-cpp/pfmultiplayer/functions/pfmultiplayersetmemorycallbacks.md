---
author: ScottMunroMS
title: "PFMultiplayerSetMemoryCallbacks"
description: "Optionally configures the memory allocation and freeing callbacks the Multiplayer library should use."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PFMultiplayerSetMemoryCallbacks  

Optionally configures the memory allocation and freeing callbacks the Multiplayer library should use.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerSetMemoryCallbacks(  
    PFMultiplayerAllocateMemoryCallback allocateMemoryCallback,  
    PFMultiplayerFreeMemoryCallback freeMemoryCallback  
)  
```  
  
### Parameters  
  
**`allocateMemoryCallback`** &nbsp; [PFMultiplayerAllocateMemoryCallback](../callbacks/pfmultiplayerallocatememorycallback.md)  
  
A pointer to the custom allocation callback to use.  
  
**`freeMemoryCallback`** &nbsp; PFMultiplayerFreeMemoryCallback  
  
A pointer to the custom freeing callback to use.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method allows the title to install custom memory allocation functions in order to service all requests by the Multiplayer library for new memory buffers instead of using its default allocation functions. <br /><br /> The `allocateMemoryCallback` and `freeMemoryCallback` parameters must both be non-null.   <br /><br /> To use this method, it must be called before any other Multiplayer method. This method cannot be called again for the lifetime of this process.
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerAllocateMemoryCallback](../callbacks/pfmultiplayerallocatememorycallback.md)  
[PFMultiplayerFreeMemoryCallback](../callbacks/pfmultiplayerfreememorycallback.md)
  
  
