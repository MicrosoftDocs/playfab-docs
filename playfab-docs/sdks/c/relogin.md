---
title: Handling Token Expiration
author: amccalib
description: Handling Token Expiration and Relogin in the PlayFab Services SDK
ms.author: andmcc
ms.date: 03/03/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, login
ms.localizationpriority: medium
---

# Handling Token Expiration

The PlayFab Services SDK automatically attempts to handle relogin and token refresh in this SDK. When a PlayFab entity token expires, the SDK detects the failure and attempts to acquire a new entity token using the handle or token you originally provided to the login request. If this relogin succeeds, the SDK retries the original failed call automatically. Additionally, the **PFEntityHandle** returned by the original login call continues to be valid.

## Automatic refresh failure

It's possible for automatic token refresh to fail. This failure could be because the handle or token you originally provided to the login request is no longer valid. To handle this scenario, your game can register for a callback to provide a new handle or token and retry the login. Use **PFEntityRegisterTokenExpiredEventHandler** to register for a callback and **PFAuthenticationReLoginWith\*Async** to provide the new handle or token and reattempt the login.

```cpp
    PFRegistrationToken registrationTokenExpired{};
    hr = PFEntityRegisterTokenExpiredEventHandler(nullptr, nullptr, [](void* ctx, PFEntityKey const* entityKey)
    {
        PFAuthenticationLoginWithXUserRequest request{};
        request.createAccount = true;
        request.user = user; // An XUserHandle obtained from XUserAddAsync

        XAsyncBlock async{};
        HRESULT hr = PFAuthenticationReLoginWithXUserAsync(GlobalState()->entityHandle, &request, &async); // This assumes the entity handle was stored in the game's global state
        hr = XAsyncGetStatus(&async, true); // This is doing a blocking wait for completion, but you can use the XAsyncBlock to set a callback instead for async style usage

        // After login we could potentially get back a new player entity with a new entity key
        PFEntityKey const* pEntityKey{};
        std::vector<char> entityKeyBuffer;
        size_t size{};
        hr = PFEntityGetEntityKeySize(GlobalState()->entityHandle, &size); // Add your own error handling when FAILED(hr) == true

        entityKeyBuffer.resize(size);
        hr = PFEntityGetEntityKey(GlobalState()->entityHandle, entityKeyBuffer.size(), entityKeyBuffer.data(), &pEntityKey, nullptr);
    }, &registrationTokenExpired);
```

## Transparent refresh

If you would like your game to know when the SDK automatically refreshes the player's entity token, you can register for a callback.

```cpp
    PFRegistrationToken registrationTokenRefreshed{};
    hr = PFEntityRegisterTokenRefreshedEventHandler(nullptr, nullptr, [](void* ctx, PFEntityKey const* entityKey, const PFEntityToken* newToken)
    {
        // Perform any logging or other desired actions on token refresh
    }, &registrationTokenRefreshed);
```

## Unregister Handlers

When shutting down PlayFab or when you want to stop receiving token expiration and refresh callbacks, call the appropriate unregister function.

```cpp
    PFEntityUnregisterTokenExpiredEventHandler(registrationTokenExpired);
    PFEntityUnregisterTokenRefreshedEventHandler(registrationTokenRefreshed);
```

## Reference

[API reference documentation](../../api-references/c/pfauthentication/pfauthentication_members.md)
