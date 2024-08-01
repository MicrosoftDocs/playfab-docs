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
    * Call **PFMemSetFunctions** to specify the allocation callbacks for assigning and releasing memory.
    * Call **PFServicesInitialize** to initialize the library instance.

```cpp
    PFMemoryHooks playFabHooks{ MyAllocHook, MyFreeHook };
    PFMemSetFunctions(&playFabHooks);
    HRESULT hr = PFServicesInitialize(nullptr); // Add your own error handling when FAILED(hr) == true
```

* While the game is running:
    * Any calls into the SDK that allocate or free memory will call the specified memory handling callbacks.

* When the game exits:
    * Call **PFServicesUninitializeAsync** to reclaim all resources associated with the SDK.
    * Clean up your game's custom memory manager.

## Reference

[API reference documentation](../../api-references/c/pfplatform/pfplatform_members.md)
