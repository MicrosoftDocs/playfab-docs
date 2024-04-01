---
title: Tournaments & Leaderboards
author: joannaleecy
description: Landing page for Tournaments and& Leaderboards.
ms.author: joanlee
ms.date: 07/12/2018
ms.topic: article
ms.service: playfab
keywords: playfab, social, tournaments, leaderboards
ms.localizationpriority: medium
---

# Leaderboards

Using event or tournament leaderboards are great ways of increasing engagement within your game. Using PlayFab, you can easily set up a recurring tournament that awards prizes to the winners, reaches out to the participants, and gets your players coming back into your game to try and get the highest score.

> [!IMPORTANT]
> Teams are invited to request access to our Private Preview of "Leaderboards v2". Find the latest, here: [PlayFab](https://developer.microsoft.com/en-us/games/articles/tags/playfab/).

## What are Leaderboards? 

Leaderboards are essentially rankings of entities such as players, groups, or items. A leaderboard ranks a list of entities based on their respective values. For example, “High Scores” is one of the most common implementations of leaderboards.

## Why use Leaderboards?

Leaderboards encourage competition among players of your game, and create incentives for the players to get better at the game. Adopting leaderboards allows players to keep up with each other and facilitates building a community. It can also result in players spending more time with the game and higher retention.

## Tournaments 

### Designing your tournament

When creating your tournament it is important to design your game play with the following four items in mind:

1. **How are you going to advertise the tournament to your players?**  

    Look to use [Engagement](/gaming/playfab/#pivot=documentation&panel=engagement) features to promote the tournament to players - both before it begins and while the competition is on.

2. **What are you trying to get your players to do?**  

    Make sure you have a game play that is engaging, and brings your players back. Are they trying to clear the most levels, beat the most monsters or get the highest score?  Depending on your engagement goals, you will identify the statistic that drives the tournament. Your game will send the statistic updates to PlayFab, and you can use the leaderboards to always show your players where they stand.

3. **What ends your tournament?**  

    Is your tournament an ongoing daily or weekly event?  If so, you can configure your leaderboard to reset automatically. If not, you will need to define what ends your tournament -- and trigger the [resetting of the statistic manually](using-resettable-statistics-and-leaderboards.md).

4. **How are you going to reward your players?**  

    When the tournament ends use [prize tables](using-prize-tables.md) to grant your players awards, in game currency and bragging rights. Remember to notify your players of all of the great rewards they have won (and bring them back into your game)!
