---
title: Billing for PlayFab Party
author: joannaleecy
description: Describes the Billing plan for PlayFab Party.
ms.author: joanlee
ms.date: 8/12/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, party, networking, pricing, billing, bumblelion
ms.localizationpriority: medium
---

# Billing for PlayFab Party
This document describes how Party is metered and billed. In PlayFab's free *Development* mode, titles can use Party without a fee as long the aggregate number of player accounts is less than 100,000 (attempts to create additional player accounts will fail). In *Production( and other pay-as-you-go modes, Party is billed by the minute and by the gigabyte without consumption limits.

Party can be used for free when powering Xbox Live activity. An example of how this discount impacts billing is below and more information tailored for Xbox Live managed partners is available at the [Xbox Live discount and FAQ](./xbl-discount.md) topic.

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

Network egress charges depend on the regions in which your Party networks are hosted.

| Zone | Regions | $/GB of Network Egress |
| --- | --- | --- |
| Zone 1 | West US, East US, North Central US, South Central US, East US 2, Central US, West Europe, North Europe | $0.05 |
| Zone 2 | East Asia, Southeast Asia, Japan East, Japan West, Australia East, Australia Southeast |  $0.08 |
| Zone 3 | Brazil South | $0.20 |

For more information about region selection, see [Selecting regions for Party networks](concepts-regions.md#selecting-regions-for-party-networks).

## Simplified billing
A simplified billing summary showing Party activity and the impact of the Xbox Live discount is below.

| SKU | Meter | Consumption | Unit | Rate (USD)| Sub-total |
| --- | --- | ----| ---- |---- |---- |
| Connectivity | General Usage | 10,000 | Minutes | $0.0001 | $1|
| Connectivity | Xbox Live | 10,000 | Minutes | Free | $0|
| Voice | General Usage | 5,000 | Minutes | $0.001 | $5|
| Voice | Xbox Live | 5,000 | Minutes | Free | $0|
| Voice + Speech Services | General Usage | 10,000 | Minutes | $0.0001 | $1|
| Voice + Speech Services | Accessibility Quota | 500 | Minutes | Free | $0|
| Voice + Speech Services | General Usage | 100 | Minutes | $0.015 | $1.5|
| Voice + Speech Services | Xbox Live | 100 | Minutes | Free | $0|
| Zone 1 Network Egress | General Usage | 100 | Gigabytes(GB) | $0.05 | $5
| Zone 1 Network Egress | Xbox Live | 100 | Gigabytes(GB) | Free | $0|
