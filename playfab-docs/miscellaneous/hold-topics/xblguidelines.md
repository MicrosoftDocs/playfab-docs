---
title: Multiplayer experiences in Xbox Live games
author: joannaleecy
description: Learn how to leverage PlayFab multiplayer in Xbox Live games.
ms.author: joanlee
ms.date: 02/27/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, xbox live, party
ms.localizationpriority: medium
---

# Multiplayer discounts and guidance for Xbox Live managed partners

This page provides pricing information and guidance for Xbox Live managed partners <!-- NEED NEW LINK HERE: [Xbox Live managed partners](https://learn.microsoft.com/windows/uwp/xbox-live/get-started-with-partner/get-started-with-xbox-live-partner) --> interested in using PlayFab services to accomplish multiplayer scenarios across PC, Mobile, and Xbox One.

PlayFab and Xbox Live have collaborated to allow Xbox Live managed partners to power Xbox Live multiplayer activity with several services at zero cost. This includes [PlayFab Matchmaking](../../features/multiplayer/matchmaking/index.md) and [PlayFab Party](../../features/multiplayer/networking/index.md). If you would like to take advantage of this program we recommend the following multiplayer design:

1. Use the [Xbox Live SDK](/gaming/gdk/_content/gc/live/get-started/live-xbl-overview) to interface with Xbox Live social capabilities like Presence, Profile Cards, and game invites.
2. Use [PlayFab Matchmaking](../../features/multiplayer/matchmaking/index.md) to match players.
3. Use [PlayFab Party](../../features/multiplayer/networking/index.md) to connect players for device-to-device networking or chat.

If you are building a cross-network game, you will need to use the equivalent social APIs from Steam, PlayStation&#174;, etc. for those platforms, and comply with any platform policies governing multiplayer and cross-network activity.

PlayFab's desire is for game studios to be able to use interoperable matchmaking, networking, and chat infrastructure on all platforms. Usage associated with Xbox Live logged-in players and complying with [Xbox Live Integration Policies](https://aka.ms/XboxLivePolicy) will be discounted (see `LoginWithXbox()`).

“PlayStation” is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## What if a PlayFab Party has a mix of Xbox Live and non-Xbox Live players?

The consumption meters used to bill PlayFab Party are player-oriented or can be associated with a specific player: player network-minutes, player voice-minutes, network egress etc. Xbox Live players will not increment these meters and effectively be zero rated. Other usage will be billed normally.

## Are there limits to PlayFab Party usage? 

There are reasonable limits enforced by the PlayFab terms of service (e.g. unnecessary usage that threatens the reliability of the service will be rate-limited). However the discount can be used for very large games with millions of Party minutes or Matchmaking tickets per month.

10% of voice minutes can leverage transcription, translation, and synthesis for free. Additional usage will be billed normally. 
