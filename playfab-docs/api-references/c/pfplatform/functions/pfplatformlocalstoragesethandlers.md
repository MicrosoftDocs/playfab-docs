---
author: jasonsandlin
title: "PFPlatformLocalStorageSetHandlers"
description: "Sets the storage event handlers. If custom storage handlers are not set, a default implementation based on cstdio and std::fstream objects will be used."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlatformLocalStorageSetHandlers  

Sets the storage event handlers. If custom storage handlers are not set, a default implementation based on cstdio and std::fstream objects will be used.  

## Syntax  
  
```cpp
HRESULT PFPlatformLocalStorageSetHandlers(  
    PFLocalStorageHooks* hooks  
)  
```  
  
### Parameters  
  
**`hooks`** &nbsp; [PFLocalStorageHooks*](../structs/pflocalstoragehooks.md)  
  
Custom local storage hooks to be used by the SDK.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Must be called before PFInitialize.
  
## Requirements  
  
**Header:** PFPlatform.h
  
## See also  
[PFPlatform members](../pfplatform_members.md)  

  
  
