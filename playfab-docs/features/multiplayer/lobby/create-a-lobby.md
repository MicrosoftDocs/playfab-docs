---
title: Create a lobby
author: joannaleecy
description: Learn how to create a lobby.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking
ms.localizationpriority: medium
---

# Create a lobby

This article explains how to create a lobby. 

## How are lobbies created?

There are several ways a lobby can be created.

* **By your players**: Lobbies can be created by players who want get together a team of players to play. These are client-owned lobbies.
* **By your game servers**: Your title's game servers can create lobbies and wait for players to join. These are server-owned lobbies.
* **By matchmaking**: After a group of players form after matchmaking, a lobby is created as a holding place before the game starts. These are client-owned lobbies.

From a technical perspective, all lobbies are fall into two main categories based on ownership&mdash;server-owned and client-owned. To learn more, see [Owner requirements and privileges](owner-requirements-and-privileges.md).

The general usage of PlayFab Lobby is to temporarily hold a group of players together. For commonly used applications of Lobby, see the [Azure PlayFab Lobby overview](index.md).

### Supported entity types

Before a lobby can be created, your title must login as a PlayFab entity.

* When creating client-owned lobbies on behalf of your players, login as a title_player_account entity. For more information, see [Log in basics and best practices](../../authentication/login/login-basics-best-practices.md).
* When creating server-owned lobbies on behalf of your game servers, login as a game_server entity. For more information, see [AuthenticateGameServerWithCustomId](/rest/api/playfab/authentication/authentication/authenticate-game-server-with-custom-id).

## How lobbies are configured

Several important settings for a lobby are configured during creation: __maxMemberCount__, __accessPolicy__, __owner__, and __ownerMigrationPolicy__.

* __maxMemberCount__ defines how many players the lobby can hold
* __accessPolicy__ defines who may discover the lobby's connection string
* __owner__ defines the lobby's owner which has special permissions to update data on the lobby. This value is implicitly the client or server entity who is creating the lobby.
* __ownerMigrationPolicy__ defines policies for how ownership of the lobby should be transferred if the current owner leaves the lobby or has trouble maintaining a connection to the lobby.

Additionally, during creation, the lobby creator can also define custom lobby properties and search properties to append custom data to the lobby session. These custom properties can also be modified over the lifetime of the lobby by the lobby's owner.

For more information, see [Lobby properties](lobby-properties.md).

## Example creating a client-owned lobby using the Lobby and Matchmaking SDK

This example uses a local player who has been logged into PlayFab as a [title_player_account](../../data/entities/available-built-in-entity-types.md) entity.

In this code snippet, Lobby properties are passed in as __lobbyConfiguration__ and the player creating the lobby passes in their initial member properties via __creatorMemberConfiguration__. The local player becomes the lobby owner, so it's a client-owned lobby. After the lobby is successfully created, the __PFLobbyHandle__ can be used to invite other players with [PFLobbySendInvite](playfabmultiplayerreference-cpp/pflobby/functions/pflobbysendinvite.md).

```cpp
    // Retrieved elsewhere from SDK's PFMultiplayerInitialize API
    PFMultiplayerHandle apiHandle = g_pfmHandle;

    // Retrieved elsewhere from one of PlayFab's title_player_account login APIs
    const PFEntityKey* clientOwner = m_localPlayerTitlePlayerAccounts[0];

    // Initialize the lobby configuration
    const char* gameModePropertyKey = "GameMode";
    const char* gameModePropertyValue = "GameMode_Foo";

    PFLobbyCreateConfiguration lobbyConfiguration{};
    lobbyConfiguration.maxMemberCount = 16;
    lobbyConfiguration.ownerMigrationPolicy = PFLobbyOwnerMigrationPolicy::Automatic;
    lobbyConfiguration.accessPolicy = PFLobbyAccessPolicy::Private;
    lobbyConfiguration.lobbyPropertyCount = 1;
    lobbyConfiguration.lobbyPropertyKeys = &gameModePropertyKey;
    lobbyConfiguration.lobbyPropertyValues = &gameModePropertyValue;
    
    // Initialize the creator's member properties
    const char* playerColorPropertyKey = "PlayerColor";
    const char* playerColorPropertyValue = "Red";

    PFLobbyJoinConfiguration creatorMemberConfiguration{};
    creatorMemberConfiguration.memberPropertyCount = 1;
    creatorMemberConfiguration.memberPropertyKeys = &playerColorPropertyKey;
    creatorMemberConfiguration.memberPropertyValues = &playerColorPropertyValue;

    // Create a lobby using our first player
    PFLobbyHandle lobby;
    HRESULT error = PFMultiplayerCreateAndJoinLobby(
        apiHandle,
        clientOwner,
        &lobbyConfiguration,
        &creatorMemberConfiguration,
        nullptr,
        &lobby);
```

When the call to create a lobby completes, a [PFLobbyCreateAndJoinLobbyCompletedStateChange](playfabmultiplayerreference-cpp/pflobby/structs/pflobbycreateandjoinlobbycompletedstatechange.md) will be provided by [PFMultiplayerStartProcessingLobbyStateChanges](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerstartprocessinglobbystatechanges.md).

## Example creating a server-owned lobby using the Lobby and Matchmaking SDK

This example is similar to the [client-owned lobby example](#example-creating-a-client-owned-lobby-using-the-lobby-and-matchmaking-sdk) except that it creates the lobby as a [game_server](../../data/entities/available-built-in-entity-types.md) entity and [PFMultiplayerCreateAndClaimServerLobby](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayercreateandclaimserverlobby.md) is called in place of [PFMultiplayerCreateAndJoinLobby](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayercreateandjoinlobby.md).

```cpp
    // Retrieved elsewhere from SDK's PFMultiplayerInitialize API
    PFMultiplayerHandle apiHandle = g_pfmHandle;

    // Retrieved elsewhere from one of PlayFab's game_server login APIs
    const PFEntityKey* serverOwner = m_gameServerEntityKey;

    const char* gameModePropertyKey = "GameMode";
    const char* gameModePropertyValue = "GameMode_Foo";
    
    // Initialize the lobby configuration
    PFLobbyCreateConfiguration lobbyConfiguration{};
    lobbyConfiguration.maxMemberCount = 16;
    lobbyConfiguration.ownerMigrationPolicy = PFLobbyOwnerMigrationPolicy::Automatic;
    lobbyConfiguration.accessPolicy = PFLobbyAccessPolicy::Public;
    lobbyConfiguration.lobbyPropertyCount = 1;
    lobbyConfiguration.lobbyPropertyKeys = &gameModePropertyKey;
    lobbyConfiguration.lobbyPropertyValues = &gameModePropertyValue;
    
    // Create a lobby using our first player
    PFLobbyHandle lobby;
    HRESULT error = PFMultiplayerCreateAndClaimServerLobby(
        apiHandle,
        serverOwner,
        &lobbyConfiguration,
        nullptr,
        &lobby);
```

When the call to create a lobby completes, a [PFLobbyCreateAndClaimServerLobbyCompletedStateChange](playfabmultiplayerreference-cpp/pflobby/structs/pflobbycreateandclaimserverlobbycompletedstatechange.md) will be provided by [PFMultiplayerStartProcessingLobbyStateChanges](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerstartprocessinglobbystatechanges.md).

For more information on the differences between client-owned lobbies and server-owned lobbies, see [Game Servers and Lobbies](lobby-server-overview.md).

> [!NOTE]
> To enable the game server APIs in PlayFab Multiplayer, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h.
> For more information, see [Game Servers and Lobbies](lobby-server-overview.md)

## See also

* [Lobby SDK reference](playfabmultiplayerreference-cpp\pflobby\pflobby_members.md)
* [Create searchable lobbies](define-search-keywords.md)
* [Invite players to a lobby](lobby-invites.md)
* [Lobby properties](lobby-properties.md)
* [Lobby and matchmaking](lobby-and-matchmaking.md)
