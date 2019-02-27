---
title: Billing for PlayFab Parties (Bumblelion)
author: v-thopra
description: Describes the Billing plan for Bumblelion 1PP Preview (aka PlayFab Parties).
ms.author: v-thopra
ms.date: 13/12/2018
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, bumblelion, networking, pricing, billing
ms.localizationpriority: medium
---

# Billing for PlayFab Parties (Bumblelion)

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

Most PlayFab services, such as PlayStream or Matchmaking, are included with every paid PlayFab tier as part of our core offering. However, PlayFab Parties is billed on a consumption basis. This document describes the billing plan for Parties.

## What comes with your basic PlayFab Core Services package?

A basic allocation of multiplayer Party time capacity is included with every paid PlayFab tier: 100 player minutes, and 100 voice minutes, with voice chat and Speech services enabled.

## What meters are used for consumption billing?

There are three key meters used to bill additional Parties utilization:

- **Party Connectivity.** This is measured in player minutes connected to a network. Metering starts when a player creates a network or joins a network, and it stops when they have disconnected.
- **Party Voice.** This is measured in player minutes speaking. When a player is connected to a network and voice chat has been enabled, player voice chat is measured in seconds and metered.
- **Network egress.** This meters data *sent* from PlayFab's relay and voice servers. This is congruent to the aggregate amount of data that players *receive* from the network.

## Party Connectivity   

| SKU | $/player-minute connected to a network |
| --- | --- |
| Party Connectivity | $0.00006 |

## Party Voice

Usage of voice chat is priced differently if Speech Services are enabled. Speech Services enables speech-to-text transcription, speech-to-text translation, and text-to-text translation. 10% of voice minutes can leverage transcription and synthesis for free before the below meter is billed. We recommend tying activation of this capability to an ease-of-access player setting.

| SKU | $/player-minute speaking |
| --- | --- |
| Party Voice | $0.001 |
| Party Voice + Speech Services | $0.015 |

In-game chat text messages, even when text-to-text translation or text-to-speech synthesis are activated, do not drive metering and are not billed to your account.

## Network egress

At run-time you can specify which Azure region should host your network. This impacts network egress charges. 

| Zone | Regions | $/GB of Network Egress |
| --- | --- | --- |
| Zone 1 | Australia Central, Australia Central 2, West US, West US 2, West Central US, East US, North Central US, South Central US, East US 2, Central US, West Europe, North Europe, Canada East, Canada Central, France Central, UK South, UK West | $0.05 |
| Zone 2 | East Asia, Southeast Asia, Japan East, Japan West, Australia East, Australia Southeast, Central India, West India, South India, Korea Central, Korea South |  $0.08 |
| Zone 3 | Brazil South | $0.16 |


## Discounted usage for Xbox Live games

PlayFab has partnered with Xbox Live to allow game studios leveraging the Xbox Live gamer network to enjoy certain PlayFab services for free on Xbox One and PC. This includes PlayFab Parties. If you would like to take advantage of this Xbox Live subsidy, Microsoft recommends the following multiplayer design:

1. Use the Xbox Live SDK to interface with Xbox Live social capabilities like Presence, Profile Cards, and game invites.
1. Use PlayFab Matchmaking to match players.
1. Use PlayFab Parties to connect players for device-to-device networking or chat.

If you are building a cross-network game, you will need to use the equivalent social APIs from Steam, PlayStation, etc. for those platforms. However you can use the same matchmaking, networking, and chat technologies on all platforms. Usage associated with Xbox Live logged-in players will be zero-rated (see LoginWithXbox())
