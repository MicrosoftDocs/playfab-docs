---
title: Handling Token Expiration
author: amccalib
description: Handling Token Expiration and Relogin in the PlayFab Services SDK
ms.author: andmcc
ms.date: 02/13/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, login, suspend, resume, quick resume, token refresh
ms.localizationpriority: medium
---

# Handling Token Expiration

The PlayFab Services SDK includes a background token refresh mechanism that helps keep your player's session active. Understanding how this mechanism works—and when your game needs to take action—is important, especially for Game Development Kit (GDK) titles that support suspend and resume.

## How automatic token refresh works

The SDK runs a background worker that periodically checks the player's entity token. If the token is **still valid but approaching expiration** (within one hour of expiry), the SDK automatically reauthenticates using the credentials from the original sign-in call. If this refresh succeeds, the token is updated transparently and the **PFEntityHandle** continues to be valid. No action is required from your game.

You can observe these silent token refreshes by registering a [**PFEntityRegisterTokenRefreshedEventHandler**](../../api-references/c/pfentity/functions/pfentityregistertokenrefreshedeventhandler.md) callback (see [Transparent refresh](#transparent-refresh)).

## When your game must handle token expiration

There are scenarios where the SDK **can't** automatically refresh the token:

- **The token has already expired.** The automatic refresh only works when the token is still valid. If the token is fully expired—for example, after a long suspend/resume cycle—the SDK doesn't attempt an automatic relogin. Instead, it notifies your game via the **TokenExpiredHandler**.
- **The original sign-in credentials are no longer valid.** If the handle or token originally provided to the sign-in request is no longer valid, automatic refresh fails and the **TokenExpiredHandler** is invoked.

> [!IMPORTANT]
> Registering a [**PFEntityTokenExpiredEventHandler**](../../api-references/c/pfentity/functions/pfentitytokenexpiredeventhandler.md) is recommended for all titles and is **essential** for GDK titles that support suspend and resume. Without this handler, your game has no way to recover from an expired token.

### Registering the TokenExpiredHandler

Use [**PFEntityRegisterTokenExpiredEventHandler**](../../api-references/c/pfentity/functions/pfentityregistertokenexpiredeventhandler.md) to register for a callback and **PFAuthenticationReLoginWith\*Async** to reauthenticate when the token expires.

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

## GDK: Suspend, resume, and Quick Resume

On GDK platforms (Xbox consoles and Windows with the GDK), a game can be suspended for an extended period, such as when the player switches to another game and later returns via Quick Resume. During suspension, the entity token may expire. Because no code runs during suspension, the SDK's periodic background refresh can't keep the token alive.

### What happens on resume

When your game resumes, the SDK **immediately** detects the resumed state and checks the entity token. It doesn't wait for the next periodic refresh cycle. If the token expired during the suspend:

1. The SDK detects the expired token.
2. The **TokenExpiredHandler** callback is invoked.
3. Your game must call **PFAuthenticationReLoginWith\*Async** from the handler to acquire a new token.

> [!NOTE]
> The token check on resume is triggered as soon as network connectivity is restored. If the network takes a moment to reinitialize after resume, the SDK waits for connectivity before checking the token. No token check is lost.

## Transparent refresh

If you would like your game to know when the SDK automatically refreshes the player's entity token, you can register for a callback. This handler is invoked when the SDK successfully refreshes a token that was approaching expiration—no action is required from your game.

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
