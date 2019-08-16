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
> Access to this feature is restricted to select titles, with SDKs available for Windows 10 PCs and Xbox One. Interoperable SDKs for iOS,  Android, and Nintendo Switch are available now. If you are interested in this feature, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com).

PlayFab Party is a set of libraries and services for easily adding multiplayer real-time networking and chat communication to your game.

Multiplayer games are typically one of two designs:

1. Authoritative
2. Non-authoritative

Authoritative games have a central authority for game state, this may be a player device or [a cloud-hosted dedicated server](../servers/index.md).

Non-authoritative designs require player devices to synchronize game state cooperatively, over a peer-to-peer network.

Party is an ideal, secure, low latency transport for non-authoritative designs and authoritative designs where a cloud hosted dedicated server is not desired. Party is also well suited to add voice and text communication to non-gameplay social experiences your app may provide (e.g. in-game squad experiences, or post-game lobbies).

Party utilizes Azure Cognitive Services to transcribe player voice chat and synthesize speech for text messages. This functionality has several uses, but was primarily designed as an accessibility aide. Typical usage of Party voice chat is billed on a per-minute basis, and up to 10% of those voice minutes can leverage transcription and synthesis for free. We recommend tying activation of this capability to an ease-of-access player setting.

Party can not only transcribe player chat, but also translate chat in real time. In anonymous matchmaking and international competitive games, these transcription and translation capabilities can make for a more engaging multiplayer experience.

One of the goals of PlayFab Party (and our other multiplayer services), is to facilitate interoperable multiplayer infrastructure and cross-network gameplay. We encourage customers to verify that their multiplayer experiences comply with relevant platform policies for multiplayer and cross-network player activity.

## Key Resources

- [Windows 7 (Win32 C++), Windows 10 (Win32 C++), and Xbox One (XDK C++) nuget packages](https://www.nuget.org/profiles/PlayFab)
- [Windows 10 and Xbox One sample (BumbleRumble)](https://github.com/PlayFab/PlayFab-Samples/tree/master/Samples/All/BumbleRumble)

## Roadmap

| | March 2019 | August 2019 |
|-|-|-|
|Project Phase | Private Preview | Public Preview|
| SLA | Non-Production | Production |
| API | Breaking Changes | Stable |
|Platforms | Win 10, Win 7, Xbox One | Win 10, Win 7, Xbox One, iOS, Android, Nintendo Switch |
|Pricing | Free | 30% Discount |

## Features

- **Encryption and authentication.** Party authenticates player devices using their PlayFab player identity and encrypts data with a DTLS-like protocol.
- **Device to device datagram networking.** At the core of Party are relays that are hosted globally across the Azure cloud. Player devices use these relays to create Party networks and send game data to one another.
- **Voice and text chat.** Player devices can bind audio devices to Party networks to accomplish real-time voice chat. Text chat messages between players are also supported.
- **Speech-to-text and voice synthesis.** Party can transcribe player voice chat and synthesize utterances for text message. This functionality has several uses, but was primarily designed as an accessibility aide.
- **Real-time translation.** Party can understand and synthesize real-time translations of player voice and text chat.

## Concepts

PlayFab Party is oriented around a few key concepts:

- **Network** - A logical representation of a set of interconnected devices participating in a particular multiplayer experience, as well as basic state describing that collection.
- **Endpoint** - A facility associated with a device that can receive data from other devices and is the source for sending data to other devices.
- **State change** - A structure representing a notification to the local device regarding an asynchronous change in some aspect of the network.
- **StartProcessingStateChanges** and **FinishProcessingStateChanges** - The pair of methods called by the app every UI frame to perform asynchronous operations, to retrieve results to be handled in the form of `PartyStateChange` structures, and then to free the associated resources when finished.

At a very high level, the game application uses the PlayFab Party library to configure a set of users signed-in on the local device to be moved into a PlayFab network. The app calls `StartProcessingStateChanges()` and `FinishProcessingStateChanges()` every UI frame.

As app instances on remote devices add their users into a network, every participating instance is provided `PartyStateChange` updates describing the local and remote devices joining that network. When a player stops participating in the network (gracefully or due to network connectivity problems), `PartyStateChange` updates are provided to all app instances indicating the user and associated endpoints have left.

As opposed to a client-server model, a PlayFab network is logically a fully-connected mesh of peer devices.

To learn about PlayFab Party features, common concepts, and how they fit together, see the [Understanding PlayFab Party](concepts-overview.md) topic.

For details on parameters, return values, and behaviors when invoking the libraries, see the [PlayFab Party API Reference Documentation](party-reference.md) topic.

To read best practices for user experiences and Microsoft's recommendations around chat and data communication user interfaces, see the [PlayFab Party UX Guidelines](party-ux-guidelines.md) topic.

For information on where to get client libraries and details on service pricing, see the [PlayFab Party Availability and Pricing](party-availability-and-pricing.md) topic.
