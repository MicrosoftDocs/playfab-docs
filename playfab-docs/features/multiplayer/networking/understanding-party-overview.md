---
title: PlayFab Party Overview
description: An introduction to PlayFab Party real-time chat and data communication solutions.
author: TBD
ms.author: TBD
ms.date: TBD
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking
---

# PlayFab Party Overview

> [!IMPORTANT]
> This feature is currently in **Private Preview**.
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>
> Access to this feature is restricted to select titles, with SDKs available for Windows 10 PCs and Xbox One. Interoperable SDKs for iOS and Android will be available later in 2019. If you are interested in this feature, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

A key part of what makes multiplayer games so fun is real-time interaction among players, but this can be a challenge for developers to implement. PlayFab Party simplifies adding low-latency chat and data communication to your game in a way that's flexible, inclusive, and secured.

The Microsoft-managed service and client libraries available for all your preferred OS platforms will take care of:

* establishing connections that are encrypted and authenticated to protect game information and user privacy
* transmitting your game's data messages to remote devices using configurable features such as automatic retries when encountering Internet packet loss
* working with each device's platform and audio hardware (e.g., microphone input, headset output) for enabling voice chat
* seamlessly integrating real-time *speech-to-text transcription*, *text-to-speech synthesis*, and *language translation* so that player abilities or preferences aren't artificial barriers to social participation

## Relationship to the game and other components

#### Discovery

PlayFab Party provides a communication data transport that relies on an external discovery or advertisement mechanism to share initial connectivity information.
This integrates well with various social platforms' invitation mechanisms that can include connection information.
It could also leverage other [PlayFab multiplayer](../mpintro.md) features such as [Matchmaking](../matchmaking/index.md) for like-minded players to find each other, and [Servers](../servers/index.md) that host dynamically scaling custom game worlds where players have already gathered. Or, you can have players rendezvous using your own preferred technology.

#### Policy

The game is responsible for determining if real-time chat or data communication between given players should be allowed based on its privacy and privilege implementation (e.g., restricted accounts that can only chat with players who are friends on a particular social platform, or behavioral bans) and gameplay reasons like same or opposing teams.
PlayFab Party then enforces the described policies efficiently for connectivity, voice chat, and text chat together or independently.
Helper modules are available for some social platforms like **Microsoft Xbox Live** that take care of common tasks needed to integrate their privilege ecosystems with PlayFab Party.

All [PlayFab multiplayer](../mpintro.md) features, including **Party**, are designed to let you build interoperable multiplayer experiences across devices and platforms.
When leveraging such "cross-play", you should leverage best industry design practices so that the game's multiplayer experiences don't accidentally put certain device form factors at a disadvantage relative to others, and that they comply with all applicable platform policies for cross-platform multiplayer activity.

#### Game state

The game is responsible for deciding when (or if) to submit data messages to PlayFab Party and what the payloads mean in order to synchronize its particular game state.
The PlayFab Party transport ensures that submitted messages are delivered securely and efficiently via features like optionally guaranteeing delivery despite Internet packet loss, and automatically fragmenting and reassembling messages larger than the environment supports.
PlayFab Party also provides ongoing connection quality feedback such as observed latency.
The game then chooses how to interpret the feedback to tune, predict, or recover in the way best suited to its own design and tolerances.

Using data transmission in PlayFab Party is entirely optional; some games use only chat features.

## Communication topologies

PlayFab Party supports a wide variety of communication topologies.
All chat or data messages are conceptually from one peer device or user directly to others, however PlayFab Party automatically leverages a transparent cloud relay service to avoid common environmental and security problems with actually establishing direct connections peer-to-peer.

The game is not required to use that logical peer-to-peer communication within a collection of devices in a particular way. You might choose to have one device treated as an owner ("host"), or you might treat all peers as equals.

At any time you can enable chat or send data messages using any of the following common example patterns:

* everyone-to-everyone
* unidirectionally from one-to-many
* constrained to "teams" or game-defined "channels"
* arbitrary symmetric or asymmetric subsets, or combinations of the above

Multiple local users on a single device, as well as connecting to more than one distinct group of players at a time are also supported.

While PlayFab Party is flexible regarding topology for exchanging data among inter-connected devices, its conceptually peer-to-peer orientation implies that the authoritative game state will be managed on one or more of the users' devices cooperatively.

Some multiplayer games have designs or modes that are not well-suited to this requirement, perhaps due to supporting device form factors with insufficient resources, or due to competitive cheating concerns, for example.

If this applies to your game, you may wish to consider using [PlayFab multiplayer servers](../servers/index.md) to host custom dedicated game logic in a dynamically-scaling cloud environment in addition to using PlayFab Party for chat communication.

#### Next steps
* [Learn about PlayFab Party objects and their relationships](understanding-party-objects.md)
* [Learn how PlayFab Party interacts with your Discovery flows](understanding-party-discovery.md)
* [Find out more about PlayFab Party chat communication](understanding-party-chat.md)
