---
title: Player Data
author: v-thopra
description: Landing page for Player Data.
ms.author: v-thopra
ms.date: 06/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, player data
ms.localizationpriority: medium
---

# Player Data

Player information and game state is stored in the cloud, so data is never lost. This allows a player to share across multiple devices and  multiple games.

There are two models for storing player data:

- [Entity](../entities/index.md): Allows you to store data in objects and files across Players, Characters, and Groups.
- [UserData](quickstart.md): Allows you to store name/value pair data for players.

It is recommended that **all** new Titles utilize [Entity objects](entity-objects.md), as that will give the most flexibility and performance for your game.
