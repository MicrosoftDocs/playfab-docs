---
title: Azure PlayFab Party features
author: joannaleecy
description: Learn about the features of Azure PlayFab Party.
ms.author: joanlee
ms.date: 10/13/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, party
ms.localizationpriority: medium
---

# Azure PlayFab Party features

This topic provides details about Azure PlayFab Party features and how you can use them in your game.

For a high-level summary of Party features, see the [Party overview](index.md). If you're ready to start developing, see the [Party Quickstart](quickstart.md).

## Interoperable multiplayer infrastructure

Our goal is to enable you to build interoperable multiplayer experiences across devices and platforms when you're using Party and other PlayFab multiplayer services.

When you're implementing cross-play, always adhere to the best industry design practices. This helps ensure that your game's multiplayer experiences don't put certain device form factors at a disadvantage relative to other devices. Remember to verify that your cross-network/cross-platform multiplayer and player activity design complies with all applicable platform policies. This means checking with every platform that your game is on.

>[!NOTE]
>You're responsible for the compliance of your multiplayer and cross-network implementation.

## Low-latency secure data communication

#### Industry-standard encryption and authentication

Party uses industry-standard encryption and authentication for all communication (management data, game data, and real-time communication). This includes all peer-to-peer transmissions and all transactions to Azure services, whether they're web services (using HTTPS) or our transparent cloud relay service (which uses DTLS). 

#### Cross-platform mesh

Party enables data communication by automatically connecting players through a transparent, low-latency cloud relay or select regions on your own, choosing from one of our Azure regions that are distributed across the globe. Alternatively, you can use actual [direct peer-to-peer](concepts-direct-peer-connectivity.md) connectivity capabilities.

You can make use of our background Quality of Service (QoS) measurements to ensure that you have the best possible data connection for communication. For more information, see [Party QoS measurements](concepts-regions.md).

#### Networking transport capabilities

Our networking capabilities expand on User Datagram Protocol (UDP) features to provide datagram transport capabilities, including guaranteed delivery, sequential delivery, and coalescing, that are ideal for real-time multiplayer games. For more information, see [Transport options](transport-options.md).

## Flexible topology design possibilities

The flexible design of Party supports a variety of communication topologies. You can create a mesh that suits your game.

You can enable chat at any time or send data messages in the following patterns.

- Everyone-to-everyone
- Unidirectionally from one-to-many
- Constrained to "teams" or game-defined "channels"
- Multiple local players on a single device 
- Connecting to more than one distinct group of players at a time
- Arbitrary symmetric or asymmetric subsets, or combinations of the previously mentioned patterns

Party objects in multiple networks can support devices that connect to more than one network at a time. An example usage is to maintain communication with a set of friends over time. This group of friends is still able to join and leave larger, separate game sessions with strangers.

To learn more about designing networks, see [Party objects and their relationships](concepts-objects.md).

## Accessible voice and text chat

Party chat offers the following communication functionalities.

- **Voice chat:** Player devices can bind audio devices to Party networks to accomplish real-time voice chat.

- **Text chat:** Players are able to send text chat messages to one another. In-game chat text messages don't drive metering and aren't billed to your account.

- **Speech-to-text:** Player voice and synthesized text-to-speech voice can be transcribed into text messages. This functionality was originally designed to enable games to be accessible. It's also useful when gaming in a noisy environment. 

- **Text-to-speech/voice synthesis:** Generate audio from text. It can be used to synthesize player voice to read incoming text to the recipient. Like speech-to-text, it can be used for making your game more accessible.

- **Ability to add real-time custom voice effects:** Access to data in audio buffer enables you to add real-time custom effects like spatial sound using external sound engines. For more information, see [Using real-time audio manipulation to apply custom voice effects](concepts-realtime-audio-manipulation.md)

- **Real-time translation:** Incoming speech and text can be translated in real-time.
   - Incoming speech can be translated into more than 60 languages. Your input source is voice. The output target is audio or text in a different language. For the latest information, see [Azure Cognitive Speech Translation](https://azure.microsoft.com/services/cognitive-services/speech-translation/).
   - Incoming text can be translated into more than 70 languages. Your input source is text. The output target is text or audio in a different language. For the latest information, see [Azure Cognitive Translator](https://azure.microsoft.com/services/cognitive-services/translator/).

- **Text moderation:** Text chat can be moderated in real-time to filter out offensive language. For more information, see [Using text moderation](concepts-text-moderation.md).

Speech-to-text, text-to-speech, and real-time translation use Azure Cognitive Services to power these functionalities. We recommend associating the activation of these capabilities under the Ease of Access player settings. For information about rates and pricing, see [PlayFab pricing](https://playfab.com/pricing/) and [Party pricing](../../pricing/meters/meters.md#party).

To learn more, see [Understanding how Party chat works](concepts-chat.md). For more guidance on how to use the accessibility features that are provided by Party, see [Text-to-speech guidelines](party-text-to-speech-ux-guidelines.md) and [Speech-to-text guidelines](party-speech-to-text-ux-guidelines.md).

## Scalable networks (up to 128 devices per network)
PlayFab Party networks can scale to support anywhere between 2 and 128 devices. The service will choose a network relay configuration optimized for your scenario, so it's important to configure the `maxDeviceCount` in `PartyNetworkConfiguration` to match the max expected number of devices in your network. For more information on configuration when allocating scalable networks, see [Enable Scalable networks](quickstart.md#enable-scalable-networks)

With Party, one device can send data to multiple devices in a single transmission, dramatically reducing the overhead of sending data from device to device. This can have especially high impact in networks with large numbers of devices.

## Capabilities designed for multiplayer games

#### Efficient game states and logic delivery

Game states and logic are essential to games. When synchronizing game states, your game is responsible for deciding when to submit data messages to Party and what these payloads mean. 

You can make use of the Party transport system to ensure that submitted messages are delivered securely and efficiently. This can be achieved by using feature options such as guaranteeing delivery (despite internet packet loss) and automatically fragmenting and reassembling messages that are larger than what the environment supports. 

Together with ongoing connection quality feedback, such as observed latency, you can decide how your game interprets this information for a response. Tune, predict, or recover in a way that suits your design and tolerances.

>[!NOTE]
>Using data transmission in Party is entirely optional. Some games use only the chat features.

#### Integration ability with custom/existing discovery systems&mdash;players finding other players

Discovery is the process that occurs before players start connecting or chatting with one another. Games typically have a discovery or signaling mechanism in place to help players find one another before initial connectivity information can be shared.

Party integrates well with custom or existing discovery systems such as social platforms with invitation systems. What this means is that after players have found one another through this external system, you would pass Party suitable connection information to help you set up communication.

#### Policy enforcement for connectivity and communication

Games have policies in place to determine if real-time chat or data communication between players should be allowed. Party is able to enforce these policies efficiently through the use of connectivity, voice chat, and text chat API functionalities&mdash;together or independently.

Your game is responsible for defining and determining what these policies are. This is based on gameplay, privacy, and privilege implementation. For example, restricted accounts can chat only with players who are friends and must be on a particular social platform (limiting chat capabilities for players who are on behavioral bans) or simply enforcing gameplay rules to allow only players who are on the same/opposing team to chat.

We have a helper module for the Xbox Live social platform. It helps takes care of common tasks that are needed to integrate their privilege ecosystems with Party. For more information, see [Party Xbox Live Helper Library](xbox-requirements.md#playfab-party-xbox-live-helper-library).

## See also

* [Party overview](index.md)
* [Party Quickstart](quickstart.md)
* [Multiplayer servers](../servers/index.md)
* [Multiplayer](../mpintro.md)
* [Matchmaking](../matchmaking/index.md)
* [Party and direct peer-to-peer connections](concepts-direct-peer-connectivity.md)
