---
title: Memory management in the PlayFab Unified SDK
author: amccalib
description: Memory Management in the PlayFab Unified SDK
ms.author: jeffshi
ms.date: 04/20/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playfab unified sdk, sdk
ms.localizationpriority: medium
---

# Memory management in the PlayFab Unified SDK

This guide explains how memory is managed in the PlayFab Unified SDK, including customization options and best practices to avoid memory leaks and ensure safe handling of asynchronous operations.

## Overview

The PlayFab Unified SDK gives developers precise control over memory usage by supporting **custom allocation hooks**, **explicit resource cleanup**, and **safe async operations handling**. This makes it suitable for high-performance or resource-constrained environments such as games and embedded platforms.

## Custom Memory Allocation

The SDK allows you to define custom memory allocation and deallocation functions using `PFMemoryHooks`. This lets you integrate the SDK into your existing memory management systems, such as arenas, pools, or platform-specific allocators.

### Setting Custom Memory Hooks

```cpp
void* MyCustomAlloc(size_t size, uint32_t memoryTypeId);
void MyCustomFree(void* ptr, uint32_t memoryTypeId);

PFMemoryHooks memoryHooks = { MyCustomAlloc, MyCustomFree };
PFMemSetFunctions(&memoryHooks);
PFServicesInitialize(nullptr); // Must be called after setting memory hooks
```

**Notes:**
- Hooks must be set **before** calling `PFServicesInitialize`.
- They **cannot** be changed once the SDK is initialized.
- If not set, the SDK defaults to standard allocation (`malloc`/`free`).

## Asynchronous Operations

Most API calls in the SDK are asynchronous. Each async call requires a valid `XAsyncBlock` which must remain alive for the duration of the request.

### Using `XAsyncBlock` Safely

```cpp
auto asyncBlock = std::make_unique<XAsyncBlock>();
asyncBlock->callback = [](XAsyncBlock* block)
{
    // Retrieve result, then delete asyncBlock if needed
};
StartAsyncPlayFabCall(asyncBlock.get());
asyncBlock.release(); // Ownership passed; handle lifetime carefully
```

**Best Practices:**
- Don't stack-allocate `XAsyncBlock` unless you can guarantee its lifetime.
- Release ownership if dynamically allocated, and clean up in the callback.
- Avoid capturing invalidated references or pointers in the lambda.

## Resource Cleanup

The SDK uses handles (e.g., `PFEntityHandle`, `PFServiceConfigHandle`) that **must** be explicitly closed when no longer needed.

### Closing Handles and Uninitializing

```cpp
PFEntityCloseHandle(entityHandle);
PFServiceConfigCloseHandle(serviceConfigHandle);

// Gracefully uninitialize the SDK
XAsyncBlock async{};
PFServicesUninitializeAsync(&async);
XAsyncGetStatus(&async, true); // Blocks until cleanup completes
```

**Important:**
- Always close PlayFab handles to prevent leaks.
- Wait for `PFServicesUninitializeAsync` to complete before shutting down.

## Best Practices

- **Set memory hooks early**: Before any other PlayFab API calls.
- **Avoid memory leaks**: Close handles and manage async resources carefully.
- **Use memory profilers**: Especially on platforms with tight memory budgets.
- **Use pooled allocators**: For performance-critical or frequent allocations.

## See also
- [Asynchronous operations](async-model.md)
- [Memory management](memory-management.md)
- [Tracing and diagnostics](debug-trace.md)
