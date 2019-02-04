---
title: Billing for PlayFab Multiplayer Communications Fabric (Bumblelion)
author: v-thopra
description: Describes the Billing plan for Bumblelion 1PP Preview (aka PlayFab Multiplayer Communications Fabric).
ms.author: v-thopra
ms.date: 13/12/2018
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, bumblelion, networking, pricing, billing
ms.localizationpriority: medium
---

# Billing for PlayFab Multiplayer Communications Fabric (Bumblelion)

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

Most PlayFab services, such as PlayStream or Multiplayer Matchmaking, are included with every paid PlayFab tier as part of our core offering. However, PlayFab Multiplayer Servers and Multiplayer Communications Fabric are billed on a consumption basis. This document describes the billing plan for Communications Fabric.

## What comes with your basic PlayFab Core Services package?

A basic allocation of multiplayer fabric time capacity is included with every paid PlayFab tier: 100 player minutes, and 100 voice minutes, with voice chat and cognitive services enabled.

## What meters are used for consumption billing?

There are three key meters used to bill additional Communications Fabric utilization:

- **Fabric Connectivity.** This is measured in player minutes connected to a network. Metering starts when a player creates a network or joins a network, and it stops when they have disconnected.
- **Fabric Voice.** This is measured in player minutes speaking. When a player is connected to a network and voice chat has been enabled, player voice chat is measured in seconds and metered.
- **Network egress.** This meters data *sent* from PlayFab's relay and voice servers. This is congruent to the aggregate amount of data that players *receive* from the network.

## Fabric Connectivity   

| SKU | $/player-minute connected to a network |
| --- | --- |
| Fabric Connectivity | $0.0001 |

## Fabric Voice

Usage of voice chat is priced differently if Cognitive Services are enabled. Cognitive Services enables speech-to-text transcription, speech-to-text translation, and text-to-text translation. 10% of voice minutes can leverage transcription and synthesis for free before the below meter is billed. We recommend tying activation of this capability to an ease-of-access player setting.

| SKU | $/player-minute speaking |
| --- | --- |
| Fabric Voice | $0.001 |
| Fabric Voice + Cognitive Services | $0.015 |

In-game chat text messages, even when text-to-text translation or text-to-speech synthesis are activated, do not drive metering and are not billed to your account.

## Network egress

At run-time you can specify which Azure region should host your network. This impacts network egress charges. 

| Zone | Regions | $/GB of Network Egress |
| --- | --- | --- |
| Zone 1 | Australia Central, Australia Central 2, West US, West US 2, West Central US, East US, North Central US, South Central US, East US 2, Central US, West Europe, North Europe, Canada East, Canada Central, France Central, UK South, UK West | $0.05 |
| Zone 2 | East Asia, Southeast Asia, Japan East, Japan West, Australia East, Australia Southeast, Central India, West India, South India, Korea Central, Korea South |  $0.08 |
| Zone 3 | Brazil South | $0.16 |
