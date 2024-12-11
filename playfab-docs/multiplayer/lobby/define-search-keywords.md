---
title: Create searchable lobbies
author: joannaleecy
description: Learn how to create searchable lobbies.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, types
ms.localizationpriority: medium
---

# Create searchable lobbies

This article explains how to create lobbies that are searchable. 

To make a lobby searchable, its access policy must either be __Public__ or __Friends__. Lobbies with a __Private__ access policy will not be joinable from search queries and must be joined via [invites](lobby-invites.md). It's common to configure this access policy when initially creating the lobby.

Once a lobby's access policy is set correctly, other players can search for it using [Find lobbies](find-lobbies.md).

Additionally, the owner of the lobby may define custom search properties which other players can use when searching for lobbies to find more specific results.

To learn more, see [Find lobbies](find-lobbies.md) and [Join lobbies](join-lobbies.md).

## Example setting search properties using Lobby and Matchmaking SDK

In this example, the lobby created has the following custom search properties defined.

* Game mode = "DeathMatch"
* Competition style = "Ranked"
* Skill level = Skill level of the person who created the lobby

```cpp
static PFMultiplayerHandle g_pfmHandle; // initialized elsewhere

#define PFLOBBY_SEARCH_KEY_GAME_MODE "string_key1"
#define PFLOBBY_SEARCH_KEY_COMPETITION_STYLE "string_key2"
#define PFLOBBY_SEARCH_KEY_SKILL "number_key1"

#define GAME_MODE_DEATH_MATCH "DeathMatch"
#define COMPETITION_STYLE_RANKED "Ranked"

PFEntityKey m_localUser;
namespace MyGame {
    uint32_t GetPlayerSkill(); // defined elsewhere
}

void CreateLobbyWithSearchProperties()
{
    // Initialize the lobby configuration with search properties
    std::string playerSkill = std::to_string(MyGame::GetPlayerSkill());

    const char* searchPropertyKeys[] = {
        PFLOBBY_SEARCH_KEY_GAME_MODE,
        PFLOBBY_SEARCH_KEY_COMPETITION_STYLE,
        PFLOBBY_SEARCH_KEY_SKILL,
    };

    const char* searchPropertyValues[_countof(searchPropertyKeys)] = {
        GAME_MODE_DEATH_MATCH,
        COMPETITION_STYLE_RANKED,
        playerSkill.c_str(),
    };

    PFLobbyCreateConfiguration lobbyConfiguration{};
    lobbyConfiguration.maxMemberCount = 16;
    lobbyConfiguration.searchPropertyCount = _countof(searchPropertyKeys);
    lobbyConfiguration.searchPropertyKeys = searchPropertyKeys;
    lobbyConfiguration.searchPropertyValues = searchPropertyValues;

    // Initialize an empty join configuration. This can be optionally initialized with the creator's member properties 
    PFLobbyJoinConfiguration creatorMemberConfiguration{};
    creatorMemberConfiguration.memberPropertyCount = 0;

    // Create and join the lobby
    PFLobbyHandle lobby;
    HRESULT hr = PFMultiplayerCreateAndJoinLobby(
        g_pfmHandle,
        &m_localUser,
        &lobbyConfiguration,
        &creatorMemberConfiguration,
        nullptr,
        &lobby);
}
```

## See also

* [Find lobbies](find-lobbies.md)
* [Lobby properties](lobby-properties.md)
* [Owner requirements and privileges](owner-requirements-and-privileges.md)
* [Create a lobby](create-a-lobby.md)