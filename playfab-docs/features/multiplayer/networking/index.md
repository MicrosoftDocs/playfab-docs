---
title: Overview of PlayFab Party
author: v-thopra
description: Introduces the concepts and APIs for PlayFab networking.
ms.author: v-thopra
ms.date: 07/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking
ms.localizationpriority: medium
---

# PlayFab Party

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles, with SDKs available for Windows 10 PCs and Xbox One. Interoperable SDKs for iOS and Android will be available this summer. If you are interested in this feature, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

PlayFab Party is a set of libraries and services for easily adding multiplayer real-time networking and chat communication to your game.

Multiplayer games are typically one of two designs: authoritative and non-authoritative. Authoritative games have a central authority for game state, this may be a player device or [a cloud-hosted dedicated server](../servers/index.md). Non-authoritative designs require player devices to synchronize game state cooperatively over a peer-to-peer network.

Party is an ideal, secure, low-latency transport for non-authoritative designs and authoritative designs where a cloud-hosted dedicated server is not desired. Party is also well-suited to add voice and text communication to non-gameplay social experiences your app may provide (e.g. an in-game squad experience, or post-game lobbies).

Party utilizes Azure Speech Services to transcribe player voice chat and synthesize utterances for text message. This functionality has several uses, but was primarily designed as an accessibility aide. Typical usage of Party voice chat is billed on a per-minute basis, and up to 10% of those voice minutes can leverage transcription and synthesis for free. We recommend tying activation of this capability to an ease-of-access player setting.

Party can not only transcribe player chat, but also translate chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities can make for a more engaging multiplayer experience.

A goal of PlayFab Party and our other multiplayer services is to facilitate interoperable multiplayer infrastructure and cross-network gameplay. We encourage customers to ensure that their multiplayer experiences comply with relevant platform policies for multiplayer and cross-network player activity.

## Roadmap

| | March 2018 | August 2019 |
|-|-|-|
|Project Phase | Private Preview | Public Preview|
| SLA | Non-Production | Production |
| API | Breaking Changes | Stable |
|Platforms | Win 10, Win 7, Xbox One | Win 10, Win 7, Xbox One, iOS, Android |
|Pricing | Free | 30% Discount |

## Features

+ **Encryption and authentication.** Party authenticates player devices using their PlayFab player identity and encrypts data with a DTLS-like protocol.
+ **Device to device datagram networking.** At the core of Party are relays that are hosted globally across the Azure cloud. Player devices use these relays to create Party networks and send game data to one another.
+ **Voice and text chat.** Player devices can bind audio devices to Party networks to accomplish real-time voice chat. Text chat messages between players are also supported.
+ **Speech-to-text and voice synthesis.** Party can transcribe player voice chat and synthesize utterances for text message. This functionality has several uses, but was primarily designed as an accessibility aide. 
+ **Real-time translation.** Party can understand and synthesize real-time translations of player voice and text chat.

## Concepts

PlayFab Party is oriented around a few key concepts:

+ `Network` - A logical representation of a set of interconnected devices participating in a particular multiplayer experience, as well as basic state describing that collection.
+ `Endpoint` - A facility associated with a device that can receive data from other devices and is the source for sending data to other devices.
+ `Network_state_change` - A structure representing a notification to the local device regarding an asynchronous change in some aspect of the network.
+ `StartProcessingStateChanges` and `FinishProcessingStateChanges` - The pair of methods called by the app every UI frame to perform asynchronous operations, to retrieve results to be handled in the form of state_change structures, and then to free the associated resources when finished.

At a very high level, the game application uses the PlayFab Party library to configure a set of users signed-in on the local device to be moved into a PlayFab network. The app calls `StartProcessingStateChanges()` and `FinishProcessingStateChanges()` every UI frame. As app instances on remote devices add their users into a network, every participating instance is provided state_change updates describing the local and remote devices joining that  network. When a player stops participating in the  network (gracefully or due to network connectivity problems), state_change updates are provided to all app instances indicating the user and associated endpoints have  left.

As opposed to a client-server model, a PlayFab network is logically a fully-connected mesh of peer devices.

## Initialization

```cpp
void NetworkManager::Initialize()
{
    DEBUGLOG(L"NetworkManager::Initialize()\n");

    auto& Parties = PartiesManager::GetSingleton();

    // Initialize the communication fabric with our developer secret key
    PartiesError err = Parties.Initialize(c_PartiesDevKey);
    if (Parties_FAILED(err))
    {
        DEBUGLOG(L"Initialize failed: %hs\n", GetErrorMessage(err));
        return;
    }

    PartiesString entityId = Managers::Get<PlayFabManager>()->EntityId().c_str();

    // Create a local user object
    err = Parties.CreateLocalUser(
        entityId,                                   // User id
        entityId,                                   // User entity token
        &m_localUser                                // OUT local user object
        );

    if (Parties_FAILED(err))
    {
        DEBUGLOG(L"CreateLocalUser failed: %hs\n", GetErrorMessage(err));
        return;
    }

    PartiesLocalDevice* localDevice = nullptr;

    // Retrieve the local device
    err = Parties.GetLocalDevice(&localDevice);

    if (Parties_FAILED(err))
    {
        DEBUGLOG(L"GetLocalDevice failed: %hs\n", GetErrorMessage(err));
        return;
    }

    // Create a chat control for the local user on the local device
    err = localDevice->CreateChatControl(
        m_localUser,                                // Local user object
        "en-us",                                    // Language id
        nullptr,                                    // Async identifier
        &m_localChatControl                         // OUT local chat control
        );

    if (Parties_FAILED(err))
    {
        DEBUGLOG(L"CreateChatControl failed: %hs\n", GetErrorMessage(err));
        return;
    }

    // Use automatic settings for the audio input device
    err = m_localChatControl->SetAudioInput(
        PartiesAudioDeviceSelectionType::Automatic,    // Selection type
        nullptr,                                    // Device id
        nullptr                                     // Async identifier
        );

    if (Parties_FAILED(err))
    {
        DEBUGLOG(L"SetAudioInput failed: %hs\n", GetErrorMessage(err));
        return;
    }

    // Use automatic settings for the audio output device
    err = m_localChatControl->SetAudioOutput(
        PartiesAudioDeviceSelectionType::Automatic,    // Selection type
        nullptr,                                    // Device id
        nullptr                                     // Async identifier
        );

    if (Parties_FAILED(err))
    {
        DEBUGLOG(L"SetAudioOutput failed: %hs\n", GetErrorMessage(err));
    }

    // Enable transcriptions always for sample purposes
    err = m_localChatControl->SetTranscriptionRequested(
        true,                                       // Turn on speech-to-text transcription
        nullptr                                     // Async identifier
        );

    if (Parties_FAILED(err))
    {
        DEBUGLOG(L"SetTranscriptionRequested failed: %hs\n", GetErrorMessage(err));
    }
}

void NetworkManager::CreateAndConnectToNetwork(std::vector<std::string>& playerIds, std::function<void(std::string)> callback)
{
    DEBUGLOG(L"NetworkManager::CreateAndConnectToNetwork()\n");

    PartiesNetworkConfiguration cfg = {};

    // Setup the network to allow 8 single-device players of any device type
    cfg.allowedDeviceTypeCount = 0;
    cfg.allowedDeviceTypes = nullptr;
    cfg.maxDeviceCount = 8;
    cfg.maxDevicesPerUserCount = 1;
    cfg.maxEndpointsPerDeviceCount = 1;
    cfg.maxUserCount = 8;
    cfg.maxUsersPerDeviceCount = 1;

    PartiesString uid = nullptr;
    PartiesError err = m_localUser->GetUserIdentifier(&uid);

    if (Parties_FAILED(err))
    {
        DEBUGLOG(L"GetUserIdentifier failed: %hs\n", GetErrorMessage(err));
        return;
    }

    // Force the region for Wave 1
    // TODO: revisit
    PartiesRegion regionList[] = {
        {
            "WestUS", // region name
            0         // round trip latency
        },
    };

    std::vector<PartiesString> additionalIds;

    DEBUGLOG(L"Additional user ids: \n");
    for (const auto& id : playerIds)
    {
        additionalIds.push_back(id.c_str());
        DEBUGLOG(L"\t%hs\n", id.c_str());
    }

    PartiesNetworkDescriptor networkDescriptor = {};

    // Create a new network descriptor
    PartiesManager::GetSingleton().CreateNewNetwork(
        c_PartiesBuildId,                              // BuildId
        m_localUser,                                // Local User
        &cfg,                                       // Network Config
        1,                                          // Region List Count
        regionList,                                 // Region List
        static_cast<uint32_t>(additionalIds.size()),// Additional UserId Count
        additionalIds.data(),                       // Additional UserId List
        nullptr,                                    // Async Identifier
        &networkDescriptor                          // OUT network descriptor
        );

    if (Parties_FAILED(err))
    {
        DEBUGLOG(L"CreateNewNetwork failed: %hs\n", GetErrorMessage(err));
        return;
    }

    // Connect to the new network
    if (InternalConnectToNetwork(networkDescriptor))
    {
        m_state = NetworkManagerState::WaitingForNetwork;
        m_onnetworkcreated = callback;
    }
}
```
