---
title: Quickstart (Windows) - Core SDK Setup
author: Jeffrey-Shi
description: This guide helps you initialize the PlayFab Unified SDK and authenticate players.
ms.author: jeffshi
ms.date: 09/25/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, steam, initialization, authentication
ms.localizationpriority: medium
---

# Quickstart (Windows) - Core SDK Setup

This guide shows you how to integrate the PlayFab Unified SDK into your Windows project, initialize the SDK, and authenticate a player. This is the foundation for making PlayFab API calls.

## Prerequisites

Before you begin, complete the setup steps in [Quickstart Setup](quickstart-setup.md) to configure your development environment and project.

## What you'll accomplish

By the end of this quickstart, you'll have:
- Set up the PlayFab Unified SDK in your Windows project
- Initialized the SDK with your Title ID
- Authenticated a player using Xbox or Steam
- Obtained an entity handle for making API calls
- Properly cleaned up resources

## In this quickstart

1. [Initialize the SDK](#step-1-initialize-the-sdk)
2. [Authenticate a Player](#step-2-authenticate-a-player)
3. [Clean up resources](#step-3-clean-up-resources)

## Step 1: Initialize the SDK

### Include required headers

Start by including the necessary PlayFab and Xbox Game Runtime headers in your project:

```cpp
#include <playfab/core/PFCore.h>
#include <XGameRuntimeInit.h>
```

### Initialize Xbox Gaming Runtime Services

The PlayFab Unified SDK requires Xbox Game Runtime. Initialize it first:

```cpp
HRESULT hr = XGameRuntimeInitialize();
if (FAILED(hr))
{
    std::wcerr << L"Failed to initialize Xbox Game Runtime: 0x" << std::hex << hr << std::endl;
    return hr;
}
std::wcout << L"Xbox Game Runtime initialized successfully." << std::endl;
```

### Initialize PlayFab Core

Initialize the PlayFab SDK and create a service configuration handle. Replace `ABCDEF` with your actual PlayFab Title ID:

```cpp
// Initialize PlayFab
HRESULT hr = PFInitialize(nullptr);
if (FAILED(hr))
{
    std::wcerr << L"Failed to initialize PlayFab: 0x" << std::hex << hr << std::endl;
    return hr;
}

// Create service configuration handle
PFServiceConfigHandle serviceConfigHandle{ nullptr };
hr = PFServiceConfigCreateHandle(
    "https://ABCDEF.playfabapi.com", // Replace ABCDEF with your Title ID
    "ABCDEF",                        // Replace ABCDEF with your Title ID
    &serviceConfigHandle);
if (FAILED(hr))
{
    std::wcerr << L"Failed to create service config handle: 0x" << std::hex << hr << std::endl;
    return hr;
}
std::wcout << L"PlayFab initialized successfully." << std::endl;
```

> [!TIP]
> You can find your Title ID in the [Game Manager dashboard](https://developer.playfab.com) under your game's settings.

## Step 2: Authenticate a Player

PlayFab requires player authentication before making API calls. The SDK provides several authentication methods depending on your platform and requirements.

### Choose your authentication method

#### Option A: Login with Xbox (Recommended for Windows/Xbox)

Use `PFAuthenticationLoginWithXUserAsync` to log in with an Xbox user account. This is the recommended method for Windows and Xbox applications.

```cpp
// Assume you have obtained an XUserHandle (userHandle) through XUser APIs
// For details on obtaining XUserHandle, see the Xbox Game Development Kit documentation

PFAuthenticationLoginWithXUserRequest request{};
request.createAccount = true;  // Create account if it doesn't exist
request.user = userHandle;     // XUserHandle obtained from Xbox user APIs

XAsyncBlock async{};
HRESULT hr = PFAuthenticationLoginWithXUserAsync(serviceConfigHandle, &request, &async);
if (FAILED(hr))
{
    std::wcerr << L"Failed to start Xbox login: 0x" << std::hex << hr << std::endl;
    return hr;
}

// Wait for login to complete
hr = XAsyncGetStatus(&async, true); // Blocking wait
if (FAILED(hr))
{
    std::wcerr << L"Xbox login failed: 0x" << std::hex << hr << std::endl;
    return hr;
}

// Get the result
std::vector<char> loginResultBuffer;
PFAuthenticationLoginResult const* loginResult;
size_t bufferSize;
hr = PFAuthenticationLoginWithXUserGetResultSize(&async, &bufferSize);
if (SUCCEEDED(hr))
{
    loginResultBuffer.resize(bufferSize);
    PFEntityHandle entityHandle{ nullptr };
    hr = PFAuthenticationLoginWithXUserGetResult(&async, &entityHandle, 
        loginResultBuffer.size(), loginResultBuffer.data(), &loginResult, nullptr);
    
    if (SUCCEEDED(hr))
    {
        std::wcout << L"Successfully logged in with Xbox. Player ID: " 
                   << loginResult->playFabId << std::endl;
        // entityHandle is now ready for making API calls
    }
}
```

#### Option B: Login with Steam

For Steam-integrated games, use `PFAuthenticationLoginWithSteamAsync` with a Steam authentication ticket.

```cpp
// Assume you have obtained a Steam ticket through Steam APIs
PFAuthenticationLoginWithSteamRequest request{};
request.createAccount = true;         // Create account if it doesn't exist
request.steamTicket = steamTicket;    // Steam authentication ticket

XAsyncBlock async{};
HRESULT hr = PFAuthenticationLoginWithSteamAsync(serviceConfigHandle, &request, &async);
if (FAILED(hr))
{
    std::wcerr << L"Failed to start Steam login: 0x" << std::hex << hr << std::endl;
    return hr;
}

// Wait for login to complete
hr = XAsyncGetStatus(&async, true);
if (FAILED(hr))
{
    std::wcerr << L"Steam login failed: 0x" << std::hex << hr << std::endl;
    return hr;
}

// Get the result
std::vector<char> loginResultBuffer;
PFAuthenticationLoginResult const* loginResult;
size_t bufferSize;
hr = PFAuthenticationLoginWithSteamGetResultSize(&async, &bufferSize);
if (SUCCEEDED(hr))
{
    loginResultBuffer.resize(bufferSize);
    PFEntityHandle entityHandle{ nullptr };
    hr = PFAuthenticationLoginWithSteamGetResult(&async, &entityHandle, 
        loginResultBuffer.size(), loginResultBuffer.data(), &loginResult, nullptr);
    
    if (SUCCEEDED(hr))
    {
        std::wcout << L"Successfully logged in with Steam. Player ID: " 
                   << loginResult->playFabId << std::endl;
        // entityHandle is now ready for making API calls
    }
}
```

> [!NOTE]
> The `PFEntityHandle` returned from login is required for all subsequent PlayFab API calls. Keep this handle available throughout your application's lifetime.

## Step 3: Clean up resources

When your application shuts down, properly clean up all resources to prevent memory leaks and ensure graceful termination:

```cpp
// Clean up in reverse order of initialization

// 1. Close the entity handle
if (entityHandle)
{
    PFEntityCloseHandle(entityHandle);
    entityHandle = nullptr;
    std::wcout << L"Entity handle closed." << std::endl;
}

// 2. Close the service config handle
if (serviceConfigHandle)
{
    PFServiceConfigCloseHandle(serviceConfigHandle);
    serviceConfigHandle = nullptr;
    std::wcout << L"Service config handle closed." << std::endl;
}

// 3. Uninitialize PlayFab
XAsyncBlock async{};
HRESULT hr = PFUninitializeAsync(&async);
if (SUCCEEDED(hr))
{
    hr = XAsyncGetStatus(&async, true); // Wait for completion
    if (SUCCEEDED(hr))
    {
        std::wcout << L"PlayFab uninitialized successfully." << std::endl;
    }
    else
    {
        std::wcerr << L"PlayFab uninitialization failed: 0x" << std::hex << hr << std::endl;
    }
}

std::wcout << L"Cleanup complete." << std::endl;
```

> [!IMPORTANT]
> Always clean up resources in the reverse order of initialization to ensure proper shutdown.

## Next steps

Now that you've initialized the SDK and authenticated a player, you're ready to start calling PlayFab services:

### Make your first API call
- **[Calling PlayFab Services](quickstart-services.md)** - Learn how to call PlayFab APIs to manage player data and use game services

### Core concepts
- [Asynchronous operations](async-model.md) - Understanding PlayFab's async programming model
- [Memory management](memory-management.md) - Best practices for managing SDK memory
- [Tracing and diagnostics](debug-trace.md) - Debugging and monitoring your integration

### Advanced authentication
- **Multi-platform authentication** - Support multiple authentication providers
- **Custom ID authentication** - Use your own authentication system
- **Account linking** - Link multiple authentication methods to one account

### Troubleshooting

**Common issues and solutions:**

| Issue | Solution |
|-------|----------|
| Linking errors | Ensure all required `.lib` files are added to Additional Dependencies |
| Runtime DLL errors | Copy required `.dll` files to your output directory |
| Authentication failures | Verify your Title ID and check network connectivity |
| API call failures | Enable tracing to see detailed error information |

## Reference documentation

- [PlayFab Unified SDK API Reference](../../api-references/c/pfauthentication/pfauthentication_members.md)
- [PlayFab Services API Reference](../../api-references/index.md)
- [Xbox Game Development Kit Documentation](https://docs.microsoft.com/gaming/gdk/)
