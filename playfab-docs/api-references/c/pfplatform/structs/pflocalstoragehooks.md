---
author: jasonsandlin
title: "PFLocalStorageHooks"
description: "Struct encapsulating the storage hooks."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFLocalStorageHooks  

Struct encapsulating the storage hooks.  

## Syntax  
  
```cpp
typedef struct PFLocalStorageHooks {  
    XTaskQueueHandle queueHandle;  
    PFPlatformLocalStorageReadAsyncHandler* read;  
    PFPlatformLocalStorageWriteAsyncHandler* write;  
    PFPlatformLocalStorageClearAsyncHandler* clear;  
    void* context;  
} PFLocalStorageHooks;  
```
  
### Members  
  
**`queueHandle`** &nbsp; XTaskQueueHandle  
*may be nullptr*  
  
(Optional) Queue that the hooks should be invoked on. If not specified, the callbacks will be invoked on the background queue provided to PFInitialize.
  
**`read`** &nbsp; PFPlatformLocalStorageReadAsyncHandler*  
  
Custom read hook.
  
**`write`** &nbsp; PFPlatformLocalStorageWriteAsyncHandler*  
  
Custom write hook.
  
**`clear`** &nbsp; PFPlatformLocalStorageClearAsyncHandler*  
  
Custom clear hook.
  
**`context`** &nbsp; void*  
*may be nullptr*  
  
(Optional) Client context that will be passed to storage hooks.
  
## Remarks  
  
All 3 handlers must be set at the same time.
  
## Requirements  
  
**Header:** PFPlatform.h
  
## See also  
[PFPlatform members](../pfplatform_members.md)  

  
  
