---
title: Integrate Party with Lobby using Multiplayer SDK
author: raymondchaMS
description: Guide to help you integrate PlayFab Party SDK with PlayFab Multiplayer SDK.
ms.author: raymondcha
ms.date: 10/09/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, party, lobby, networking, communication
ms.localizationpriority: medium
---

# Integrate Party with Lobby

PlayFab Lobby and PlayFab Party are often used together to create and orchestrate groups of players before getting them into a networked session. This article describes how to use Lobbies as a convenient mechanism for sharing Party network descriptors by using the C++ Party library with the C++ Multiplayer library. 

## Set up Party and Multiplayer SDK

Refer the Party and Lobby quickstarts to get started.

### Party
[Party Quickstart](quickstart.md)

### Lobby
[Lobby Quickstart](../lobby/lobby-getting-started.md)

### Initialize the PlayFab Multiplayer SDK

Please refer [Lobby Quickstart](../lobby/lobby-getting-started.md#initialize-the-playfab-multiplayer-sdk) to initialize PlayFab Multiplayer SDK.

### Create a lobby with a Serialized Network Descriptor string

Create a lobby and set the party network descriptor setting the party network descriptor in text form in the lobby properties. To convert Party network descriptor to char string, use [PartyManager::SerializeNetworkDescriptor()](reference/classes/PartyManager/methods/partymanager_serializenetworkdescriptor.md).

The defines below are the Lobby properties and the keys and values used to search.
```cpp
const char* c_propertyKey_LobbyName{ "LobbyName" };
const char* c_propertyKey_PartyDescriptor{ "PartyDescriptor" };

const char* c_searchKey_LobbyGroup{ "string_key1" };    // For Key to identify lobby group
const char* c_searchValue_LobbyGroup{ "PartySample" };  // Use a identifiable string for search lobby group

// The reason for setting this value is to get the lobby name only from the search results, 
// and in practice, change it appropriately for the your game.
const char* c_searchKey_LobbyName{ "string_key2" };
```

1. Call [PFMultiplayerCreateAndJoinLobby](../lobby/playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayercreateandjoinlobby.md)
2. Check for asynchronous completion by periodically polling [PFMultiplayerStartProcessingLobbyStateChanges](../lobby/playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerstartprocessinglobbystatechanges.md) for a [PFLobbyCreateAndJoinLobbyCompletedStateChange](../lobby/playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerstartprocessinglobbystatechanges.md).

```cpp
char descriptor[c_maxSerializedNetworkDescriptorStringLength + 1] = {};
// Serialize our local network descriptor for other peers to use
PartyError err = PartyManager::SerializeNetworkDescriptor(&networkDescriptor, descriptor);
if (PARTY_FAILED(err))
{
    // handle immediate create failure
    DEBUGLOG("SerializeNetworkDescriptor failed! %s\n", GetErrorMessage(err));
    return false;
}

std::vector<const char*> lobbyPropertyKeys;
std::vector<const char*> lobbyPropertyValues;
lobbyPropertyKeys.push_back(c_propertyKey_LobbyName);
lobbyPropertyValues.push_back(lobbyName);
lobbyPropertyKeys.push_back(c_propertyKey_PartyDescriptor);
lobbyPropertyValues.push_back(descriptor);

std::vector<const char*> searchPropertyKeys;
std::vector<const char*> searchPropertyValues;
searchPropertyKeys.push_back(c_searchKey_LobbyGroup);
searchPropertyValues.push_back(c_searchValue_LobbyGroup);
searchPropertyKeys.push_back(c_searchKey_LobbyName);
searchPropertyValues.push_back(lobbyName);

PFLobbyCreateConfiguration lobbyConfiguration{};
lobbyConfiguration.maxMemberCount = 16;
lobbyConfiguration.ownerMigrationPolicy = PFLobbyOwnerMigrationPolicy::Automatic;
lobbyConfiguration.accessPolicy = PFLobbyAccessPolicy::Public;
lobbyConfiguration.lobbyPropertyCount = static_cast<uint32_t>(lobbyPropertyKeys.size());
lobbyConfiguration.lobbyPropertyKeys = lobbyPropertyKeys.data();
lobbyConfiguration.lobbyPropertyValues = lobbyPropertyValues.data();
lobbyConfiguration.searchPropertyCount = static_cast<uint32_t>(searchPropertyKeys.size());
lobbyConfiguration.searchPropertyKeys = searchPropertyKeys.data();
lobbyConfiguration.searchPropertyValues = searchPropertyValues.data();

PFLobbyJoinConfiguration memberConfiguration{};

PFLobbyHandle lobby;
HRESULT hr = PFMultiplayerCreateAndJoinLobby(m_pfmHandle, &userEntity, &lobbyConfiguration, &memberConfiguration, nullptr, &lobby);
if (FAILED(hr))
{
    // handle immediate create failure
    DEBUGLOG("PFMultiplayerCreateAndJoinLobby failed! %s\n", PFMultiplayerGetErrorMessage(hr));
    return false;
}

// NOTE: to simplify this quickstart, we'll synchronously block waiting waiting for the CreateAndJoinLobby operation
// to finish. In a real implementation, this polling would be done asynchronously on a background thread/worker.
bool createAndJoinLobbyFinished = false;
while (!createAndJoinLobbyFinished)
{
    uint32_t lobbyStateChangeCount;
    const PFLobbyStateChange* const* lobbyStateChanges;
    HRESULT hr = PFMultiplayerStartProcessingLobbyStateChanges(m_pfmHandle, &lobbyStateChangeCount, &lobbyStateChanges);
    if (FAILED(hr))
    {
        // handle the failure
        DEBUGLOG("PFMultiplayerStartProcessingLobbyStateChanges failed! %s\n", PFMultiplayerGetErrorMessage(hr));
        return false;
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
                DEBUGLOG("Lobby 0x%p successfully created!\n", createAndJoinStateChange->lobby);
            }
            createAndJoinLobbyFinished = true;
            break;
        }
        }
    }

    hr = PFMultiplayerFinishProcessingLobbyStateChanges(m_pfmHandle, lobbyStateChangeCount, lobbyStateChanges);
    if (FAILED(hr))
    {
        DEBUGLOG("PFMultiplayerFinishProcessingLobbyStateChanges failed! %s\n", PFMultiplayerGetErrorMessage(hr));
        return false;
    }
}
```

### Find lobbies
For details of how to use Find lobbies, use the following link [Find lobbies](../lobby/find-lobbies.md)

Now you can use the Find Lobbies API to search for the lobby which is created above using the `c_searchValue_LobbyType` to obtain the serialized network descriptor.

1. Call [PFMultiplayerFindLobbies](../lobby/playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerfindlobbies.md)

```cpp
std::string filterString;
filterString.append(c_searchKey_LobbyGroup);
filterString.append(" eq '");
filterString.append(c_searchValue_LobbyGroup);
filterString.append("'");

PFLobbySearchConfiguration searchConfiguration = { 0 };
searchConfiguration.filterString = filterString.c_str();

HRESULT hr = PFMultiplayerFindLobbies(m_pfmHandle, &localUser, &searchConfiguration, nullptr);
if (FAILED(hr))
{
    // handle immediate find lobbies failure
    printf("PFMultiplayerFindLobbies failed! %s\n", PFMultiplayerGetErrorMessage(hr));
    return false;
}

// NOTE: to simplify this quickstart, we'll synchronously block waiting waiting for the FindLobbies operation
// to finish. In a real implementation, this polling would be done asynchronously on a background thread/worker.
bool findLobbiesFinished = false;
while (!findLobbiesFinished)
{
    uint32_t lobbyStateChangeCount;
    const PFLobbyStateChange* const* lobbyStateChanges;
    HRESULT hr = PFMultiplayerStartProcessingLobbyStateChanges(m_pfmHandle, &lobbyStateChangeCount, &lobbyStateChanges);
    if (FAILED(hr))
    {
        // handle the failure
        printf("PFMultiplayerStartProcessingLobbyStateChanges failed! %s\n", PFMultiplayerGetErrorMessage(hr));
        return false;
    }

    for (uint32_t i = 0; i < lobbyStateChangeCount; ++i)
    {
        const PFLobbyStateChange* stateChange = lobbyStateChanges[i];
        switch (stateChange->stateChangeType)
        {
            case PFLobbyStateChangeType::FindLobbiesCompleted:
            {
                auto findLobbiesStateChange =
                    static_cast<const PFLobbyFindLobbiesCompletedStateChange*>(stateChange);

                if (FAILED(findLobbiesStateChange->result))
                {
                    printf("PFLobbyStateChangeType::FindLobbiesCompleted failed! %s\n", PFMultiplayerGetErrorMessage(findLobbiesStateChange->result));
                    break;
                }

                for (uint32_t i = 0; i < findLobbiesStateChange->searchResultCount; ++i)
                {
                    const PFLobbySearchResult& searchResult = findLobbiesStateChange->searchResults[i];

                    // Use searchResult.connectionString for connecting a lobby later.
                    MyGame::GuiPostLobbySearchResultRow(searchResult); // defined elsewhere
                }
                findLobbiesFinished = true;
                break;
            }
        }
    }

    hr = PFMultiplayerFinishProcessingLobbyStateChanges(m_pfmHandle, lobbyStateChangeCount, lobbyStateChanges);
    if (FAILED(hr))
    {
        printf("PFMultiplayerFinishProcessingLobbyStateChanges failed! %s\n", PFMultiplayerGetErrorMessage(hr));
        return false;
    }
```

### Join a lobby

Now join the lobby which is obtained from the previous "Find Lobbies" operation by using the connectionString which is part of PFLobbySearchResult.

1. Call [PFMultiplayerJoinLobby](../lobby/playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerjoinlobby.md)

```cpp
// Fill in the member properties of user for referencing in the game.
const char* playerColorPropertyKey = "PlayerColor";
const char* playerColorPropertyValue = MyGame::GetPlayerColorString(localUser);
std::vector<const char*> memberPropertyKeys;
std::vector<const char*> memberPropertyValues;
memberPropertyKeys.push_back(playerColorPropertyKey);
memberPropertyValues.push_back(playerColorPropertyValue);

PFLobbyJoinConfiguration joinConfig;
joinConfig.memberPropertyCount = static_cast<uint32_t>(memberPropertyKeys.size());
joinConfig.memberPropertyKeys = memberPropertyKeys.data();
joinConfig.memberPropertyValues = memberPropertyValues.data();

// Join the lobby using the connection string
HRESULT hr = PFMultiplayerJoinLobby(m_pfmHandle, &localUser, connectionString, &joinConfig, nullptr, &m_lobby);
if (FAILED(hr))
{
    // handle immediate join lobby failure
    DEBUGLOG("PFMultiplayerJoinLobby failed! %s\n", PFMultiplayerGetErrorMessage(hr));
    return false;
}

// NOTE: to simplify this quickstart, we'll synchronously block waiting waiting for the JoinLobby operation
// to finish. In a real implementation, this polling would be done asynchronously on a background thread/worker.
bool joinLobbyFinished = false;
while (!joinLobbyFinished)
{
    uint32_t lobbyStateChangeCount;
    const PFLobbyStateChange* const* lobbyStateChanges;
    HRESULT hr = PFMultiplayerStartProcessingLobbyStateChanges(m_pfmHandle, &lobbyStateChangeCount, &lobbyStateChanges);
    if (FAILED(hr))
    {
        // handle the failure
        DEBUGLOG("PFMultiplayerStartProcessingLobbyStateChanges failed! %s\n", PFMultiplayerGetErrorMessage(hr));
        return false;
    }

    for (uint32_t i = 0; i < lobbyStateChangeCount; ++i)
    {
        const PFLobbyStateChange* stateChange = lobbyStateChanges[i];
        switch (stateChange->stateChangeType)
        {
        case PFLobbyStateChangeType::JoinLobbyCompleted:
        {
            auto joinStateChange =
                static_cast<const PFLobbyJoinLobbyCompletedStateChange*>(stateChange);

            if (SUCCEEDED(joinStateChange->result))
            {
                // lobby successfully joined!
                m_lobby = joinStateChange->lobby;

                uint32_t propertyCount;
                const char* const* keys;
                HRESULT hr = PFLobbyGetLobbyPropertyKeys(joinStateChange->lobby, &propertyCount, &keys);
                if (SUCCEEDED(hr))
                {
                    std::string descriptor;
                    for (uint32_t idx = 0; idx < propertyCount; idx++)
                    {
                        const char* value;
                        hr = PFLobbyGetLobbyProperty(joinStateChange->lobby, keys[idx], &value);
                        if (SUCCEEDED(hr))
                        {
                            if (strcmp(keys[idx], c_propertyKey_PartyDescriptor) == 0 && value)
                            {
                                descriptor = value;
                            }
                        }
                    }
                    if (!descriptor.empty())
                    {
                        partyDescriptor = descriptor;
                    }
                    else
                    {
                        // report asynchronous failure
                        DEBUGLOG("Failed to join lobby 0x%p! No Party descriptor found\n",
                            joinStateChange->lobby);
                    }
                }
            }
            joinLobbyFinished = true;
            break;
        }
        }
    }

    hr = PFMultiplayerFinishProcessingLobbyStateChanges(m_pfmHandle, lobbyStateChangeCount, lobbyStateChanges);
    if (FAILED(hr))
    {
        DEBUGLOG("PFMultiplayerFinishProcessingLobbyStateChanges failed! %s\n", PFMultiplayerGetErrorMessage(hr));
        return false;
    }
}
```

## Next Steps

Read more about [Party Quickstart: Connect to a Party network](quickstart.md#connect-to-a-party-network) to connect Party network. 

## See also
### Party SDK
* [Party features](party-features.md)
* [Party SDKs](party-sdks.md)
* [Multiplayer Services](../mpintro.md)
* [Party objects and their relationships](concepts-objects.md)
* [Party API reference documentation](reference/party_members.md)
### Multiplayer SDK
* [Multiplayer SDK reference](../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
* [Multiplayer SDKs](../lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks.md)
* [Create a Lobby](../lobby/create-a-lobby.md)
* [Asynchronous operations and notifications](../lobby/lobby-and-matchmaking-client-sdk-async.md)
* [Create searchable lobbies](../lobby/define-search-keywords.md)
* [Lobby properties](../lobby/lobby-properties.md)
