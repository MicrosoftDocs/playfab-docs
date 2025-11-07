---
title: Quickstart (Windows) - Calling PlayFab Services
author: Jeffrey-Shi
description: Learn how to call PlayFab service APIs using the unified SDK.
ms.author: jeffshi
ms.date: 09/25/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, steam, api
ms.localizationpriority: medium
---

# Quickstart (Windows) - Calling PlayFab Services

This guide shows you how to make PlayFab service API calls using the unified SDK. You'll learn how to call various PlayFab services to manage player data, retrieve files, and interact with other PlayFab features.

## Prerequisites

Before you begin, ensure you have:
- Completed the [core SDK setup and authentication](quickstart-core.md)
- An authenticated `PFEntityHandle` from the login process
- Your PlayFab Title ID and service configuration set up

> [!NOTE]
> This guide assumes you've already initialized the PlayFab SDK and authenticated a player following the [core quickstart guide](quickstart-core.md). If you haven't done so, please complete that guide first.

## What you'll accomplish

By the end of this quickstart, you'll have:
- Retrieved the entity key for an authenticated player
- Made your first PlayFab service API call
- Processed the response from a PlayFab service

## Making your first service API call

After successful authentication, you can make PlayFab API calls using the `PFEntityHandle` obtained during login. This example shows how to retrieve files stored for the current player.

### Step 1: Get the Entity Key

First, retrieve the entity key from your authenticated entity handle:

```cpp
PFEntityKey const* pEntityKey{};
std::vector<char> entityKeyBuffer;
size_t size{};
HRESULT hr = PFEntityGetEntityKeySize(entityHandle, &size);
if (FAILED(hr))
{
    std::wcerr << L"Failed to get entity key size: 0x" << std::hex << hr << std::endl;
    return hr;
}

entityKeyBuffer.resize(size);
hr = PFEntityGetEntityKey(entityHandle, entityKeyBuffer.size(), 
    entityKeyBuffer.data(), &pEntityKey, nullptr);
if (FAILED(hr))
{
    std::wcerr << L"Failed to get entity key: 0x" << std::hex << hr << std::endl;
    return hr;
}

std::wcout << L"Entity ID: " << pEntityKey->id << std::endl;
```

### Step 2: Call the GetFiles API

Now make your first PlayFab service call to get files associated with the player:

```cpp
// Prepare the request
XAsyncBlock async{};
PFDataGetFilesRequest requestFiles{};
requestFiles.entity = pEntityKey;  // Use the entity key from above

// Make the async API call
HRESULT hr = PFDataGetFilesAsync(entityHandle, &requestFiles, &async);
if (FAILED(hr))
{
    std::wcerr << L"Failed to start GetFiles request: 0x" << std::hex << hr << std::endl;
    return hr;
}

// Wait for the call to complete
hr = XAsyncGetStatus(&async, true);
if (FAILED(hr))
{
    std::wcerr << L"GetFiles request failed: 0x" << std::hex << hr << std::endl;
    return hr;
}

// Get the result size and allocate buffer
size_t resultSize;
hr = PFDataGetFilesGetResultSize(&async, &resultSize);
if (FAILED(hr))
{
    std::wcerr << L"Failed to get result size: 0x" << std::hex << hr << std::endl;
    return hr;
}

// Retrieve the actual result
std::vector<char> getFilesResultBuffer(resultSize);
PFDataGetFilesResponse* getFilesResponseResult{ nullptr };
hr = PFDataGetFilesGetResult(&async, getFilesResultBuffer.size(), 
    getFilesResultBuffer.data(), &getFilesResponseResult, nullptr);
if (SUCCEEDED(hr))
{
    std::wcout << L"Successfully retrieved files. Count: " 
               << (getFilesResponseResult->metadata ? getFilesResponseResult->metadataCount : 0) 
               << std::endl;
    
    // Process the files as needed
    if (getFilesResponseResult->metadata)
    {
        for (uint32_t i = 0; i < getFilesResponseResult->metadataCount; ++i)
        {
            std::wcout << L"File: " << getFilesResponseResult->metadata[i].fileName << std::endl;
        }
    }
}
else
{
    std::wcerr << L"Failed to get GetFiles result: 0x" << std::hex << hr << std::endl;
}
```

🎉 **Congratulations!** You've successfully made your first PlayFab service API call using the Unified SDK.

## Understanding the API call pattern

All PlayFab service API calls follow a similar pattern:

1. **Prepare the request** - Create and populate a request structure
2. **Initiate the async call** - Call the `*Async` function
3. **Wait for completion** - Use `XAsyncGetStatus` to wait for the operation
4. **Get result size** - Call `*GetResultSize` to determine buffer needs
5. **Retrieve the result** - Call `*GetResult` to get the actual data

This pattern applies to all PlayFab service APIs, making it easy to work with different services once you understand the basics.

## Next steps

Now that you've successfully called a PlayFab service, explore these additional features:

### Common service APIs
- **Player Data Management** - Store and retrieve custom player data
- **Player Statistics** - Track player stats and achievements  
- **Title Data** - Access game configuration data
- **Cloud Script** - Execute server-side logic

### Advanced features
- **Leaderboards** - Implement competitive features with rankings
- **Economy and Monetization** - Add virtual currencies and items
- **Multiplayer** - Integrate matchmaking and lobby services
- **Analytics** - Track player behavior and game metrics

### Best practices
- [Asynchronous operations](async-model.md) - Understanding PlayFab's async programming model
- [Memory management](memory-management.md) - Best practices for managing SDK memory
- [Tracing and diagnostics](debug-trace.md) - Debugging and monitoring your integration

## Troubleshooting

**Common issues and solutions:**

| Issue | Solution |
|-------|----------|
| Invalid entity handle | Ensure you completed authentication successfully |
| API call timeout | Check network connectivity and PlayFab service status |
| Access denied errors | Verify your Title ID and entity permissions |
| Buffer size errors | Always call `*GetResultSize` before `*GetResult` |

For more detailed error information, enable [tracing and diagnostics](debug-trace.md) in your application.

## Reference documentation

- [PlayFab Unified SDK API Reference](../../api-references/c/pfauthentication/pfauthentication_members.md)
- [PlayFab Services API Reference](../../api-references/index.md)
- [PlayFab Data API Documentation](https://docs.microsoft.com/gaming/playfab/api-references/data/)
