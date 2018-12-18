---
title: PlayFab Communication Fabric bots
author: v-thopra
description: Introduces bots for PlayFab Communication Fabric.
ms.author: v-thopra
ms.date: 12/18/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking, communication fabric, bots
ms.localizationpriority: medium
---

# Bots

PlayFab Communication Fabric v1.2 introduces experimental integration with Azure-powered chat bots. These pre-baked personalities connect to the network and use voice and text to chat with 2-6 connected players.

- **Zo.** Zo helps players in cooperative game modes accomplished shared game objectives. Zo is ideal for “campaign” or “free world” modes. You can connect Zo to a network with 2-4 players.
- **Mo.** Mo helps players (on a team) in a competitive game mode, for example a 6 player vs. 6 player Team Deathmatch. With Mo, you can connect up to two bot instances to a network with 2-12 connected players, using 1 instance for each team.

Both Zo and Mo can be customized through PlayFab APIs with:

1. Different languages
2. Different voices
3. Game-specific vocabulary
4. Game-specific objectives

Using Bot APIs, your multiplayer game host can provide connected Bots continuous information on player activity and progress towards shared objectives. For example a player damaging another player can be communicated to the Bot, and the Bot can discourage that behavior (“stop killing your teammate!"). A player approaching a “key” or other accomplishment may be encouraged by the bot (“keep going, you’re close!”).

Both Zo and Mo can be configured to monitor player communication for inappropriate communication. Transcripts of worrisome communication can be automatically retained for review by your moderation team.
