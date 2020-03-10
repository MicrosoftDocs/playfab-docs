---
title: PlayFab Party Overview
author: jdeweyMSFT
description: Learn about PlayFab Party real-time chat and data communication libraries for your game.
ms.author: jdewey
ms.date: 08/16/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking
ms.localizationpriority: medium
---

# PlayFab Party Overview

> [!IMPORTANT]
> This feature is currently in **Preview**. It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>
> PlayFab customers in the Indie, Pro, and Enterprise tiers can access the Matchmaking and Party previews automatically through Game Manager. Xbox managed partners are also invited for the preview in the free tier and can get a preview access code from your Microsoft developer partner manager.

PlayFab Party simplifies adding low-latency chat and data communication to your game in a way that's flexible, inclusive, and secured. Party is ideal for multiplayer implementations where a cloud-hosted dedicated server is not desired (sometimes called "peer to peer or P2P games"). Party is also well-suited to power voice and text communication for social experiences your app may provide (e.g. in-game squads, or post-game lobbies), even if you're using a cloud server as the game host.

Party uses Azure Cognitive Services to transcribe player voice chat and synthesize text as speech. This functionality has several uses but was primarily designed as an accessibility aide. Typical usage of Party voice chat is billed on a per-minute basis, and up to 10% of those voice minutes can leverage transcription and synthesis for free. We recommend tying activation of this capability to an ease-of-access player setting.

Party can not only transcribe player chat, but also translate chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities can make for a more engaging multiplayer experience.

A key goal of PlayFab Party (and our other multiplayer services), is to facilitate interoperable multiplayer infrastructure and cross-network gameplay. We encourage customers to verify that their multiplayer experiences comply with relevant platform policies for multiplayer and cross-network player activity.

## Features

- **Encryption and authentication.** Party authenticates player devices using their PlayFab player identity and encrypts data with a DTLS-like protocol.
- **Device to device datagram networking.** At the core of Party are relays that are hosted globally across the Azure cloud. Player devices use these relays to create Party networks and send game data to one another. The Party networking system includes configurable transport features such as automatic retries when encountering packet loss.
- **Voice and text chat.** Player devices can bind audio devices to Party networks to accomplish real-time voice chat. Text chat messages between players are also supported.
- **Speech-to-text and voice synthesis.** Party can transcribe player voice chat and synthesize utterances for text message. This functionality has several uses but was primarily designed as an accessibility aide.
- **Real-time translation.** Party can understand and synthesize real-time translations of player voice and text chat.

## Key Topics

- [Learn about PlayFab Party objects and their relationships](concepts-objects.md)
- [Learn about PlayFab Party invitations and the security model](concepts-invitations-security-model.md)
- [Learn how PlayFab Party interacts with your discovery flows](concepts-discovery.md)
- [Find out more about PlayFab Party chat communication](concepts-chat.md)

For details on parameters, return values, and behaviors when invoking the libraries, see the [PlayFab Party API reference documentation](party-reference.md) topic.

To read best practices for user experiences and Microsoft's recommendations around chat and data communication user interfaces, see the [PlayFab Party UX guidelines](party-ux-guidelines.md) topic.

## Resources

|Platform|SDKs|Samples|
|-|-|-|
|Windows 10, Windows 8.1 |[C++ SDK](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.Windows/), [Xbox Live Helper Library](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabPartyXboxLive.Cpp.Windows)|[BumbleRumble](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/All/BumbleRumble)|
|Xbox One (XDK) |[C++ SDK](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.XboxOneXDK), [Xbox Live Helper Library](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabPartyXboxLive.Cpp.XboxOneXDK)|[BumbleRumble](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/All/BumbleRumble)|
|Windows 7 |[C++ SDK](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.Windows/), [Xbox Live Helper Library](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabPartyXboxLive.Cpp.Windows)|Pending|
|iOS | [C++ SDK](https://github.com/PlayFab/PlayFabParty/releases)| [Chat App](https://github.com/PlayFab/PlayFabParty/tree/master/iOS/PartySample) |
|Android | [C++ SDK](https://github.com/PlayFab/PlayFabParty/releases)| [Chat App](https://github.com/PlayFab/PlayFabParty/tree/master/android/PartySample) |

Access to the SDKs for Nintendo Switch and Sony PlayStation 4 requires special approval and adherence to platform policies, please contact us via [email](mailto:helloplayfab@microsoft.com) or [Game Manager](https://blog.playfab.com/blog/playfab-support-overview) for access.

|Platform|SDKs|Samples|
|-|-|-|
|Nintendo Switch | [C++ SDK](https://github.com/PlayFab/PlayFabPartySwitch)| [Chat App](https://github.com/PlayFab/PlayFabPartySwitch/tree/master/Switch/PartySample) |
|Sony PlayStation 4 | [C++ SDK](https://github.com/PlayFab/PlayFabPartyPS4)| [Chat App](https://github.com/PlayFab/PlayFabPartyPS4/tree/master/PS4/PartySample) |


## Relationship to the game and other components

### Discovery

PlayFab Party provides a data transport, and games will typically need an external discovery or signaling mechanism to share initial connectivity information. For example, many social platforms provide invitation systems that can include connection information and be used for signaling. You can also leverage other [PlayFab multiplayer](../mpintro.md) features such as [Matchmaking](../matchmaking/index.md) for like-minded players to find each other. Or, you can have players rendezvous using your own custom technology.

### Policy

The game is responsible for determining if real-time chat or data communication between given players should be allowed based on its privacy and privilege implementation (e.g., restricted accounts that can only chat with players who are friends on a particular social platform, or behavioral bans) and gameplay reasons like same or opposing teams.

PlayFab Party then enforces the described policies efficiently for connectivity, voice chat, and text chat together or independently.
Helper modules are available for some social platforms like **Microsoft Xbox Live** that take care of common tasks needed to integrate their privilege ecosystems with PlayFab Party.

All [PlayFab multiplayer](../mpintro.md) features, including Party, are designed to let you build interoperable multiplayer experiences across devices and platforms. When implementing  *cross-play*, you should leverage best industry design practices so that the game's multiplayer experiences don't accidentally put certain device form factors at a disadvantage relative to others, and that they comply with all applicable platform policies for cross-platform multiplayer activity.

### Game state

To synchronize its particular game state, the game is responsible for deciding when (or if) to submit data messages to PlayFab Party and what the payloads mean.

The PlayFab Party transport ensures that submitted messages are delivered securely and efficiently via features like optionally guaranteeing delivery despite Internet packet loss, and automatically fragmenting and reassembling messages larger than the environment supports. PlayFab Party also provides ongoing connection quality feedback such as observed latency. The game can choose how to interpret the feedback and tune, predict, or recover in the way best suited to its own design and tolerances.

Using data transmission in PlayFab Party is entirely optional; some games use only chat features.

## Communication topologies

PlayFab Party supports a wide variety of communication topologies. All chat or data messages are conceptually from one peer device or user directly to others, however PlayFab Party automatically leverages a transparent cloud relay service to avoid common environmental and security problems with actually establishing direct connections peer-to-peer.

The game is not required to use that logical peer-to-peer communication within a collection of devices in a particular way. You might choose to have one device treated as an owner ("host"), or you might treat all peers as equals.

You can enable chat at any time or send data messages using any of the following patterns:

- everyone-to-everyone
- unidirectionally from one-to-many
- constrained to "teams" or game-defined "channels"
- arbitrary symmetric or asymmetric subsets, or combinations of the above

Multiple local users on a single device, as well as connecting to more than one distinct group of players at a time are also supported.

While PlayFab Party is flexible regarding topology for exchanging data among inter-connected devices, its conceptually peer-to-peer orientation implies that the authoritative game state will be managed on one or more of the users' devices cooperatively.

Some multiplayer games have designs or modes that are not well-suited to this requirement, perhaps due to supporting device form factors with insufficient resources, or due to competitive cheating concerns, for example. If this applies to your game, you may wish to consider using [PlayFab multiplayer servers](../servers/index.md) to host custom dedicated game logic in a dynamically-scaling cloud environment in addition to using PlayFab Party for chat communication.
