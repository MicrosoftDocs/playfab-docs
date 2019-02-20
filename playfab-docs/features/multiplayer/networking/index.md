---
title: Overview of PlayFab Parties
author: v-thopra
description: Introduces the concepts and APIs for PlayFab networking.
ms.author: v-thopra
ms.date: 07/12/2018
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, networking
ms.localizationpriority: medium
---

# PlayFab Parties

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

PlayFab Parties is a set of libraries and services for easily adding multiplayer real-time networking and chat communication to your game.

Multiplayer games are typically one of two designs: authoritative and non-authoritative. Authoritative games have a central authority for game state, this may be a player device or [a cloud-hosted dedicated server](https://aka.ms/PlayFabCompute). Non-authoritative designs require player devices to synchronize game state cooperatively over a peer-to-peer network.

Parties are an ideal, secure, low-latency transport for non-authoritative designs and authoritative designs where a cloud-hosted dedicated server is not desired. Parties is also well-suited to add voice and text communication to non-gameplay social experiences your app may provide (e.g. an in-game squad experience, or post-game lobbies).

Parties utilizes Azure Cognitive Services to transcribe player voice chat and synthesize utterances for text message. This functionality has several uses, but was primarily designed as an accessibility aide. Typical usage of COFA voice chat is billed on a per-minute basis, and up to 10% of those voice minutes can leverage transcription and synthesis for free. We recommend tying activation of this capability to an ease-of-access player setting.

Parties can not only transcribe player chat, but also translate chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities can make for a more engaging multiplayer experience. 

## Features

+ **Encryption and authentication.** COFA authenticates player devices using their PlayFab player identity and encrypts data with a DTLS-like protocol.
+ **NAT traversal and datagrams.** The core of COFA are relays hosted globally across the Azure cloud. Player devices use these relays create COFA networks and game data to one another.
+ **Voice and text chat.** Player devices can bind audio devices to COFA networks to accomplish real-time voice chat. Text chat messages between players are also support.
+ **Speech-to-text and voice synthesis.** COFA can transcribe player voice chat and synthesize utterances for text message. This functionality has several uses, but was primarily designed as an accessibility aide. 
+ **Real-time translation.** COFA can understand and synthesize real-time translations of player voice and text chat.

## Concepts

COFA is oriented around a few key concepts:

- `Network` - A logical representation of a set of interconnected devices participating in a particular multiplayer experience, as well as basic state describing that collection. 
- `Endpoint` - A facility associated with a device that can recieve data from other devices and is the source for sending data to other devices.
- `Network_state_change` - A structure representing a notification to the local device regarding an asynchronous change in some aspect of the network.
- `StartProcessingStateChanges` and `FinishProcessingStateChanges` - The pair of methods called by the app every UI frame to perform asynchronous operations, to retrieve results to be handled in the form of state_change structures, and then to free the associated resources when finished.

At a very high level, the game application uses the PlayFab COFA library to configure a set of users signed-in on the local device to be moved into a PlayFab network. The app calls `StartProcessingStateChanges()` and `FinishProcessingStateChanges()` every UI frame. As app instances on remote devices add their users into a network, every participating instance is provided state_change updates describing the local and remote devices joining that  network. When a player stops participating in the  network (gracefully or due to network connectivity problems), state_change updates are provided to all app instances indicating the user and associated endpoints have  left.

As opposed to a client-server model, a PlayFab network is logically a fully-connected mesh of peer devices. 

## Initialization

```cpp
void NetworkManager::Initialize()
{
    DEBUGLOG(L"NetworkManager::Initialize()\n");

    auto& cofa = CofaManager::GetSingleton();

    // Initialize the communication fabric with our developer secret key
    CofaError err = cofa.Initialize(c_cofaDevKey);
    if (COFA_FAILED(err))
    {
        DEBUGLOG(L"Initialize failed: %hs\n", GetErrorMessage(err));
        return;
    }

    CofaString entityId = Managers::Get<PlayFabManager>()->EntityId().c_str();

    // Create a local user object
    err = cofa.CreateLocalUser(
        entityId,                                   // User id
        entityId,                                   // User entity token
        &m_localUser                                // OUT local user object
        );

    if (COFA_FAILED(err))
    {
        DEBUGLOG(L"CreateLocalUser failed: %hs\n", GetErrorMessage(err));
        return;
    }

    CofaLocalDevice* localDevice = nullptr;

    // Retrieve the local device
    err = cofa.GetLocalDevice(&localDevice);

    if (COFA_FAILED(err))
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

    if (COFA_FAILED(err))
    {
        DEBUGLOG(L"CreateChatControl failed: %hs\n", GetErrorMessage(err));
        return;
    }

    // Use automatic settings for the audio input device
    err = m_localChatControl->SetAudioInput(
        CofaAudioDeviceSelectionType::Automatic,    // Selection type
        nullptr,                                    // Device id
        nullptr                                     // Async identifier
        );

    if (COFA_FAILED(err))
    {
        DEBUGLOG(L"SetAudioInput failed: %hs\n", GetErrorMessage(err));
        return;
    }

    // Use automatic settings for the audio output device
    err = m_localChatControl->SetAudioOutput(
        CofaAudioDeviceSelectionType::Automatic,    // Selection type
        nullptr,                                    // Device id
        nullptr                                     // Async identifier
        );

    if (COFA_FAILED(err))
    {
        DEBUGLOG(L"SetAudioOutput failed: %hs\n", GetErrorMessage(err));
    }

    // Enable transcriptions always for sample purposes
    err = m_localChatControl->SetTranscriptionRequested(
        true,                                       // Turn on speech-to-text transcription
        nullptr                                     // Async identifier
        );

    if (COFA_FAILED(err))
    {
        DEBUGLOG(L"SetTranscriptionRequested failed: %hs\n", GetErrorMessage(err));
    }
}

void NetworkManager::CreateAndConnectToNetwork(std::vector<std::string>& playerIds, std::function<void(std::string)> callback)
{
    DEBUGLOG(L"NetworkManager::CreateAndConnectToNetwork()\n");

    CofaNetworkConfiguration cfg = {};

    // Setup the network to allow 8 single-device players of any device type
    cfg.allowedDeviceTypeCount = 0;
    cfg.allowedDeviceTypes = nullptr;
    cfg.maxDeviceCount = 8;
    cfg.maxDevicesPerUserCount = 1;
    cfg.maxEndpointsPerDeviceCount = 1;
    cfg.maxUserCount = 8;
    cfg.maxUsersPerDeviceCount = 1;

    CofaString uid = nullptr;
    CofaError err = m_localUser->GetUserIdentifier(&uid);

    if (COFA_FAILED(err))
    {
        DEBUGLOG(L"GetUserIdentifier failed: %hs\n", GetErrorMessage(err));
        return;
    }

    // Force the region for Wave 1
    // TODO: revisit
    CofaRegion regionList[] = {
        {
            "WestUS", // region name 
            0         // round trip latency
        },
    };

    std::vector<CofaString> additionalIds;

    DEBUGLOG(L"Additional user ids: \n");
    for (const auto& id : playerIds)
    {
        additionalIds.push_back(id.c_str());
        DEBUGLOG(L"\t%hs\n", id.c_str());
    }

    CofaNetworkDescriptor networkDescriptor = {};

    // Create a new network descriptor
    CofaManager::GetSingleton().CreateNewNetwork(
        c_cofaBuildId,                              // BuildId
        m_localUser,                                // Local User
        &cfg,                                       // Network Config
        1,                                          // Region List Count
        regionList,                                 // Region List
        static_cast<uint32_t>(additionalIds.size()),// Additional UserId Count
        additionalIds.data(),                       // Additional UserId List
        nullptr,                                    // Async Identifier
        &networkDescriptor                          // OUT network descriptor
        );

    if (COFA_FAILED(err))
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
