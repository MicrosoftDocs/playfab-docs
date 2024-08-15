---
title: Party Quickstart
author: debhaldarMS
description: Guide to help you integrate PlayFab Party SDK in your Game.
ms.author: debh
ms.date: 08/05/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, party, networking, communication
ms.localizationpriority: medium
---

# Party Quickstart

This quickstart describes PlayFab Party's core functionality alongside code snippets. PlayFab Party is designed to be cross-platform from the ground up. We've structured these quickstarts in the same way, where most of the information applies to all platforms, and platform-specific prerequisites and steps are described in the linked documents.

For a deeper understanding, consult the linked reference and conceptual documentation, and per-platform sample applications.

> [!NOTE]
> This quickstart guide covers use of the C++ Party SDK 
> * For Unity users, refer to the [Quickstart for Unity](party-unity-plugin-quickstart.md)
> * For Unreal Engine users who want to use the PlayFab Online Subsystem for Unreal Engine, refer to the [Quickstart for Unreal](party-unreal-engine-oss-quickstart.md). 


## Prerequisites

You need a PlayFab account, and you *must enable* the Party feature to start using Party. 

1. Create or sign in to your [PlayFab account](https://playfab.com). For instructions, see [Quickstart: Game Manager](../../../gamemanager/quickstart.md).
1. [Enable Party feature via Game Manager](enable-party.md) from your PlayFab account.

## Platform Prerequisites

Before you start this quickstart, perform any necessary platform-specific setup as specified in the following topics:

1. [Android prerequisites](android-specific-requirements.md)

2. [iOS and macOS prerequisites](apple-specific-requirements.md)

<!--3. [Nintendo Switch prerequisites](https://github.com/PlayFab/PlayFabPartySwitch/releases)-->

3. [Linux prerequisites](linux-specific-requirements.md)

When you finish the platform-specific steps, continue with the rest of the steps in this topic to set up PlayFab Party.

## Download and set up Party SDK

There are Party SDKs for different platforms and game engines. Select and download the one that you need. For download links, see [Party SDKs](party-sdks.md).

After installing the SDK, you might want to run a sample to see how Party works before you start writing code. To download a sample, go to [Party samples](party-samples.md).

If you're using Party in Xbox and PC titles, we recommend that you use the [Party Xbox Live Helper Library](party-xbox-live-guide.md) to ensure consistent functionality and behavior. This library helps your title meet Xbox Live requirements. To learn more, see [Xbox requirements](xbox-requirements.md).

## Log in to your PlayFab title and obtain an entity token and entity ID

To initialize and use Party, you must log in to PlayFab. You can use [PlayFabClientAPI::LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid)
 or a platform-specific login method.

Once you execute login, PlayFab returns an entity ID and entity token as part of the [LoginResult](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid#loginresult). These two key pieces of information are used to initialize a Local user instance for PlayFab Party.

An example for logging in with a custom ID as implemented in `PlayFabManager.cpp` is shown in this code snippet:

```cpp
PlayFabClientAPI::LoginWithCustomID(
    loginRequest,
    [this, callback, userId](const LoginResult& loginResult, void*)
    {
        // Sign in was successful.
        DEBUGLOG("PlayFab::signin -- Login with custom id callback\n");

        // Save the PlayFab id and entity data for Party authentication.
        m_playfabId = loginResult.PlayFabId;
        if (loginResult.EntityToken.notNull() && loginResult.EntityToken->Entity.notNull())
        {
            m_entityKey = loginResult.EntityToken->Entity;
            m_entityToken = loginResult.EntityToken->EntityToken;
        }
```

After successfully obtaining the entity ID and entity token from PlayFab, you can proceed with enabling and then initializing Party.

> [!NOTE]
> If you're using Xbox Live, you can also get use the [Party Xbox Live Helper Library](party-xbox-live-guide.md) to login. 

## Initialize PlayFab Party

At a high level, initializing Party involves the following steps:

1. Get a singleton reference to the `PartyManager`and initialize it.  
 This is the primary management class for interacting with the Party library.

```cpp
    auto& partyManager = PartyManager::GetSingleton();
    PartyError err;

    //Only initialize the party manager once.
    if (m_partyInitialized == false)
    {
        // Initialize PlayFab Party
        err = partyManager.Initialize(titleId);
        if (PARTY_FAILED(err))
        {
            DEBUGLOG("Initialize failed: %s\n", GetErrorMessage(err));
            return;
        }

        m_partyInitialized = true;
    }
```

2. Create a local user object.  
 This local user object is used to represent a local user on the device (PC, console, phone, ...) when performing networking and chat operations. The local user object is initialized with the PlayFab Entity ID.

```cpp
    //Only create a local user object if it doesn't exist.
    if (m_localUser == nullptr)
    {
        PartyString entityId = Managers::Get<PlayFabManager>()->EntityId().c_str();
        PartyString entityToken = Managers::Get<PlayFabManager>()->EntityToken().c_str();

        // Create a local user object
        err = partyManager.CreateLocalUser(
            entityId,                                   // User id
            entityToken,                                // User entity token
            &m_localUser                                // OUT local user object
        );

        if (PARTY_FAILED(err))
        {
            DEBUGLOG("CreateLocalUser failed: %s\n", GetErrorMessage(err));
            return;
        }
    }
```

3. Create a chat control and set the audio input and output channel where Party will receive or forward data.  
 The chat control object manages the chat operations for the user on the specific device.

```cpp
    // Only create local chat controls if they don't exist.
    if (m_localChatControl == nullptr)
    {
        PartyLocalDevice* localDevice = nullptr;

        // Retrieve the local device
        err = partyManager.GetLocalDevice(&localDevice);

        if (PARTY_FAILED(err))
        {
            DEBUGLOG("GetLocalDevice failed: %s\n", GetErrorMessage(err));
            return;
        }

        // Create a chat control for the local user on the local device
        err = localDevice->CreateChatControl(
            m_localUser,                                // Local user object
            m_languageCode,                             // Language id
            nullptr,                                    // Async identifier
            &m_localChatControl                         // OUT local chat control
        );

        if (PARTY_FAILED(err))
        {
            DEBUGLOG("CreateChatControl failed: %s\n", GetErrorMessage(err));
            return;
        }

        // Use system default settings for the audio input device
        err = m_localChatControl->SetAudioInput(
            PartyAudioDeviceSelectionType::SystemDefault,   // Selection type
            nullptr,                                        // Device id
            nullptr                                         // Async identifier
        );

        if (PARTY_FAILED(err))
        {
            DEBUGLOG("SetAudioInput failed: %s\n", GetErrorMessage(err));
            return;
        }

        // Use system default settings for the audio output device
        err = m_localChatControl->SetAudioOutput(
            PartyAudioDeviceSelectionType::SystemDefault,   // Selection type
            nullptr,                                        // Device id
            nullptr                                         // Async identifier
        );

        if (PARTY_FAILED(err))
        {
            DEBUGLOG("SetAudioOutput failed: %s\n", GetErrorMessage(err));
        }
```

4. Set the transcription and translation options.  
 Transcription and translation are optional chat features that can significantly increase accessibility of your game. You can find more information about these features in the [Chat Overview](concepts-chat.md).

```cpp
        // Get the available list of text to speech profiles
        err = m_localChatControl->PopulateAvailableTextToSpeechProfiles(nullptr);

        if (PARTY_FAILED(err))
        {
            DEBUGLOG("Populating available TextToSpeechProfiles failed: %s \n", GetErrorMessage(err));
        }

        // Set transcription options for transcribing other users regardless of language, and ourselves.
        PartyVoiceChatTranscriptionOptions transcriptionOptions =
            PartyVoiceChatTranscriptionOptions::TranscribeOtherChatControlsWithMatchingLanguages |
            PartyVoiceChatTranscriptionOptions::TranscribeOtherChatControlsWithNonMatchingLanguages |
            PartyVoiceChatTranscriptionOptions::TranslateToLocalLanguage |
            PartyVoiceChatTranscriptionOptions::TranscribeSelf;

        // Set the transcription options on our chat control.
        err = m_localChatControl->SetTranscriptionOptions(
            transcriptionOptions,                       // Transcription options
            nullptr                                     // Async identifier
        );

        if (PARTY_FAILED(err))
        {
            DEBUGLOG("SetTranscriptionOptions failed: %s\n", GetErrorMessage(err));
        }

        // Enable translation to local language in chat controls.
        err = m_localChatControl->SetTextChatOptions(
            PartyTextChatOptions::TranslateToLocalLanguage,
            nullptr
        );
```

At this point, you have the PlayFab Party initialized in your application or game.

Refer to the `NetworkManager::Initialize()` code in [NetworkManager.cpp](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp) in the demo app for a complete sample.

The next step is to create a Party Network and connect to it.

## Create a Party Network

A Party Network is a secured collection of one or more devices and their authorized users that the game creates to exchange chat or data communication. A Party Network typically aligns with a game's multiplayer session or chat "lobby" concept. You can only send messages to players inside your own network.

The following code snippet shows how we can create a Party Network.

```cpp
    // Initialize an empty network descriptor to hold the result of the following call.
    PartyNetworkDescriptor networkDescriptor = {};

    // Create a new network descriptor
    err = PartyManager::GetSingleton().CreateNewNetwork(
        m_localUser,                                // Local User
        &cfg,                                       // Network Config
        0,                                          // Region List Count
        nullptr,                                    // Region List
        &invitationConfiguration,                   // Invitation configuration
        nullptr,                                    // Async Identifier
        &networkDescriptor,                         // OUT network descriptor
        nullptr                                     // applied initialinvitationidentifier.
    );
```

Once the function call to `CreateNewNetwork()` succeeds, a network descriptor [PartyNetworkDescriptor](concepts-objects.md#network
) object is returned/populated. The descriptor contains the data required for other players to connect to a network.

Refer to the [API Reference Documentation](reference/party_members.md) for information about the other function parameters.

Once a Party network has been created, invitations are used to control which users can join the network. PlayFab Matchmaking, PlayFab Lobby, platform invites, or custom game services can be used to share connection details with other players.

The simplest invitation type is an open invitation that consists of a network descriptor. For detailed information of all invitation types and the security model, refer to [Invitations and the security model](concepts-invitations-security-model.md).

## Share Party network descriptor

At this point, you have a party network descriptor and are ready to share it with other players. There are many synchronization mechanisms that you can use to share this information, but for quick testing purposes, you can copy and paste the Party network descriptor from the host Party session to the guest Party session manually. We recommend using PlayFab Lobby for sharing the network descriptor in your multiplayer game, but you can also use your own lobby service, invites, or other sharing mechanisms based on the needs of your game.

### Manually share Party network descriptor

1. From host session, use [PartyManager::SerializeNetworkDescriptor()](reference/classes/PartyManager/methods/partymanager_serializenetworkdescriptor.md) to serialize the network descriptor to a string and print it out to the console.

2. Copy and paste the network descriptor string to another game locally or remotely.

3.  In the guest session, use [PartyManager::DeserializeNetworkDescriptor()](reference/classes/PartyManager/methods/partymanager_deserializenetworkdescriptor.md) to deserialize the network descriptor from the network descriptor string.

4. Connect to the Party Network.

### Use PlayFab Lobby to share the Party network descriptor

PlayFab Lobby can be used to temporarily group players as they move into and out of matches and can be used to synchronize the network descriptor so that players can join the same network. 
PlayFab Lobby is highly customizable to support a wide variety of gameplay needs on all supported platforms and across platforms. Refer to the [Multiplayer SDK Quickstart](../lobby/lobby-getting-started.md) for more detail about using PlayFab Lobby with real-time notifications.

For details about using PlayFab Lobby together with PlayFab Party, refer to [Create a lobby with PlayFab Multiplayer SDK](party-lobby-integration.md).

## Connect to a Party network

Follow the steps below to join the party network after obtaining the Party network descriptor:

1. Use [PartyManager::DeserializeNetworkDescriptor()](reference/classes/PartyManager/methods/partymanager_deserializenetworkdescriptor.md) to deserialize the network descriptor from the network descriptor string.

2. Connect to the Party Network.

3. Authenticate the local user for the network.

4. Connect the local chat control to the network so that we can use VOIP.

5. Establish a [Party Network endpoint](concepts-objects.md#endpoint) for game message traffic.

```cpp
    PartyNetworkDescriptor networkDescriptor = {};

    // Deserialize the remote network's descriptor
    PartyError err = PartyManager::DeserializeNetworkDescriptor(descriptor, &networkDescriptor);

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("ConnectToNetwork failed to deserialize descriptor: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return;
    }

    // This portion of connecting to the network is the same for
    // both creating a new and joining an existing network.

    PartyError err = PartyManager::GetSingleton().ConnectToNetwork(
        &descriptor,                                // Network descriptor
        nullptr,                                    // Async identifier
        &m_network                                  // OUT network
    );

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("ConnectToNetwork failed: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return false;
    }

    // Authenticate the local user on the network so we can participate in it
    err = m_network->AuthenticateLocalUser(
        m_localUser,                                // Local user
        networkId,                                  // Invitation Id
        nullptr                                     // Async identifier
    );

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("AuthenticateLocalUser failed: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return false;
    }

    // Connect the local user chat control to the network so we can use VOIP
    err = m_network->ConnectChatControl(
        m_localChatControl,                         // Local chat control
        nullptr                                     // Async identifier
    );

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("ConnectChatControl failed: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return false;
    }

    // Establish a network endoint for game message traffic
    err = m_network->CreateEndpoint(
        m_localUser,                                // Local user
        0,                                          // Property Count
        nullptr,                                    // Property name keys
        nullptr,                                    // Property Values
        nullptr,                                    // Async identifier
        &m_localEndpoint                            // OUT local endpoint
    );

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("Failed to CreateEndpoint: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return false;
    }
```

## Send a message to another network device or endpoint

Once you've connected to the Party Network, you can send a message using the local endpoint object.

```cpp
    if (m_localEndpoint && m_state == NetworkManagerState::NetworkConnected)
    {
        auto packet = message.Serialize();

        // Form the data packet into a data buffer structure
        PartyDataBuffer data[] = {
            {
                static_cast<const void*>(packet.data()),
                static_cast<uint32_t>(packet.size())
            },
        };

        // Set delivery options for guaranteed and sequential delivery.
        PartySendMessageOptions deliveryOptions =
            PartySendMessageOptions::GuaranteedDelivery |
            PartySendMessageOptions::SequentialDelivery;

        // Send out the message to all other peers
        PartyError err = m_localEndpoint->SendMessage(
            0,                                      // endpoint count; 0 = broadcast
            nullptr,                                // endpoint list
            deliveryOptions,                        // send message options
            nullptr,                                // configuration
            1,                                      // buffer count
            data,                                   // buffer
            nullptr                                 // async identifier
        );

        if (PARTY_FAILED(err))
        {
            DEBUGLOG("Failed to SendMessage: %s\n", GetErrorMessage(err));
        }
    }
```

The full code is available in [NetworkManager.cpp](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp).

## Receive a message and render it on the local device

The final step is receiving messages sent by remote Party members and rendering (playing) them on your device. 

> [!IMPORTANT]
> While creating the chat control in one of the previous steps, you've already set up the audio input and output devices which is used by Party to send, receive and render audio data. To receive the audio messages, you'll also need to set the appropriate chat permission between each chat control if you want audio to flow. By default, the chat permissions are set to NONE. For more information, see the [Chat Permissions](concepts-chat-permissions-and-muting.md) article.

The processing of other messages from the Party layer is best accomplished in a dedicated update thread or a high-frequency game loop. The game loop should be set up to run every frame and receive messages from the Party Manager via the StartProcessingStateChanges() function.

For a complete description of all the state changes, refer to the [Party Reference Documentation](party-reference.md). Alternatively, you can refer to the [NetworkManager.cpp](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp) for an example of how to process each state change.


## Handling title suspension
Some platforms support temporarily suspending execution of your title: iOS, Switch, and GDK.
When your title is suspended, the network stack becomes invalidated and PlayFab Party is unable to maintain a connection to the PlayFab Party network.
Special consideration is required to handle suspending and resuming execution of your title when using PlayFab Party.

### iOS
On iOS, you must leave and reconnect to the PlayFab Party network

To leave Party network, call [LeaveNetwork()](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp#L505). After the network is reactivated, call [ConnectToNetwork()](#connect-to-a-party-network) with previous Party network descriptor.

### Switch and GDK
On Nintendo Switch and Microsoft GDK, you must clean up PlayFab Party and wait until the title execution resumes before reinitializing PlayFab Party and reconnecting to your network.

To shut down the Party, call [Cleanup()](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp#L198). 
> [!IMPORTANT]
> Calling Cleanup() reclaims all library resources and destroys all library objects. After reinitializing Party, you'll need to recreate any library objects such as local users and chat controls as well as reestablish any previous network state by reauthenticating local users, reconnecting chat controls, and recreating endpoints.

After the network is reactivated, call [Initialize()](#initialize-playfab-party). Once the Party is successfully initialized, the following steps are required to successfully join a previous PlayFab Party Network again:

1. Connect to the Party Network with previous Party network descriptor.

2. Recreate any local user objects and reauthenticate those local users into the network.

3. Recreate any local chat controls and reconnect those chat controls to the network to enable VOIP

4. Recreate any [Party Network endpoints](concepts-objects.md#endpoint) for game message traffic.

```cpp
    PartyError err = PartyManager::GetSingleton().ConnectToNetwork(
        &descriptor,                                // Network descriptor
        nullptr,                                    // Async identifier
        &m_network                                  // OUT network
    );

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("ConnectToNetwork failed: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return false;
    }

    // Authenticate the local user on the network so we can participate in it
    err = m_network->AuthenticateLocalUser(
        m_localUser,                                // Local user
        networkId,                                  // Invitation Id
        nullptr                                     // Async identifier
    );

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("AuthenticateLocalUser failed: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return false;
    }

    // Connect the local user chat control to the network so we can use VOIP
    err = m_network->ConnectChatControl(
        m_localChatControl,                         // Local chat control
        nullptr                                     // Async identifier
    );

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("ConnectChatControl failed: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return false;
    }

    // Establish a network endoint for game message traffic
    err = m_network->CreateEndpoint(
        m_localUser,                                // Local user
        0,                                          // Property Count
        nullptr,                                    // Property name keys
        nullptr,                                    // Property Values
        nullptr,                                    // Async identifier
        &m_localEndpoint                            // OUT local endpoint
    );

    if (PARTY_FAILED(err))
    {
        DEBUGLOG("Failed to CreateEndpoint: %s\n", GetErrorMessage(err));
        errorCallback(err);
        return false;
    }
```

> [!IMPORTANT]
> If the reconnection is successfully completed, the party will now be able to communicate to others peers, but if the previous network no longer exists, the reconnecting will be failed. In this case, you should handle the appropriate connection error.

## Next Steps

Read more about [PlayFab Party objects and their relationships](concepts-objects.md) and consult the [Party API reference documentation](reference/party_members.md) so that your game can get the most out of these capabilities. 

For more Xbox-specific guidance, refer to the [Xbox Requirements](xbox-requirements.md) early and often. 

## See also

* [Party features](party-features.md)
* [Party SDKs](party-sdks.md)
* [Party samples](party-samples.md)
* [Multiplayer Services](../mpintro.md)
* [Party objects and their relationships](concepts-objects.md)
* [Party chat basics](concepts-chat.md)
* [Party invitations and the security model](concepts-invitations-security-model.md)
* [Party interacts with your discovery flows](concepts-discovery.md)
* [Party API reference documentation](reference/party_members.md)
* Party UX guidelines for [Text-to-speech](party-text-to-speech-ux-guidelines.md) and [Speech-to-text](party-speech-to-text-ux-guidelines.md)
