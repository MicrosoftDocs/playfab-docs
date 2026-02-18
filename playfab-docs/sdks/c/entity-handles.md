---
title: Entity Handles
author: amccalib
description: Managing entity handles and token lifecycle in the PlayFab Services SDK
ms.author: andmcc
ms.date: 02/14/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, entity, handles, tokens
ms.localizationpriority: medium
---

# Entity Handles

A __PFEntityHandle__ is your primary credential for making PlayFab service calls. It represents an authenticated entity—either a player (title_player_account) or a title—and holds the entity token the SDK needs to authorize requests. Every login or authentication call returns a __PFEntityHandle__, and every service call requires one.

## Getting an entity handle

You don't create entity handles directly. Instead, you get one as an output of a successful login or authentication call.

**Player login (Windows example):**

```cpp
PFAuthenticationLoginWithXUserRequest request{};
request.createAccount = true;
request.user = userHandle; // XUserHandle from XUserAddAsync

XAsyncBlock async{};
HRESULT hr = PFAuthenticationLoginWithXUserAsync(serviceConfigHandle, &request, &async);
hr = XAsyncGetStatus(&async, true);

PFEntityHandle entityHandle{ nullptr };
size_t bufferSize{};
hr = PFAuthenticationLoginWithXUserGetResultSize(&async, &bufferSize);

std::vector<char> loginResultBuffer(bufferSize);
PFAuthenticationLoginResult const* loginResult{};
hr = PFAuthenticationLoginWithXUserGetResult(
    &async, &entityHandle,
    loginResultBuffer.size(), loginResultBuffer.data(),
    &loginResult, nullptr);
```

**Title entity (server):**

Title entities authenticate with a secret key instead of a user credential. The returned __PFEntityHandle__ works the same way, but it represents the title rather than a player. See [Accessing PlayFab with a title entity](server.md) for details.

## Handle ownership and ref counting

__PFEntityHandle__ is ref-counted. When you receive a handle from a login call, you own one reference. You can create additional references with [__PFEntityDuplicateHandle__](../../api-references/c/pfentity/functions/pfentityduplicatehandle.md) and release them with [__PFEntityCloseHandle__](../../api-references/c/pfentity/functions/pfentityclosehandle.md). The underlying entity object is destroyed only when the last reference is closed.

**Rules:**

- Every call to a login `GetResult` function or __PFEntityDuplicateHandle__ gives you a handle you must close.
- Closing a handle doesn't invalidate other handles to the same entity.
- Close all handles before calling [__PFServicesUninitializeAsync__](../../api-references/c/pfservices/functions/pfservicesuninitializeasync.md).

```cpp
// Duplicate a handle for another component
PFEntityHandle secondHandle{ nullptr };
HRESULT hr = PFEntityDuplicateHandle(entityHandle, &secondHandle);

// Both handles are independently valid
// ...

// Each owner closes their own handle
PFEntityCloseHandle(secondHandle);
PFEntityCloseHandle(entityHandle);
```

## Getting entity info

### Entity key

The entity key identifies the entity (its type and ID). Use the two-call pattern: get the size first, then get the data.

```cpp
size_t size{};
HRESULT hr = PFEntityGetEntityKeySize(entityHandle, &size);

std::vector<char> buffer(size);
PFEntityKey const* entityKey{};
hr = PFEntityGetEntityKey(entityHandle, buffer.size(), buffer.data(), &entityKey, nullptr);

// entityKey->type is "title_player_account" for players
// entityKey->id is the entity's unique ID
```

### Entity token

The entity token authorizes service calls. The SDK manages tokens automatically, but you can retrieve the current one if needed.

```cpp
XAsyncBlock async{};
HRESULT hr = PFEntityGetEntityTokenAsync(entityHandle, &async);
hr = XAsyncGetStatus(&async, true);

size_t size{};
hr = PFEntityGetEntityTokenResultSize(&async, &size);

std::vector<char> buffer(size);
const PFEntityToken* entityToken{};
hr = PFEntityGetEntityTokenResult(&async, buffer.size(), buffer.data(), &entityToken, nullptr);

// entityToken->token is the token string
// entityToken->expiration is the optional expiration time (UTC)
```

### Checking entity type

Use [__PFEntityIsTitlePlayer__](../../api-references/c/pfentity/functions/pfentityistitleplayer.md) as a quick check instead of inspecting the entity key type string:

```cpp
bool isTitlePlayer{};
HRESULT hr = PFEntityIsTitlePlayer(entityHandle, &isTitlePlayer);
```

## Player entities vs. title entities

Both player and title entities use __PFEntityHandle__, but they differ in what they can do:

| | Player entity | Title entity |
|---|---|---|
| **How you get it** | Login call (e.g., `PFAuthenticationLoginWithXUserAsync`) | `PFAuthenticationGetEntityWithSecretKeyAsync` |
| **Entity type** | `title_player_account` | `title` |
| [**PFEntityIsTitlePlayer**](../../api-references/c/pfentity/functions/pfentityistitleplayer.md) | Returns `true` | Returns `false` |
| [**PFEntityGetSecretKey**](../../api-references/c/pfentity/functions/pfentitygetsecretkey.md) | Fails with `E_PF_NOSECRETKEY` | Returns the secret key |
| **Available APIs** | Client-prefixed and non-prefixed APIs | Server-prefixed and non-prefixed APIs |

Non-prefixed APIs (e.g., Inventory, Leaderboards, Data) can generally be called by both player and title entities unless otherwise noted in their documentation. Client-prefixed APIs are player-only, and Server-prefixed APIs are title-only.

__PFEntityGetSecretKey__ retrieves the secret key associated with a title entity. It fails for player entities because they don't have one.

```cpp
size_t keySize{};
HRESULT hr = PFEntityGetSecretKeySize(entityHandle, &keySize);
if (SUCCEEDED(hr))
{
    std::vector<char> secretKey(keySize);
    hr = PFEntityGetSecretKey(entityHandle, secretKey.size(), secretKey.data(), nullptr);
}
```

> [!NOTE]
> __PFEntityGetSecretKey__ is only available on Windows, Linux, and macOS platforms.

## Token event handlers

The SDK automatically refreshes entity tokens before they expire. You can register callbacks to observe these events.

### Token expired

If automatic refresh fails (for example, the original login credential is no longer valid), the SDK fires the token-expired event. Register a handler to provide a new credential and retry the login.

```cpp
PFRegistrationToken registrationToken{};
HRESULT hr = PFEntityRegisterTokenExpiredEventHandler(
    nullptr,  // XTaskQueueHandle, or nullptr for default
    nullptr,  // optional context
    [](void* ctx, PFEntityKey const* entityKey)
    {
        // Re-authenticate the player with a fresh credential
        // See relogin.md for a complete example
    },
    &registrationToken);
```

### Token refreshed

Register a token-refreshed handler if you want to know when the SDK successfully refreshes a token in the background. This is informational—you don't need to take any action.

```cpp
PFRegistrationToken registrationToken{};
HRESULT hr = PFEntityRegisterTokenRefreshedEventHandler(
    nullptr,  // XTaskQueueHandle, or nullptr for default
    nullptr,  // optional context
    [](void* ctx, PFEntityKey const* entityKey, const PFEntityToken* newToken)
    {
        // Log the refresh or update cached token references
    },
    &registrationToken);
```

### When to register and unregister

- **Register** handlers early, right after SDK initialization and before login. This ensures you don't miss any events.
- **Unregister** handlers during shutdown, before you close entity handles.

```cpp
PFEntityUnregisterTokenExpiredEventHandler(expiredRegistrationToken);
PFEntityUnregisterTokenRefreshedEventHandler(refreshedRegistrationToken);
```

For a complete walkthrough of token expiration handling and relogin, see [Handling Token Expiration](relogin.md).

## Utility accessors

You can retrieve the API endpoint and title ID from an entity handle. These come from the __PFServiceConfigHandle__ that was used during login.

```cpp
// Get API endpoint
size_t endpointSize{};
HRESULT hr = PFEntityGetAPIEndpointSize(entityHandle, &endpointSize);

std::vector<char> endpoint(endpointSize);
hr = PFEntityGetAPIEndpoint(entityHandle, endpoint.size(), endpoint.data(), nullptr);

// Get title ID
size_t titleIdSize{};
hr = PFEntityGetTitleIdSize(entityHandle, &titleIdSize);

std::vector<char> titleId(titleIdSize);
hr = PFEntityGetTitleId(entityHandle, titleId.size(), titleId.data(), nullptr);
```

## Complete example

This example demonstrates creating, duplicating, querying, and closing entity handles:

```cpp
#include <playfab/core/PFEntity.h>
#include <playfab/services/PFServices.h>

void EntityHandleExample(PFServiceConfigHandle serviceConfigHandle, XUserHandle userHandle)
{
    //
    // Log in and get an entity handle
    //
    PFAuthenticationLoginWithXUserRequest request{};
    request.createAccount = true;
    request.user = userHandle;

    XAsyncBlock asyncLogin{};
    HRESULT hr = PFAuthenticationLoginWithXUserAsync(serviceConfigHandle, &request, &asyncLogin);
    hr = XAsyncGetStatus(&asyncLogin, true);

    PFEntityHandle entityHandle{ nullptr };
    size_t resultSize{};
    hr = PFAuthenticationLoginWithXUserGetResultSize(&asyncLogin, &resultSize);

    std::vector<char> loginBuffer(resultSize);
    PFAuthenticationLoginResult const* loginResult{};
    hr = PFAuthenticationLoginWithXUserGetResult(
        &asyncLogin, &entityHandle,
        loginBuffer.size(), loginBuffer.data(),
        &loginResult, nullptr);

    //
    // Register token event handlers
    //
    PFRegistrationToken expiredToken{};
    hr = PFEntityRegisterTokenExpiredEventHandler(nullptr, nullptr,
        [](void* ctx, PFEntityKey const* entityKey)
        {
            // Handle re-authentication
        }, &expiredToken);

    PFRegistrationToken refreshedToken{};
    hr = PFEntityRegisterTokenRefreshedEventHandler(nullptr, nullptr,
        [](void* ctx, PFEntityKey const* entityKey, const PFEntityToken* newToken)
        {
            // Log token refresh
        }, &refreshedToken);

    //
    // Duplicate the handle for a subsystem
    //
    PFEntityHandle subsystemHandle{ nullptr };
    hr = PFEntityDuplicateHandle(entityHandle, &subsystemHandle);

    //
    // Query entity info
    //
    bool isTitlePlayer{};
    hr = PFEntityIsTitlePlayer(entityHandle, &isTitlePlayer);

    size_t keySize{};
    hr = PFEntityGetEntityKeySize(entityHandle, &keySize);

    std::vector<char> keyBuffer(keySize);
    PFEntityKey const* entityKey{};
    hr = PFEntityGetEntityKey(entityHandle, keyBuffer.size(), keyBuffer.data(), &entityKey, nullptr);

    //
    // ... make service calls with entityHandle or subsystemHandle ...
    //

    //
    // Cleanup: unregister handlers, then close all handles
    //
    PFEntityUnregisterTokenExpiredEventHandler(expiredToken);
    PFEntityUnregisterTokenRefreshedEventHandler(refreshedToken);

    PFEntityCloseHandle(subsystemHandle);
    PFEntityCloseHandle(entityHandle);
}
```

## API reference

| Function | Description |
|---|---|
| [PFEntityDuplicateHandle](../../api-references/c/pfentity/functions/pfentityduplicatehandle.md) | Duplicates a handle, incrementing the ref count. Both handles must be closed independently. |
| [PFEntityCloseHandle](../../api-references/c/pfentity/functions/pfentityclosehandle.md) | Closes a handle, decrementing the ref count. The entity is destroyed when the last handle is closed. |
| [PFEntityGetEntityKeySize](../../api-references/c/pfentity/functions/pfentitygetentitykeysize.md) | Gets the buffer size needed to store the entity key. |
| [PFEntityGetEntityKey](../../api-references/c/pfentity/functions/pfentitygetentitykey.md) | Gets the entity key (type and ID) for the entity. |
| [PFEntityGetEntityTokenAsync](../../api-references/c/pfentity/functions/pfentitygetentitytokenasync.md) | Retrieves the cached entity token asynchronously. |
| [PFEntityGetEntityTokenResultSize](../../api-references/c/pfentity/functions/pfentitygetentitytokenresultsize.md) | Gets the buffer size needed for the entity token result. |
| [PFEntityGetEntityTokenResult](../../api-references/c/pfentity/functions/pfentitygetentitytokenresult.md) | Gets the entity token from a completed PFEntityGetEntityTokenAsync call. |
| [PFEntityIsTitlePlayer](../../api-references/c/pfentity/functions/pfentityistitleplayer.md) | Returns whether the entity is a title_player_account. |
| [PFEntityGetSecretKeySize](../../api-references/c/pfentity/functions/pfentitygetsecretkeysize.md) | Gets the buffer size needed for the secret key. Fails if the entity isn't a title entity. |
| [PFEntityGetSecretKey](../../api-references/c/pfentity/functions/pfentitygetsecretkey.md) | Gets the secret key for a title entity. Only available on Windows, Linux, and macOS. |
| [PFEntityGetAPIEndpointSize](../../api-references/c/pfentity/functions/pfentitygetapiendpointsize.md) | Gets the buffer size needed for the API endpoint string. |
| [PFEntityGetAPIEndpoint](../../api-references/c/pfentity/functions/pfentitygetapiendpoint.md) | Gets the API endpoint from the entity's associated service config. |
| __PFEntityGetTitleIdSize__ | Gets the buffer size needed for the title ID string. |
| __PFEntityGetTitleId__ | Gets the title ID from the entity's associated service config. |
| [PFEntityRegisterTokenExpiredEventHandler](../../api-references/c/pfentity/functions/pfentityregistertokenexpiredeventhandler.md) | Registers a callback for when automatic token refresh fails. |
| [PFEntityUnregisterTokenExpiredEventHandler](../../api-references/c/pfentity/functions/pfentityunregistertokenexpiredeventhandler.md) | Unregisters a token-expired callback. |
| [PFEntityRegisterTokenRefreshedEventHandler](../../api-references/c/pfentity/functions/pfentityregistertokenrefreshedeventhandler.md) | Registers a callback for when the SDK successfully refreshes a token. |
| [PFEntityUnregisterTokenRefreshedEventHandler](../../api-references/c/pfentity/functions/pfentityunregistertokenrefreshedeventhandler.md) | Unregisters a token-refreshed callback. |

For the complete API reference, see [PFEntity members](../../api-references/c/pfentity/pfentity_members.md).

## See also

- [Handling Token Expiration](relogin.md)
- [Accessing PlayFab with a title entity](server.md)
- [SDK Lifecycle](lifecycle.md)
- [Quickstart: Windows](quickstart-gdk.md)
- [Quickstart: Win32](quickstart-win32.md)
