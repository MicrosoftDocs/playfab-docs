---
title: Memory hooking
author: amccalib
description: Managing memory allocations in the PlayFab Services SDK
ms.author: andmcc
ms.date: 03/03/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, memory
ms.localizationpriority: medium
---

# Managing Memory Allocations

With the C API in the PlayFab Services SDK, you can specify a function callback that the SDK calls whenever it tries to allocate memory. If you don't specify function callbacks, the SDK uses standard memory allocation routines.

To manually specify your memory routines, you can take the following steps:

* At the start of the game:
    * Call [**PFMemSetFunctions**](../../api-references/c/pfplatform/functions/pfmemsetfunctions.md) to specify the allocation callbacks for assigning and releasing memory.
    * Call [**PFInitialize**](../../api-references/c/pfcore/functions/pfinitialize.md) to initialize the PlayFab Core library.
    * Call [**PFServicesInitialize**](../../api-references/c/pfservices/functions/pfservicesinitialize.md) to initialize the PlayFab Services library.

> [!IMPORTANT]
> The order matters. **PFMemSetFunctions** must come before **PFInitialize**, and **PFInitialize** must come before **PFServicesInitialize**. If you skip the explicit **PFInitialize** call, **PFServicesInitialize** initializes Core internally—but at that point your memory hooks aren't applied yet, so the SDK uses default allocation routines instead.

```cpp
    PFMemoryHooks playFabHooks{ MyAllocHook, MyFreeHook };
    PFMemSetFunctions(&playFabHooks);
    HRESULT hr = PFInitialize(nullptr); // Add your own error handling when FAILED(hr) == true
    hr = PFServicesInitialize(nullptr); // Add your own error handling when FAILED(hr) == true
```

* While the game is running:
    * Any calls into the SDK that allocate or free memory call the specified memory handling callbacks.

* When the game exits:
    * Call [**PFServicesUninitializeAsync**](../../api-references/c/pfservices/functions/pfservicesuninitializeasync.md) to reclaim all resources associated with PlayFab Services.
    * Call [**PFUninitializeAsync**](../../api-references/c/pfcore/functions/pfuninitializeasync.md) to reclaim all resources associated with PlayFab Core.
    * Clean up your game's custom memory manager.

## Reference

[API reference documentation](../../api-references/c/pfplatform/pfplatform_members.md)
