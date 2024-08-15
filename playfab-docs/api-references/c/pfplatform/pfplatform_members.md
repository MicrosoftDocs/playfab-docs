---
author: jasonsandlin
title: "Services C API overview - PFPlatform.h"
description: "Services C API overview - PFPlatform.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFPlatform.h

  
## Functions  

| Function | Description |  
| --- | --- |  
| [PFMemGetFunctions](functions/pfmemgetfunctions.md) | Gets the memory hook functions to allow callers to control route memory allocations to their own memory manager. This method allows the application get the default memory allocation routines. This can be used along with PFMemSetFunctions() to monitor all memory allocations. |  
| [PFMemSetFunctions](functions/pfmemsetfunctions.md) | Optionally sets the memory hook functions to allow callers to control route memory allocations to their own memory manager. This must be called before PFInitialize() and can not be called again once memory hooks have been set. This method allows the application to install custom memory allocation routines in order to service all requests for new memory buffers instead of using default allocation routines. |  
| [PFPlatformLocalStorageSetHandlers](functions/pfplatformlocalstoragesethandlers.md) | Sets the storage event handlers. If custom storage handlers are not set, a default implementation based on cstdio and std::fstream objects will be used. |  
  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFLocalStorageHooks](structs/pflocalstoragehooks.md) | Struct encapsulating the storage hooks. |  
| [PFMemoryHooks](structs/pfmemoryhooks.md) | Struct encapsulating memory hooks. |  
