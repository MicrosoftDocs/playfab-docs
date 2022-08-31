---
title: Party SDK quickstart
author: debhaldarMS
description: Guide to help you integrate PlayFab Party SDK in your Game.
ms.author: debh
ms.date: 08/05/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, party, networking, communication
ms.localizationpriority: medium
---

# Party SDK quickstart

This quickstart is intended to be a high-level overview of PlayFab Party's core features. PlayFab Party was designed to be cross-platform from the ground up. We've structured these quickstarts in the same way, where most of the information applies to all platforms, and platform-specific prerequisites and steps are described in the linked documents.

In this quickstart, critical pieces of functionality are highlighted via explanatory text and code snippets. However, note that this is not a step-by-step walk-through.

For a deeper understanding, consult the linked reference and conceptual documentation, and per-platform sample applications.

## Platform Prerequisites

Before you start this quickstart, perform any necessary platform-specific setup as specified in the following topics:

1. [Android prerequisites](android-specific-requirements.md)

2. [iOS and MacOS prerequisites](ios-specific-requirements.md)

<!--3. [Nintendo Switch prerequisites](https://github.com/PlayFab/PlayFabPartySwitch/releases)-->

3. [Xbox XDK prerequisites](xbox-prerequisites.md)

4. [Linux prerequisites](linux-specific-requirements.md)

When you finish the platform-specific steps, continue with the rest of the steps in this topic to set up PlayFab Party.

> [!IMPORTANT]
> Follow these steps to [Enable PlayFab Party](enable-party.md).

## Log into your PlayFab title and obtain an entity token and entity ID

To initialize and use Party, you must log in to PlayFab. You can use [PlayFabClientAPI::LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid)
 or a platform-specific login method to do this.

Once you execute login, PlayFab returns an entity ID and entity token as part of the [LoginResult](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid#loginresult). These two key pieces of information are used to initialize a Local user instance for PlayFab Party.

An example code snippet for logging in with a custom ID as implemented in `PlayFabManager.cpp` is shown below:

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

## Initialize PlayFab Party

Before continuing with this section, it is recommended to read the [PlayFab Party objects and their relationships](concepts-objects.md) document and code comments in the public [Party.h](https://github.com/PlayFab/PlayFabParty/blob/docs/include/Party.h) header. This provides a deeper understanding of the following operations.

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

 The next step is to Create and Connect to a Party Network.

## Create a Party Network

A Party Network is a secured collection of one or more devices and their authorized users that the game creates for the purpose of exchanging chat or data communication. This typically aligns with a game's multiplayer session or chat "lobby" concept. You can
only send messages to players inside your own network.

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
) object will be returned/populated. The descriptor contains the data required by other players to connect to a network.

Refer to the [API Reference Documentation](reference/party_members.md) for information about the other function parameters.

## Connect to a Party network

Once a Party network has been created, Invitations are used to control which users can join the network. Invitation information therefore needs to be shared with other users. For this, PlayFab Matchmaking, another matchmaking service, in-game invite services, or platform invite services can be used.

The simplest Invitation type is an open invitation that consists of a network descriptor and is used here. For detailed information of all Invitation types and the security model, refer to [Invitations and the security model](concepts-invitations-security-model.md).

We implemented simple matchmaking using [PlayFab CloudScripts](../../automation/cloudscript/quickstart.md) in the demo samples, which works as follows:

1. The user creating the network creates a json key value pair with a room number as key and the network descriptor as value.

2. They store this json object in playfab backend via a CloudScript function `save_network_descriptor`.

3. Any player that wishes to join the same network (abstracted away through the concept of a chat room), queries for the network descriptor associated with the room they seek to join. This is accomplished via calling the CloudScript function `get_network_descriptor`.

The full code of the CloudScript functions are given below for reference:

``` javascript
 
// Used to store a network descriptor on the server retrievable by the roomId
// Inputs:
//    roomId - The hash key used to store and retrieve the network descriptor.
//    networkDescriptor - The network descriptor used to connect to a party network.
//
handlers.save_network_descriptor = function (args, context) 
{
  if (args && args.hasOwnProperty("roomId"))
  {
    var roomId = args.roomId;
  }
  else
  {
    return;
  }
  
  if (args && args.hasOwnProperty("networkDescriptor"))
  {
    var networkDescriptor = args.networkDescriptor;
  }
  else
  {
    return;
  }
  
  try {
    server.CreateSharedGroup({ SharedGroupId: roomId });
  } catch(err) {
    log.info("Shared group " + roomId + " could not be created.");
    log.error(err);
  }

  var updateRequest = {
    SharedGroupId: roomId,
    Data: {
      "network": networkDescriptor
    }
  };

  server.UpdateSharedGroupData(updateRequest);
};

//
// Used to retrieve a previously stored network descriptor by roomId.
// Inputs:
//    roomId - The hash key used to store and retrieve the network descriptor.
//
handlers.get_network_descriptor = function (args, context) 
{
  if (args && args.hasOwnProperty("roomId"))
  {
    var roomId = args.roomId;
  }
  else
  {
    return;
  }
  
  try 
  {
    var getRes = server.GetSharedGroupData({ SharedGroupId: roomId });
    return getRes.Data;
  } 
  catch(err) 
  {
    return;
  }
};
```

Once each player has a way to retrieve the network descriptors by selecting a room and calling the CloudScript functions, they can use the network descriptor thus retrieved to join the Party Network.

The following steps are required to successfully join a PlayFab Party Network:

1. Retrieve the network descriptor as a string by executing the above-mentioned PlayFab CloudScript function.

2. Deserialize the network descriptor from the network descriptor string.

3. Connect to the Party Network.

4. Authenticate the local user for the network.

5. Connect the local chat control to the network so that we can use VOIP.

6. Establish a [Party Network endpoint](concepts-objects.md#endpoint) for game message traffic.

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
> While creating the chat control in one of the previous steps, you've already set up the audio input and output devices which will be used by Party to send, receive and render audio data. To receive the audio messages, you'll also need to set the appropriate chat permission between each chat control if you want audio to flow. By default, the chat permissions are set to NONE. For more information, refer to the [Chat Permissions](concepts-chat-permissions-and-muting.md) article.

The processing of other messages from the Party layer is best accomplished in a dedicated update thread or a high-frequency game loop. The game loop should be set up to run every frame and receive messages from the Party Manager via the StartProcessingStateChanges() function.

For a complete description of all the state changes refer to the [Party Reference Documentation](party-reference.md). Alternatively, you can refer to the [NetworkManager.cpp](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp) for an example of how to process each state change.


## Handling title suspension
Some platforms support temporarily suspending execution of your title: iOS, Switch, and GDK.
When your title is suspended, the network stack becomes invalidated and PlayFab Party will be unable to maintain a connection to the PlayFab Party network.
Special consideration is required to handle suspending and resuming execution of your title when using PlayFab Party.

### iOS
On iOS, you must leave and re-connect to the PlayFab Party network

To leave Party network, call [LeaveNetwork()](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp#L505). After the network is reactivated, call [ConnectToNetwork()](#connect-to-a-party-network) with previous Party network descriptor.

### Switch and GDK
On Nintendo Switch and Microsoft GDK, you must cleanup PlayFab Party and wait until the title execution resumes before re-initializing PlayFab Party and reconnecting to your network.

To shutdown the Party, call [Cleanup()](https://github.com/PlayFab/PlayFabParty/blob/docs/android/PartySampleNetworkCommon/lib/NetworkManager.cpp#L198). 
> [!IMPORTANT]
> Calling Cleanup() reclaims all library resources and destroys all library objects. After re-initializing Party, you'll need to recreate any library objects such as local users and chat controls as well as re-establish any previous network state by re-authenticating local users, re-connecting chat controls, and recreating endpoints.

After the network is reactivated, call [Initialize()](#initialize-playfab-party). Once the Party is successfully initialized, the following steps are required to successfully join a previous PlayFab Party Network again:

1. Connect to the Party Network with previous Party network descriptor.

2. Re-create any local user objects and re-authenticate those local users into the network.

3. Re-create any local chat controls and re-connect those chat controls to the network to enable VOIP

4. Re-create any [Party Network endpoints](concepts-objects.md#endpoint) for game message traffic.

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

## Conclusion

In this quickstart, we walked through the key pieces of PlayFab Party and saw how to interact with them.

We encourage you to take a look at the complete Reference and Conceptual documentation as well as samples for a deeper understanding of the systems.

## Next steps

For additional platform-specific guidance for application, see:
- Xbox and Xbox Live
    - [Xbox Requirements](xbox-requirements.md)
    - [Using MPSD](using-mpsd.md)
