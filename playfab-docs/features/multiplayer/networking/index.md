---
title: PlayFab Party Overview
author: jdeweyMSFT
description: Learn about PlayFab Party real-time chat and data communication libraries for your game.
ms.author: jdewey
ms.date: 08/16/2019
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, networking
ms.localizationpriority: medium
---

# PlayFab Party Overview

> [!IMPORTANT]
> This feature is currently in **Private Preview**.
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>
> Access to this feature is restricted to select titles. Interoperable SDKs for Windows 10 PCs, Windows 7 PCs, Xbox One, iOS,  Android, and Nintendo Switch are available now. If you are interested in this feature, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com).

PlayFab Party simplifies adding low-latency chat and data communication to your game in a way that's flexible, inclusive, and secured. This fully managed service and SDKS are available for a variety of platforms and takes care of:

- establishing connections that are encrypted and authenticated to protect game information and user privacy

- transmitting your game's data messages to remote devices using configurable features such as automatic retries when encountering Internet packet loss

- working with each device's platform and audio hardware (e.g., microphone input, headset output) for enabling voice chat

- seamlessly integrating real-time *speech-to-text transcription*, *text-to-speech synthesis
PlayFab Party is a set of libraries and services for easily adding multiplayer real-time networking and chat communication to your game.

Multiplayer games are typically one of two designs:

1. Authoritative
2. Non-authoritative

Authoritative games have a central authority for game state, this may be a player device or [a cloud-hosted dedicated server](../servers/index.md).

Non-authoritative designs require player devices to synchronize game state cooperatively, over a peer-to-peer network.

Party is an ideal, secure, low-latency transport for non-authoritative designs and authoritative designs, where a cloud-hosted dedicated server is not desired. Party is also well-suited to add voice and text communication to non-gameplay social experiences your app may provide (e.g. in-game squad experiences, or post-game lobbies).

Party utilizes Azure Cognitive Services to transcribe player voice chat and synthesize speech for text messages. This functionality has several uses, but was primarily designed as an accessibility aide. Typical usage of Party voice chat is billed on a per-minute basis, and up to 10% of those voice minutes can leverage transcription and synthesis for free. We recommend tying activation of this capability to an ease-of-access player setting.

Party can not only transcribe player chat, but also translate chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities can make for a more engaging multiplayer experience.

One of the goals of PlayFab Party (and our other multiplayer services), is to facilitate interoperable multiplayer infrastructure and cross-network gameplay. We encourage customers to verify that their multiplayer experiences comply with relevant platform policies for multiplayer and cross-network player activity.

## Features

- **Encryption and authentication.** Party authenticates player devices using their PlayFab player identity and encrypts data with a DTLS-like protocol.
- **Device to device datagram networking.** At the core of Party are relays that are hosted globally across the Azure cloud. Player devices use these relays to create Party networks and send game data to one another.
- **Voice and text chat.** Player devices can bind audio devices to Party networks to accomplish real-time voice chat. Text chat messages between players are also supported.
- **Speech-to-text and voice synthesis.** Party can transcribe player voice chat and synthesize utterances for text message. This functionality has several uses, but was primarily designed as an accessibility aide.
- **Real-time translation.** Party can understand and synthesize real-time translations of player voice and text chat.

## Key Topics

- [Learn about PlayFab Party objects and their relationships](concepts-objects.md)
- [Learn about PlayFab Party invitations and the security model](concepts-invitations-security-model.md)
- [Learn how PlayFab Party interacts with your discovery flows](concepts-discovery.md)
- [Find out more about PlayFab Party chat communication](concepts-chat.md)

For details on parameters, return values, and behaviors when invoking the libraries, see the [PlayFab Party API reference documentation](party-reference.md) topic.

To read best practices for user experiences and Microsoft's recommendations around chat and data communication user interfaces, see the [PlayFab Party UX guidelines](party-ux-guidelines.md) topic.


## Resources

- [Windows 7 (Win32 C++), Windows 10 (Win32 C++), and Xbox One (XDK C++) Nuget packages](https://www.nuget.org/profiles/PlayFab)
- [Windows 10 and Xbox One sample (BumbleRumble)](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/All/BumbleRumble)


## Relationship to the game and other components

### Discovery

PlayFab Party provides a communication data transport that relies on an external discovery or advertisement mechanism to share initial connectivity information.
This integrates well with various social platforms' invitation mechanisms that can include connection information.
It could also leverage other [PlayFab multiplayer](../mpintro.md) features such as [Matchmaking](../matchmaking/index.md) for like-minded players to find each other, and [Servers](../servers/index.md) that host dynamically scaling custom game worlds where players have already gathered. Or, you can have players rendezvous using your own preferred technology.

### Policy

The game is responsible for determining if real-time chat or data communication between given players should be allowed based on its privacy and privilege implementation (e.g., restricted accounts that can only chat with players who are friends on a particular social platform, or behavioral bans) and gameplay reasons like same or opposing teams.

PlayFab Party then enforces the described policies efficiently for connectivity, voice chat, and text chat together or independently.
Helper modules are available for some social platforms like **Microsoft Xbox Live** that take care of common tasks needed to integrate their privilege ecosystems with PlayFab Party.

All [PlayFab multiplayer](../mpintro.md) features, including **Party**, are designed to let you build interoperable multiplayer experiences across devices and platforms. When implementing  *cross-play*, you should leverage best industry design practices so that the game's multiplayer experiences don't accidentally put certain device form factors at a disadvantage relative to others, and that they comply with all applicable platform policies for cross-platform multiplayer activity.

### Game state

The game is responsible for deciding when (or if) to submit data messages to PlayFab Party and what the payloads mean in order to synchronize its particular game state.

The PlayFab Party transport ensures that submitted messages are delivered securely and efficiently via features like optionally guaranteeing delivery despite Internet packet loss, and automatically fragmenting and reassembling messages larger than the environment supports.
PlayFab Party also provides ongoing connection quality feedback such as observed latency.
The game then chooses how to interpret the feedback to tune, predict, or recover in the way best suited to its own design and tolerances.

Using data transmission in PlayFab Party is entirely optional; some games use only chat features.

## Communication topologies

PlayFab Party supports a wide variety of communication topologies. All chat or data messages are conceptually from one peer device or user directly to others, however PlayFab Party automatically leverages a transparent cloud relay service to avoid common environmental and security problems with actually establishing direct connections peer-to-peer.

The game is not required to use that logical peer-to-peer communication within a collection of devices in a particular way. You might choose to have one device treated as an owner ("host"), or you might treat all peers as equals.

At any time you can enable chat or send data messages using any of the following common example patterns:

- everyone-to-everyone
- unidirectionally from one-to-many
- constrained to "teams" or game-defined "channels"
- arbitrary symmetric or asymmetric subsets, or combinations of the above

Multiple local users on a single device, as well as connecting to more than one distinct group of players at a time are also supported.

While PlayFab Party is flexible regarding topology for exchanging data among inter-connected devices, its conceptually peer-to-peer orientation implies that the authoritative game state will be managed on one or more of the users' devices cooperatively.

Some multiplayer games have designs or modes that are not well-suited to this requirement, perhaps due to supporting device form factors with insufficient resources, or due to competitive cheating concerns, for example.

If this applies to your game, you may wish to consider using [PlayFab multiplayer servers](../servers/index.md) to host custom dedicated game logic in a dynamically-scaling cloud environment in addition to using PlayFab Party for chat communication.


