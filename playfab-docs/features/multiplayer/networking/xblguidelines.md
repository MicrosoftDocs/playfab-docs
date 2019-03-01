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

This tutorial provides recommendations for Xbox Live games interested in using PlayFab services to accomplish multiplayer scenarios across PC, Mobile, and Xbox One.

PlayFab has partnered with Xbox Live to allow game studios leveraging the Xbox Live identity and gaming community to enjoy certain PlayFab services for free. This includes Matchmaking and Parties, as well as other services<!-- (TBD link)-->. If you would like to take advantage of this program, Microsoft recommends the following multiplayer design:

1. Use the [Xbox Live SDK](https://docs.microsoft.com/en-us/windows/uwp/xbox-live/developer-program-overview) to interface with Xbox Live social capabilities like Presence, Profile Cards, and game invites. 
2. Use PlayFab Matchmaking to match players.
3. Use PlayFab Parties to connect players for device-to-device networking or chat.

If you are building a cross-network game, you will need to use the equivalent social APIs from Steam, PlayStation, etc. for those platforms. However you can use the same matchmaking, networking, and chat technologies on all platforms. Usage associated with Xbox Live logged-in players will be zero-rated (see [LoginWithXbox()](xref:
titleid.playfabapi.com.client.authentication.loginwithxbox)).

Xbox Live does not recommend new titles use Xbox Live SmartMatch, Game Chat 2, or Xbox Integrated Multiplayer (XIM). These products receive limited support, discourage cross-network play, and may be deprecated in the future.
