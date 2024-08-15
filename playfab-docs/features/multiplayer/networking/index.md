---
title: Azure PlayFab Party overview
author: joannaleecy
description: Learn about Azure PlayFab Party real-time chat and data communication libraries for your game.
ms.author: joanlee
ms.date: 10/13/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, party
ms.localizationpriority: medium
---

# Azure PlayFab Party overview

Azure PlayFab Party is a low-latency chat and data communication solution for cross-platform and cross-device multiplayer games. The voice and text features in Party can be used as a standalone chat solution.

For multiplayer games that use a server-client authoritative architecture to curtail competitive cheating concerns or support devices with limited resources, consider multiplayer servers like [PlayFab multiplayer servers](../servers/index.md) to host custom, dedicated game logic in a dynamically scaling cloud environment and use Party for chat communication.

This topic provides a high-level overview of Party features. For details, see [Party features](party-features.md).  

## Features

Party is designed for use on many platforms like Android, iOS, Linux, Nintendo Switch, PlayStation&#174;, PC, and Xbox. Party also provides C/C++ SDKs and SDKs for use with game engines like Unity and Unreal. For a complete list, see [Party SDKs](party-sdks.md).

* [Interoperable multiplayer infrastructure](party-features.md#interoperable-multiplayer-infrastructure)
    * Cross-network/cross-platform multiplayer game experiences.
* [Low-latency secure data communication](party-features.md#low-latency-secure-data-communication)
    * Industry-standard encryption and authentication.
    * Cross-platform mesh: automatic low-latency cloud relay or select regions yourself, choosing from Azure regions distributed across the globe
    * Direct peer-to-peer functionality.
    * Background Quality of Service (QoS) measurements.
* [Flexible topology design possibilities](party-features.md#flexible-topology-design-possibilities)
    * Everyone-to-everyone.
    * Constrained to "teams" or game-defined "channels" and more.
* [Accessible voice and text chat](party-features.md#accessible-voice-and-text-chat)
    * Real-time speech-to-text and text-to-speech.
    * Real-time translation for text and voice by using Azure Cognitive Services.
    * Ability to add real-time custom voice effects like spatial sound.
* [Capabilities designed for multiplayer games](party-features.md#capabilities-designed-for-multiplayer-games)
    * Efficient game states and logic delivery.
    * Integrates with custom discovery systems&mdash;players finding other players.
    * Policy enforcement for connectivity and communication.

Party is a managed game service. Discounts are available when you use Party with Xbox Live. For pricing information, see [PlayFab pricing](https://playfab.com/pricing/). To learn about the meters that drive billing, see [Party pricing](../../pricing/meters/meters.md#party).

If you are interested, here is a video of our presentation at Microsoft Game Dev 2021. The presentation explains the above Party features in greater detail with demos and includes a quickstart tutorial. 

> [!VIDEO https://www.youtube.com/embed/z40-nBJsc74]

“PlayStation” is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## See also

* [Party features](party-features.md)
* [Party Quickstart](quickstart.md)
* [Multiplayer servers](../servers/index.md)
* [Multiplayer](../mpintro.md)
* [Matchmaking](../matchmaking/index.md)
* [Party and direct peer-to-peer connections](concepts-direct-peer-connectivity.md)
