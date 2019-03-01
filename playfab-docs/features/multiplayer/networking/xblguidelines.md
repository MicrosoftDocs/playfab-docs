---
title: Multiplayer experiences in Xbox Live games
author: v-thopra
description: Learn how to leverage PlayFab multiplayer in Xbox Live games.
ms.author: v-thopra
ms.date: 02/27/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, xbox live
ms.localizationpriority: medium
---

# Recommendations for Xbox Live games building multiplayer experiences 

This tutorial provides recommendations for [Xbox Live managed partners](https://docs.microsoft.com/en-us/windows/uwp/xbox-live/get-started-with-partner/get-started-with-xbox-live-partner) interested in using PlayFab services to accomplish multiplayer scenarios across PC, Mobile, and Xbox One.

PlayFab and Xbox Live have colloborated to allow Xbox Live managed partners to power Xbox Live player activity with free utilization of several PlayFab services. This includes PlayFab Matchmaking and PlayFab Parties, as well as other PlayFab features<!-- (TBD link)-->. If you would like to take advantage of this program we recommend the following multiplayer design:

1. Use the [Xbox Live SDK](https://docs.microsoft.com/en-us/windows/uwp/xbox-live/developer-program-overview) to interface with Xbox Live social capabilities like Presence, Profile Cards, and game invites. 
2. Use PlayFab Matchmaking to match players.
3. Use PlayFab Parties to connect players for device-to-device networking or chat.

If you are building a cross-network game, you will need to use the equivalent social APIs from Steam, PlayStation, etc. for those platforms, and comply with any platform policies governing multiplayer and cross-network activity. However PlayFab's desire is for game studios to be able to use interoperable matchmaking, networking, and chat infrastructure on all platforms. Usage associated with Xbox Live logged-in players and complying with [Xbox requirements ("XRs")](https://developer.microsoft.com/en-us/games/xbox/partner/live-requirements) will be zero-rated (see [LoginWithXbox()).
