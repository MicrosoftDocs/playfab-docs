---
title: Tournaments & Leaderboards
author: joannaleecy
description: Landing page for Tournaments and Leaderboards.
ms.author: jenelleb
ms.date: 07/12/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, social, tournaments, leaderboards
ms.localizationpriority: medium
---

# Leaderboards

Event and tournament leaderboards are great tools for increasing engagement within your game. By using PlayFab you can easily set up a recurring tournament that awards prizes to the winners, reaches out to the participants, and gets your players to come back into your game to try for a high score.

## The future of Stats and Leaderboards

Statistics and leaderboards have been critical components of many games across every genre throughout the history of the industry. Their integration into a title drives player engagement by acting as a reflection of their experience both in isolation and as it relates to a broader community. We at PlayFab have seen how you've utilized these services in unique and exciting ways. We want to better enable these experiences by providing a new set of Stats & Leaderboard APIs built with the [Entity Programming Model](../../../live-service-management/game-configuration/entities/index.md) in mind. 

> [!IMPORTANT]
> The new version of leaderboards is here: [Leaderboards v2](../index.md).

## What are Leaderboards? 

Leaderboards are essentially rankings of entities such as players, groups, or items. A leaderboard ranks a list of entities based on their respective values. For example, "High Scores" is one of the most common implementations of leaderboards.

## Why Use Leaderboards?

Leaderboards encourage competition among players of your game, and create incentives for the players to get better at the game. Adopting leaderboards allows players to keep up with each other and facilitates building a community. It can also result in players spending more time with the game and higher retention.

## Tournaments 

### Designing your tournament

When creating your tournament, it's important to design your game play with the following four items in mind:

1. **How are you going to advertise the tournament to your players?**  

    Look to use [Engagement](../../../live-service-management/game-configuration/title-communications/overview.md) features to promote the tournament to players - both before it begins and while the competition is on.

2. **What are you trying to get your players to do?**  

    Make sure you have a game play loop that is engaging, and encourages your players to come back. Are they trying to clear the most levels, beat the most monsters or get the highest score? Depending on your engagement goals, you'll identify the statistic that drives the tournament. Your game will then send the statistic updates to PlayFab, and you can use the leaderboards to always show your players where they stand.

3. **What ends your tournament?**  

    Is your tournament an ongoing daily or weekly event? If so, you can configure your leaderboard to reset automatically. If not, you need to define what ends your tournament and trigger the [resetting of the statistic manually](using-resettable-statistics-and-leaderboards.md).

4. **How are you going to reward your players?**  

    When the tournament ends use [prize tables](using-prize-tables.md) to grant your players awards, in game currency and bragging rights. Remember to notify your players of all of the great rewards they won (and bring them back into your game)!
