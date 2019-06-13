---
title: Multiplayer experiences in Xbox Live games
author: v-thopra
description: Learn how to leverage PlayFab multiplayer in Xbox Live games.
ms.author: v-thopra
ms.date: 02/27/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, xbox live, party
ms.localizationpriority: medium
---

# Multiplayer discounts and guidance for Xbox Live managed partners

This page provides pricing information and guidance for Xbox Live managed partners <!-- NEED NEW LINK HERE: [Xbox Live managed partners](https://docs.microsoft.com/en-us/windows/uwp/xbox-live/get-started-with-partner/get-started-with-xbox-live-partner) --> interested in using PlayFab services to accomplish multiplayer scenarios across PC, Mobile, and Xbox One.

PlayFab and Xbox Live have collaborated to allow Xbox Live managed partners to power Xbox Live player activity with free utilization of several PlayFab services. This includes [PlayFab Matchmaking](../../features/multiplayer/matchmaking/index.md) and [PlayFab Party](../../features/multiplayer/networking/index.md), as well as other PlayFab features. If you would like to take advantage of this program we recommend the following multiplayer design:

1. Use the [Xbox Live SDK](https://docs.microsoft.com/gaming/xbox-live) to interface with Xbox Live social capabilities like Presence, Profile Cards, and game invites.
2. Use [PlayFab Matchmaking](../../features/multiplayer/matchmaking/index.md) to match players.
3. Use [PlayFab Party](../../features/multiplayer/networking/index.md) to connect players for device-to-device networking or chat.

If you are building a cross-network game, you will need to use the equivalent social APIs from Steam, PlayStation, etc. for those platforms, and comply with any platform policies governing multiplayer and cross-network activity.

However PlayFab's desire is for game studios to be able to use interoperable matchmaking, networking, and chat infrastructure on all platforms. Usage associated with Xbox Live logged-in players and complying with [Xbox requirements ("XRs")](https://developer.microsoft.com/en-us/games/xbox/partner/live-requirements) will be discounted (see `LoginWithXbox()`).
