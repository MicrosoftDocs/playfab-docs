---
title: Lobby SDK Quickstart
author: PushpadantK
description: Quickstart guide to using the PlayFab Multiplayer SDK to create a PlayFab Lobby.
ms.author: pkacha
ms.date: 11/24/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking
ms.localizationpriority: medium
---

# Lobby SDK Quickstart
 

This article describes how to set up the development environment for Azure PlayFab Lobby and create your first lobby using the PlayFab Multiplayer C/C++ SDK.

> [!NOTE]
> The PlayFab Multiplayer SDK also provides APIs for PlayFab Matchmaking.
> * For more information on C++ APIs, see the [Matchmaking SDK quickstart](../matchmaking/quickstart-client-sdk.md).
> * For more information on Unity APIs, see the [Quickstart for Unity](lobby-matchmaking-sdks/multiplayer-unity-sdk-getting-started.md)
> * For more information on Unreal APIs, see the [Quickstart for Unreal](../networking/party-unreal-engine-oss-quickstart.md)

## Prerequisites

You need a [PlayFab account](https://playfab.com) to use PlayFab Lobbies. For instructions to create an account, see [Quickstart: Game Manager](../../../gamemanager/quickstart.md).

## Download and set up the PlayFab Multiplayer SDK

Download the [C/C++ SDK](lobby-matchmaking-sdks/lobby-matchmaking-sdks.md) for your platform and integrate the provider header and library files into your build.

> [!NOTE]
> This quick start focuses on using the C/C++ SDK. For Unity and Unreal interfaces, see the following articles:
> * [Quickstart for Unity](lobby-matchmaking-sdks/multiplayer-unity-sdk-getting-started.md)
> * [Quickstart for Unreal](../networking/party-unreal-engine-oss-quickstart.md)

## Log in a PlayFab entity

To use the PlayFab Lobby SDK, you need to authenticate your client using PlayFab entity keys and entity tokens. Acquire a PlayFab entity key and token pair by logging in with [LoginWithCustomId](/rest/api/playfab/client/authentication/login-with-custom-id) REST API. This API is also available as a C/C++ projection via the [PlayFab REST SDK](/gaming/playfab/sdks/playfab-sdk-intro).

> [!NOTE]
> LoginWithCustomId is a quick way to get started with PlayFab features but is not intended to be the login mechanism you ship with. For login guidance, see [Login basics and best practices](/features/authentication/login/login-basics-best-practices).

## Initialize the PlayFab Multiplayer SDK

Initialize the PlayFab Multiplayer SDK by following these basic steps:

1. Initialize the SDK by calling [PFMultiplayerInitialize](playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayerinitialize.md)
2. Set the entity key and token used by the library on behalf of your players by calling [PFMultiplayerSetEntityToken](playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayersetentitytoken.md).

```cpp
static PFMultiplayerHandle g_pfmHandle = nullptr;
...
...
HRESULT hr = S_OK;

// Initialize the PFMultiplayer library.
hr = PFMultiplayerInitialize(titleId, &g_pfmHandle);
if (FAILED(hr))
{
    // handle initialize failure
    printf("PFMultiplayerInitialize failed! %s\n", PFMultiplayerGetErrorMessage(hr));
    return hr;
}

// Set an entity token for a local user. The token is used to authenticate PlayFab operations on behalf of this user. 
// Tokens can expire, and this API token should be called again when this token is refreshed.
hr = PFMultiplayerSetEntityToken(g_pfmHandle, localUserEntity, entityToken);
if (FAILED(hr))
{
    // handle set entity token failure
    printf("PFMultiplayerSetEntityToken failed! %s\n", PFMultiplayerGetErrorMessage(hr));
    return hr;
}
```

## Create a lobby

Finally, we'll create a lobby by following these basic steps:

1. Call [PFMultiplayerCreateAndJoinLobby](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayercreateandjoinlobby.md)
2. Check for asynchronous completion by periodically polling [PFMultiplayerStartProcessingLobbyStateChanges](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerstartprocessinglobbystatechanges.md) for a [PFLobbyCreateAndJoinLobbyCompletedStateChange](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerstartprocessinglobbystatechanges.md).

```cpp
PFLobbyCreateConfiguration lobbyConfiguration{};
lobbyConfiguration.maxMemberCount = 16;
lobbyConfiguration.ownerMigrationPolicy = PFLobbyOwnerMigrationPolicy::Automatic;
lobbyConfiguration.accessPolicy = PFLobbyAccessPolicy::Public;

PFLobbyJoinConfiguration memberConfiguration{};

PFLobbyHandle lobby;
HRESULT hr = PFMultiplayerCreateAndJoinLobby(g_pfmHandle, localUserEntity, &lobbyConfiguration, &memberConfiguration, nullptr, &lobby);
if (FAILED(hr))
{
    // handle immediate create failure
    printf("PFMultiplayerCreateAndJoinLobby failed! %s\n", PFMultiplayerGetErrorMessage(hr));
    return hr;
}

// NOTE: to simplify this quickstart, we'll synchronously block waiting waiting for the CreateAndJoinLobby operation
// to finish. In a real implementation, this polling would be done asynchronously on a background thread/worker.
bool createAndJoinLobbyFinished = false;
while (!createAndJoinLobbyFinished)
{
    uint32_t lobbyStateChangeCount;
    const PFLobbyStateChange * const * lobbyStateChanges;
    HRESULT hr = PFMultiplayerStartProcessingLobbyStateChanges(m_pfmHandle, &lobbyStateChangeCount, &lobbyStateChanges);
    if (FAILED(hr))
    {
        // handle the failure
        printf("PFMultiplayerStartProcessingLobbyStateChanges failed! %s\n", PFMultiplayerGetErrorMessage(hr));
        return hr;
    }

    for (uint32_t i = 0; i < lobbyStateChangeCount; ++i)
    {
        const PFLobbyStateChange* stateChange = lobbyStateChanges[i];
        switch (stateChange->stateChangeType)
        {
            case PFLobbyStateChangeType::CreateAndJoinLobbyCompleted:
            {
                auto createAndJoinStateChange = 
                    static_cast<const PFLobbyCreateAndJoinLobbyCompletedStateChange*>(stateChange);

                if (SUCCEEDED(createAndJoinStateChange->result))
                {
                    // lobby successfully created!
                    printf("Lobby 0x%p successfully created!\n", createAndJoinStateChange->lobby);
                }
                else
                {
                    // report asynchronous failure
                    printf("Failed to create lobby 0x%p! %s\n",
                        createAndJoinStateChange->lobby,
                        PFMultiplayerGetErrorMessage(createAndJoinStateChange->result));
                }
                createAndJoinLobbyFinished = true;
                break;
            }
        }
    }

    hr = PFMultiplayerFinishProcessingLobbyStateChanges(m_pfmHandle, lobbyStateChangeCount, lobbyStateChanges);
    if (FAILED(hr))
    {
        printf("PFMultiplayerFinishProcessingLobbyStateChanges failed! %s\n", PFMultiplayerGetErrorMessage(hr));
        return hr;
    }
}
```

For more information on creating lobbies, see [Create a Lobby](create-a-lobby.md).

For more information on processing asynchronous operations, see [Asynchronous operations and notifications](lobby-and-matchmaking-client-sdk-async.md).

## Next steps

* [Find and join a lobby](join-lobbies.md)
* [Invite another player to a lobby](lobby-invites.md)
* [Use lobby properties to coordinate a game session](lobby-properties.md)

## See also

* [Create a Lobby](create-a-lobby.md)
* [Asynchronous operations and notifications](lobby-and-matchmaking-client-sdk-async.md)
* [Create searchable lobbies](define-search-keywords.md)
* [Lobby properties](lobby-properties.md)
* [Lobby SDK reference](playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
* [Lobby SDKs](lobby-matchmaking-sdks/lobby-matchmaking-sdks.md)
* [Matchmaking SDK quickstart](../matchmaking/quickstart-client-sdk.md)
