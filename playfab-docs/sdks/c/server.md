---
title: Game servers from title entity
author: jiwyoo
description: Accessing PlayFab with a title entity
ms.author: jiwooyoo
ms.date: 09/20/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, server
ms.localizationpriority: medium
---

# Accessing PlayFab with a title entity

Similar to how you can log in as a player and make PlayFab calls, you can authenticate as a title entity and make PlayFab calls through it as well. Title entities can use certain functions not available to player entities. Many of these functions are prefixed by the word "server", one such example is ServerAddPlayerTag.

Getting a title entity handle has the same initialization steps as logging in as a player. See the "Initialization" section of [Quickstart for Win32](./quickstart-win32.md) article for details.

Note: At the moment, server functions are only available on the Win32 version of the SDK.

## Authenticating a title entity

After you create a __PFServiceConfigHandle__ in the initial steps, you can then get a title entity handle by calling __PFAuthenticationGetEntityWithSecretKeyAsync__. After the get entity call completes successfully, it will return __S_OK__ along with a __PFEntityHandle__. This process is similar to logging in as a player. The return type of __PFEntityHandle__ is the same, except in this case the entity handle represents a title entity rather than a player entity. We can call this entity a game server.

```cpp
    PFAuthenticationGetEntityRequest request{};
    XAsyncBlock async{};

    // Add your own error handling when FAILED(hr) == true
    HRESULT hr = PFAuthenticationGetEntityWithSecretKeyAsync(
        serviceConfigHandle,
        secretKey, // title specific secret key
        &request,
        &async
    );

    hr = XAsyncGetStatus(&async, true); // This is doing a blocking wait for completion, but you can use the XAsyncBlock to set a callback instead for async style usage

    PFEntityHandle entityHandle;
    hr = PFAuthenticationGetEntityWithSecretKeyGetResult(
        &async,
        &entityHandle
    );
```
## Service calls

Once the game server is created, you can make calls to the PlayFab backend. Here's an example of adding player tags to a specific player in the title.

```cpp
    XAsyncBlock async{};
    PFSegmentsAddPlayerTagRequest request{};
    addSegmentRequest.PlayFabId = "ABCDEF123456";
    addSegmentRequest.tagName = "tagName";
    HRESULT hr = PFSegmentsServerAddPlayerTagAsync(entityHandle, &request, &async);
    hr = XAsyncGetStatus(&async, true);
```

Like the AddPlayerTag example, many of the functions used by a game server involve getting or changing player data. This function requires having the specific player's PlayFab ID. Connected clients can provide PlayFab IDs or the server can retrieve them directly from PlayFab via calls such as GetPlayFabIDsFromXboxLiveIDs.

## Reference

[API reference documentation](../../api-references/c/pfauthentication/pfauthentication_members.md)
