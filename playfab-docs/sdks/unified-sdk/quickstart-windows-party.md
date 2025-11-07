---
title: Quickstart (Windows) - Party and Multiplayer
author: Jeffrey-Shi
description: Learn how to integrate PlayFab Party networking and Multiplayer lobby services using the unified SDK.
ms.author: jeffshi
ms.date: 09/25/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, party, multiplayer, lobby, networking
ms.localizationpriority: medium
---

# Quickstart (Windows) - Party and Multiplayer

This guide shows you how to integrate PlayFab Party for voice, chat, and data networking, along with PlayFab Multiplayer for lobby and matchmaking services using the unified SDK.

## Prerequisites

Before you begin, ensure you have:
- Completed the [core SDK setup and authentication](quickstart-core.md)
- An authenticated `PFEntityHandle` from the login process
- Your PlayFab Title ID configured in Game Manager
- Basic familiarity with asynchronous programming patterns

> [!NOTE]
> This guide assumes you've already initialized the PlayFab SDK and authenticated a player following the [core quickstart guide](quickstart-core.md). If you haven't done so, please complete that guide first.

## What you'll accomplish

By the end of this quickstart, you'll have:
- Initialized PlayFab Party for networking and chat
- Created a local user and chat control
- Set up a Party network for communication
- Initialized PlayFab Multiplayer and created a lobby
- Understood cleanup procedures for Party and Multiplayer resources

## Headers and includes

### Required headers

Include SDK headers in your header files to access PlayFab Party and Multiplayer functionality:

```cpp
#include <Party.h>
#include <Party_c.h>

#include <PFMultiplayer.h>
#include <PFLobby.h>

#include <playfab/services/PFServices.h>
```

### Implementation files

Include **PartyImpl.h** in your implementation files and use the Party namespace:

```cpp
#include <PartyImpl.h>

using namespace Party;
```

## Step 1: Initialize PlayFab Party

Initialize PlayFab Party by creating a singleton reference to the `PartyManager` and configuring it with your title ID and optional task queues for advanced thread control.

```cpp
PartyManager& partyManager = PartyManager::GetSingleton();
PartyInitializationConfiguration partyInitConfig = {};
PartyError err;

partyInitConfig.titleId = (PartyString) m_titleId; // Your PlayFab Title ID
partyInitConfig.audioTaskQueue = nullptr; // Optional: Custom XTaskQueue for audio operations, or nullptr for default
partyInitConfig.networkingTaskQueue = nullptr; // Optional: Custom XTaskQueue for networking operations, or nullptr for default

err = partyManager.Initialize(&partyInitConfig);
if (PARTY_FAILED(err))
{
    std::wcerr << L"Failed to initialize PartyManager: 0x" << std::hex << err << std::endl;
    return err;
}

std::wcout << L"PartyManager initialized successfully" << std::endl;
```

> [!TIP]
> The `audioTaskQueue` and `networkingTaskQueue` parameters allow you to provide custom XTaskQueue instances for fine-grained control over threading. Set them to `nullptr` to use default threading behavior.

## Step 2: Create a local user

Create a local user object to represent the authenticated player on the device. This user is required for all networking and chat operations.

```cpp
PartyLocalUser* localUser{};
PartyError userErr;

// Use the entityHandle obtained from authentication
userErr = partyManager.CreateLocalUser(entityHandle, &localUser);
if (PARTY_FAILED(userErr))
{
    std::wcerr << L"Failed to create local user: 0x" << std::hex << userErr << std::endl;
    return userErr;
}

std::wcout << L"Local user created successfully" << std::endl;
```

## Step 3: Create a chat control

Create a chat control to manage voice and text chat operations for the user on this device.

```cpp
PartyLocalDevice* localDevice;
PartyError deviceErr = partyManager.GetLocalDevice(&localDevice);
if (PARTY_FAILED(deviceErr))
{
    std::wcerr << L"Failed to get local device: 0x" << std::hex << deviceErr << std::endl;
    return deviceErr;
}

PartyLocalChatControl* chatControl;
PartyError chatErr = localDevice->CreateChatControl(localUser, nullptr, nullptr, &chatControl);
if (PARTY_FAILED(chatErr))
{
    std::wcerr << L"Failed to create chat control: 0x" << std::hex << chatErr << std::endl;
    return chatErr;
}

std::wcout << L"Chat control created successfully" << std::endl;
```

The chat control handles audio input/output and enables voice communication features.

## Step 4: Create a Party network

Create a Party network—a secured collection of devices and users that can exchange chat and data. A Party network typically aligns with your game's multiplayer session or lobby concept.

```cpp
PartyNetworkDescriptor networkDescriptor = {};
PartyNetworkConfiguration networkConfiguration = {};

// Configure network limits
networkConfiguration.directPeerConnectivityOptions = PartyDirectPeerConnectivityOptions::None;
networkConfiguration.maxDeviceCount = 8;
networkConfiguration.maxDevicesPerUserCount = 1;
networkConfiguration.maxEndpointsPerDeviceCount = 1;
networkConfiguration.maxUserCount = 8;
networkConfiguration.maxUsersPerDeviceCount = 1;

// Configure invitation settings
PartyInvitationConfiguration invitationConfiguration = {
    "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX", // Unique network identifier (generate a GUID)
    PartyInvitationRevocability::Anyone,
    0,
    nullptr
};

PartyError networkErr = partyManager.CreateNewNetwork(
    localUser,
    &networkConfiguration,
    0,
    nullptr,
    &invitationConfiguration,
    nullptr,
    &networkDescriptor,
    nullptr);

if (PARTY_FAILED(networkErr))
{
    std::wcerr << L"Failed to create Party network: 0x" << std::hex << networkErr << std::endl;
    return networkErr;
}

std::wcout << L"Party network created successfully" << std::endl;
```

> [!IMPORTANT]
> Ensure you provide a valid, unique network identifier (GUID) in the `PartyInvitationConfiguration`. This ID is used by other players to join your network.

🎉 **Congratulations!** You've successfully set up PlayFab Party networking and chat.

## Step 5: Initialize PlayFab Multiplayer

Initialize the PlayFab Multiplayer service to enable lobby and matchmaking functionality.

```cpp
PFMultiplayerHandle pfmHandle{};
MultiplayerInitializationConfiguration multiplayerInitConfig{};

multiplayerInitConfig.titleId = m_titleId; // Your PlayFab Title ID

HRESULT hr = PFMultiplayerInitialize(&multiplayerInitConfig, &pfmHandle);
if (FAILED(hr))
{
    std::wcerr << L"Failed to initialize Multiplayer: 0x" << std::hex << hr << std::endl;
    return hr;
}

std::wcout << L"PlayFab Multiplayer initialized successfully" << std::endl;
```

## Step 6: Create a lobby

Create a lobby to manage player groups before starting a match. Lobbies support features like owner migration and access control.

```cpp
PFLobbyCreateConfiguration lobbyConfiguration{};
lobbyConfiguration.maxMemberCount = 8;
lobbyConfiguration.ownerMigrationPolicy = PFLobbyOwnerMigrationPolicy::Automatic;
lobbyConfiguration.accessPolicy = PFLobbyAccessPolicy::Private;

PFLobbyJoinConfiguration memberConfiguration{};

PFLobbyHandle lobby;
HRESULT hr = PFMultiplayerCreateAndJoinLobbyWithEntityHandle(
    pfmHandle,
    entityHandle,
    &lobbyConfiguration,
    &memberConfiguration,
    nullptr,
    &lobby);

if (FAILED(hr))
{
    std::wcerr << L"Failed to create and join lobby: 0x" << std::hex << hr << std::endl;
    return hr;
}

std::wcout << L"Lobby created and joined successfully" << std::endl;
```

🎉 **Excellent!** You've now set up both Party networking and Multiplayer lobby services.

## Cleanup resources

When your game shuts down or you need to clean up PlayFab resources, ensure proper cleanup in the correct order:

```cpp
// Clean up Party singleton
partyManager.Cleanup();

// Clean up Multiplayer handle
PFMultiplayerUninitialize(pfmHandle);

// Close entity handle
PFEntityCloseHandle(entityHandle);
entityHandle = nullptr;

// Close service config handle
PFServiceConfigCloseHandle(serviceConfigHandle);
serviceConfigHandle = nullptr;

// Uninitialize PlayFab Services
XAsyncBlock asyncBlock{};
HRESULT hr = PFServicesUninitializeAsync(&asyncBlock);
if (SUCCEEDED(hr))
{
    hr = XAsyncGetStatus(&asyncBlock, true); // Blocking wait for cleanup completion
}
```

> [!IMPORTANT]
> Always clean up resources in this order: Party, Multiplayer, Entity handles, Service config, then PlayFab Services.

## Next steps

Now that you've set up Party and Multiplayer, explore these additional features:

### Party networking features
- **Voice chat** - Enable real-time voice communication with Azure Cognitive Services integration
- **Text chat** - Implement text messaging with translation and moderation
- **Data channels** - Send custom game data between players
- **Network management** - Handle player connections, disconnections, and network events

### Multiplayer lobby features
- **Matchmaking integration** - Connect lobbies with PlayFab matchmaking
- **Lobby properties** - Store and sync game settings and metadata
- **Member data** - Share player-specific information within the lobby
- **Search and discovery** - Find and join public lobbies

### Core concepts
- [Asynchronous operations](async-model.md) - Understanding PlayFab's async programming model
- [Memory management](memory-management.md) - Best practices for managing SDK memory
- [Tracing and diagnostics](debug-trace.md) - Debugging and monitoring your integration

## Reference documentation

- [PlayFab Party SDK Documentation](../../multiplayer/networking/party-sdks.md)
- [PlayFab Multiplayer SDK Documentation](../../multiplayer/lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks.md)