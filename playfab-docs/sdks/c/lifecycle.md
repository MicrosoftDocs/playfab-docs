---
title: SDK Lifecycle
author: amccalib
description: Initialization, configuration, and shutdown of the PlayFab Services SDK
ms.author: andmcc
ms.date: 02/14/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, initialization, shutdown, lifecycle
ms.localizationpriority: medium
---

# SDK Lifecycle

This page covers the complete startup and shutdown sequence for the PlayFab Services SDK. Every title follows the same high-level pattern: configure optional hooks, initialize Core, create a service configuration, initialize Services, do work, then shut down in reverse order.

## Initialization sequence

Initialization has four steps. The first is optional; the remaining three are required.

```
PFMemSetFunctions (optional)  →  PFInitialize  →  PFServiceConfigCreateHandle  →  PFServicesInitialize
```

### Step 1: Set custom memory hooks (optional)

If your title uses a custom memory allocator, call [**PFMemSetFunctions**](../../api-references/c/pfplatform/functions/pfmemsetfunctions.md) before any other PlayFab API. This routes all SDK memory allocations through your own `alloc` and `free` callbacks.

```cpp
PFMemoryHooks hooks{};
hooks.alloc = MyAllocFunction;
hooks.free = MyFreeFunction;
HRESULT hr = PFMemSetFunctions(&hooks);
```

> [!IMPORTANT]
> [__PFMemSetFunctions__](../../api-references/c/pfplatform/functions/pfmemsetfunctions.md) must be called before [**PFInitialize**](../../api-references/c/pfcore/functions/pfinitialize.md). It can't be called again after hooks have been set.

If you don't need custom memory management, skip this step. The SDK uses default allocation routines.

### Step 2: Initialize PlayFab Core

[__PFInitialize__](../../api-references/c/pfcore/functions/pfinitialize.md) sets up the SDK's global state, including the HTTP layer and background task queue. The exact signature varies by platform.

#### Windows, Linux, iOS, and macOS

```cpp
HRESULT hr = PFInitialize(nullptr); // Uses a default threadpool queue
```

Pass an __XTaskQueueHandle__ if you want to control which queue handles background work. Pass `nullptr` to use the default threadpool queue.

#### Android

On Android, you must also provide the Java VM and application context so the SDK can initialize libHttpClient:

```cpp
HRESULT hr = PFInitialize(nullptr, javaVm, applicationContext);
```

> [!NOTE]
> If you don't call __PFInitialize__ explicitly, [**PFServicesInitialize**](../../api-references/c/pfservices/functions/pfservicesinitialize.md) calls it internally with default parameters. This is fine for most titles. However, if you're using custom memory hooks via __PFMemSetFunctions__, you **must** call __PFInitialize__ yourself — otherwise [__PFServicesInitialize__](../../api-references/c/pfservices/functions/pfservicesinitialize.md) initializes Core before your memory hooks take effect, and the SDK uses default allocation routines instead.

### Step 3: Create a service configuration

[**PFServiceConfigCreateHandle**](../../api-references/c/pfserviceconfig/functions/pfserviceconfigcreatehandle.md) creates a handle that tells the SDK which PlayFab title and endpoint to target. You'll find both values in [Game Manager](https://developer.playfab.com).

```cpp
PFServiceConfigHandle serviceConfigHandle{ nullptr };
HRESULT hr = PFServiceConfigCreateHandle(
    "https://ABCDEF.playfabapi.com",    // API endpoint from Game Manager
    "ABCDEF",                           // Title ID from Game Manager
    &serviceConfigHandle);
```

The returned __PFServiceConfigHandle__ is required for all subsequent login calls.

### Step 4: Initialize PlayFab Services

__PFServicesInitialize__ sets up the Services layer (Inventory, Leaderboards, Friends, and so on) on top of Core.

#### Windows, Linux, iOS, and macOS

```cpp
HRESULT hr = PFServicesInitialize(nullptr);
```

The parameter is reserved for future use; pass `nullptr`.

#### Android

On Android, pass an __HCInitArgs__ struct containing the Java VM and application context:

```cpp
HRESULT hr = PFServicesInitialize(nullptr, initArgs);
```

After this call succeeds, the SDK is ready. You can log in players and make service calls.

## PFServiceConfigHandle lifecycle

A __PFServiceConfigHandle__ is a ref-counted handle. The SDK manages its internal lifetime through reference counting, but you're responsible for closing every handle you own.

| Function | Description |
|---|---|
| [**PFServiceConfigCreateHandle**](../../api-references/c/pfserviceconfig/functions/pfserviceconfigcreatehandle.md) | Creates a new handle. The initial ref count is 1. |
| [**PFServiceConfigDuplicateHandle**](../../api-references/c/pfserviceconfig/functions/pfserviceconfigduplicatehandle.md) | Increments the ref count and returns a second handle. Both handles must be closed independently. |
| [**PFServiceConfigCloseHandle**](../../api-references/c/pfserviceconfig/functions/pfserviceconfigclosehandle.md) | Decrements the ref count. When it reaches 0, the config is destroyed. |
| [**PFServiceConfigGetAPIEndpoint**](../../api-references/c/pfserviceconfig/functions/pfserviceconfiggetapiendpoint.md) | Retrieves the API endpoint string. Call [**PFServiceConfigGetAPIEndpointSize**](../../api-references/c/pfserviceconfig/functions/pfserviceconfiggetapiendpointsize.md) first to determine the buffer size. |
| [**PFServiceConfigGetTitleId**](../../api-references/c/pfserviceconfig/functions/pfserviceconfiggettitleid.md) | Retrieves the title ID string. Call [**PFServiceConfigGetTitleIdSize**](../../api-references/c/pfserviceconfig/functions/pfserviceconfiggettitleidsize.md) first to determine the buffer size. |

### Duplicating a handle

Use [__PFServiceConfigDuplicateHandle__](../../api-references/c/pfserviceconfig/functions/pfserviceconfigduplicatehandle.md) when you need to share a service config across components that manage their own lifetimes:

```cpp
PFServiceConfigHandle duplicatedHandle{ nullptr };
HRESULT hr = PFServiceConfigDuplicateHandle(serviceConfigHandle, &duplicatedHandle);

// Both handles are now valid and must be closed separately
PFServiceConfigCloseHandle(duplicatedHandle);
PFServiceConfigCloseHandle(serviceConfigHandle);
```

## Shutdown sequence

Shutdown is the reverse of initialization. You must uninitialize Services before Core, and both calls are asynchronous.

```
Close handles  →  PFServicesUninitializeAsync  →  PFUninitializeAsync
```

### Step 1: Close all open handles

Before tearing down the SDK, close every __PFEntityHandle__ and __PFServiceConfigHandle__ you own:

```cpp
PFEntityCloseHandle(entityHandle);
entityHandle = nullptr;

PFServiceConfigCloseHandle(serviceConfigHandle);
serviceConfigHandle = nullptr;
```

### Step 2: Uninitialize Services

[**PFServicesUninitializeAsync**](../../api-references/c/pfservices/functions/pfservicesuninitializeasync.md) tears down the Services layer. Wait for it to complete before proceeding.

```cpp
XAsyncBlock asyncServices{};
HRESULT hr = PFServicesUninitializeAsync(&asyncServices);
hr = XAsyncGetStatus(&asyncServices, true); // Blocking wait
```

### Step 3: Uninitialize Core

After Services cleanup finishes, call [**PFUninitializeAsync**](../../api-references/c/pfcore/functions/pfuninitializeasync.md) to tear down Core:

```cpp
XAsyncBlock asyncCore{};
HRESULT hr = PFUninitializeAsync(&asyncCore);
hr = XAsyncGetStatus(&asyncCore, true); // Blocking wait
```

> [!NOTE]
> If you didn't call __PFInitialize__ explicitly, you can skip __PFUninitializeAsync__. In that case, [__PFServicesUninitializeAsync__](../../api-references/c/pfservices/functions/pfservicesuninitializeasync.md) handles Core cleanup automatically. However, if you did call __PFInitialize__ yourself, you must call [__PFUninitializeAsync__](../../api-references/c/pfcore/functions/pfuninitializeasync.md) yourself.

## Complete example

This example shows the full lifecycle from initialization through shutdown on a Windows title:

```cpp
#include <playfab/services/PFServices.h>

void RunPlayFab()
{
    //
    // Optional: set custom memory hooks
    //
    PFMemoryHooks hooks{};
    hooks.alloc = MyAllocFunction;
    hooks.free = MyFreeFunction;
    HRESULT hr = PFMemSetFunctions(&hooks);

    //
    // Initialize Core
    //
    hr = PFInitialize(nullptr);

    //
    // Create a service configuration
    //
    PFServiceConfigHandle serviceConfigHandle{ nullptr };
    hr = PFServiceConfigCreateHandle(
        "https://ABCDEF.playfabapi.com",
        "ABCDEF",
        &serviceConfigHandle);

    //
    // Initialize Services
    //
    hr = PFServicesInitialize(nullptr);

    //
    // Log in a player (Windows example using XUser)
    //
    PFAuthenticationLoginWithXUserRequest request{};
    request.createAccount = true;
    request.user = userHandle;

    XAsyncBlock asyncLogin{};
    hr = PFAuthenticationLoginWithXUserAsync(serviceConfigHandle, &request, &asyncLogin);
    hr = XAsyncGetStatus(&asyncLogin, true);

    size_t bufferSize{};
    hr = PFAuthenticationLoginWithXUserGetResultSize(&asyncLogin, &bufferSize);

    std::vector<char> loginResultBuffer(bufferSize);
    PFAuthenticationLoginResult const* loginResult{};
    PFEntityHandle entityHandle{ nullptr };
    hr = PFAuthenticationLoginWithXUserGetResult(
        &asyncLogin, &entityHandle,
        loginResultBuffer.size(), loginResultBuffer.data(),
        &loginResult, nullptr);

    //
    // ... make service calls ...
    //

    //
    // Shutdown: close handles first
    //
    PFEntityCloseHandle(entityHandle);
    entityHandle = nullptr;

    PFServiceConfigCloseHandle(serviceConfigHandle);
    serviceConfigHandle = nullptr;

    //
    // Shutdown: uninitialize Services, then Core
    //
    XAsyncBlock asyncServices{};
    hr = PFServicesUninitializeAsync(&asyncServices);
    hr = XAsyncGetStatus(&asyncServices, true);

    XAsyncBlock asyncCore{};
    hr = PFUninitializeAsync(&asyncCore);
    hr = XAsyncGetStatus(&asyncCore, true);
}
```

## Common mistakes

| Mistake | What happens | Fix |
|---|---|---|
| Calling [**PFMemSetFunctions**](../../api-references/c/pfplatform/functions/pfmemsetfunctions.md) after [**PFInitialize**](../../api-references/c/pfcore/functions/pfinitialize.md) | The call fails. Memory hooks can only be set before initialization. | Move [**PFMemSetFunctions**](../../api-references/c/pfplatform/functions/pfmemsetfunctions.md) to the very first PlayFab call in your program. |
| Calling [**PFUninitializeAsync**](../../api-references/c/pfcore/functions/pfuninitializeasync.md) before [**PFServicesUninitializeAsync**](../../api-references/c/pfservices/functions/pfservicesuninitializeasync.md) | Undefined behavior. Core is torn down while Services still depends on it. | Always uninitialize Services first, wait for completion, then uninitialize Core. |
| Forgetting to call [**PFUninitializeAsync**](../../api-references/c/pfcore/functions/pfuninitializeasync.md) after explicit [**PFInitialize**](../../api-references/c/pfcore/functions/pfinitialize.md) | Core resources leak. The background queue and HTTP layer aren't cleaned up. | If you called [**PFInitialize**](../../api-references/c/pfcore/functions/pfinitialize.md), you must call [**PFUninitializeAsync**](../../api-references/c/pfcore/functions/pfuninitializeasync.md). |
| Not waiting for async uninitialize to complete | The process may exit while cleanup is still in progress, causing crashes or hangs. | Use `XAsyncGetStatus(async, true)` or an __XAsyncBlock__ callback to wait for completion. |
| Leaking __PFServiceConfigHandle__ or __PFEntityHandle__ | Ref-counted resources aren't freed and may prevent clean shutdown. | Close every handle you create or duplicate before calling uninitialize. |

## See also

- [Quickstart: Win32](quickstart-win32.md)
- [Quickstart: Windows](quickstart-gdk.md)
- [Debug Tracing](tracing.md)
- [Asynchronous Programming Model](/gaming/gdk/_content/gc/system/overviews/async-programming-model)
