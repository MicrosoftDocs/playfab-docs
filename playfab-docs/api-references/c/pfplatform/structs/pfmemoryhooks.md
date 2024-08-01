---
author: jasonsandlin
title: "PFMemoryHooks"
description: "Struct encapsulating memory hooks."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMemoryHooks  

Struct encapsulating memory hooks.  

## Syntax  
  
```cpp
typedef struct PFMemoryHooks {  
    PFMemAllocFunction* alloc;  
    PFMemFreeFunction* free;  
} PFMemoryHooks;  
```
  
### Members  
  
**`alloc`** &nbsp; PFMemAllocFunction*  
  
Custom allocation hook.
  
**`free`** &nbsp; PFMemFreeFunction*  
  
Custom free hook.
  
## Remarks  
  
Both hooks must be set at the same time.
  
## Requirements  
  
**Header:** PFPlatform.h
  
## See also  
[PFPlatform members](../pfplatform_members.md)  

  
  
