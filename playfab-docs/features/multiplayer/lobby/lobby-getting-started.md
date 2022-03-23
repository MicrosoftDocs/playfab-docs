---
title: PlayFab Multiplayer Lobby Quickstart
author: PushpadantK
description: Quickstart guide to create a lobby with notifications.
ms.author: pkacha
ms.date: 11/24/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, lobby, matchmaking
ms.localizationpriority: medium
---

# Getting started with Azure PlayFab Lobby

> [!IMPORTANT]
> This feature is currently in public preview. It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development. 

This article describes how to set up the development environment for Azure PlayFab Lobby and start using it.

## Prerequisites

You need a PlayFab account to access Lobby and Matchmaking features.

Create/sign in to your [PlayFab account](https://playfab.com). For instructions, see [Quickstart: Game Manager](../../../gamemanager/quickstart.md).

## Download and set up the PlayFab Multiplayer Client SDK

Like the PlayFab Core SDKs, we have Multiplayer SDKs for different platforms and game engines. Select and download the one that you need. 

For download links, see [Lobby SDKs](lobby-matchmaking-sdks\lobby-matchmaking-sdks.md).

For Unity and Unreal set up instructions, see the following articles.
* [Quickstart for Unity](lobby-matchmaking-sdks/multiplayer-unity-sdk-getting-started.md)
* [Quickstart for Unreal](../networking/party-unreal-engine-oss-quickstart.md)

## Initialize PlayFab Multiplayer Client SDK

Now that you've finished the setup, you're ready to make your first API call and use more Lobby features.

To start making Lobby API calls, you also need the PlayFab Entity Token. Get it via REST calls ([GetEntityToken](https://docs.microsoft.com/rest/api/playfab/authentication/authentication/getentitytoken)) or by using the PlayFab Core SDK.

## Initialize Lobby

Initialize the PlayFab Multiplayer Client SDK by following these basic steps.

```cpp
    static PFMultiplayerHandle g_pfmHandle = nullptr;
 ...
 ...
    HRESULT hr = S_OK;
   
    // Initialize the PFMultiplayer library.
    hr = PFMultiplayerInitialize(titleId, &g_pfmHandle);
    RETURN_IF_FAILED(hr);

    // Set an entity token for a local user. The token will be used for operations on behalf of this user. If using
    // the PF Core SDK, this should be called each time the PF Core SDK provides a refreshed token.
    hr = PFMultiplayerSetEntityToken(g_pfmHandle, localUserEntity, entityToken);
    RETURN_IF_FAILED(hr);

    return S_OK;
```

## Next steps

* [Create a Lobby](create-a-lobby.md)
* [Find and join a lobby](join-lobbies.md)
* [Invite another player to a lobby](lobby-invites.md)
* [Use lobby properties to coordinate a game session](lobby-properties.md)

## See also

* [Create searchable lobbies](define-search-keywords.md)
* [Lobby properties](lobby-properties.md)
* [Lobby Client SDK reference](playfabmultiplayerreference-cpp\pflobby\pflobby_members.md)
* [Lobby SDKs](lobby-matchmaking-sdks/lobby-matchmaking-sdks.md)

