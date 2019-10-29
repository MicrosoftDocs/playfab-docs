---
title: Billing for PlayFab Party
author: v-thopra
description: Describes the Billing plan for PlayFab Party. 
ms.author: v-thopra
ms.date: 8/12/2019
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, party, networking, pricing, billing, bumblelion
ms.localizationpriority: medium
---

# Billing for PlayFab Party

> [!IMPORTANT]
> This feature is currently in **Private Preview**.
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.
>
> Access to this feature is restricted to select titles. If you are interested in this feature, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

Most PlayFab services, such as PlayStream or Matchmaking, are included with every paid PlayFab tier as part of our core offering. However, PlayFab Party is billed on a consumption basis. This document describes the billing plan for Party.

## What comes with your basic PlayFab Core Services package?

A basic allocation of Party time is included with every paid PlayFab tier: 100 player minutes, and 100 voice minutes.

## What meters are used for consumption billing?

There are three key meters used to bill additional Party utilization:

1. **Party connectivity.** This is measured in player minutes connected to a network. Metering starts when a player creates a network or joins a network, and it stops when they have disconnected.
2. **Party voice.** This is measured in player minutes speaking. When a player is connected to a network and is actively speaking, that player voice activity is measured in seconds and metered.
3. **Network egress.** This meters data *sent* from PlayFab's relay and voice servers. This is congruent to the aggregate amount of data that players *receive* from the network.

## Party connectivity

| SKU | $/player-minute connected to a network |
| --- | --- |
| Party Connectivity | $0.0001 |

## Party voice

Usage of voice chat is priced differently if Speech Services are enabled. Speech Services enables speech-to-text transcription, speech-to-text translation, and text-to-text translation.

10% of voice minutes can leverage transcription and synthesis for free before the below-meter is billed. We recommend tying activation of this capability to an ease-of-access player setting.

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
