---
title: Economy V2 Segment Actions
author: sranthar
description: Introduction to Segment Actions
ms.author: sranthar
ms.date: 3/13/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, catalog, segments, actions
ms.localizationpriority: medium
---

# Economy V2 Actions

Actions on player segments are crucial for empowering game developers to tailor their monetization strategies and player experiences with precision. By segmenting players based on various criteria such as location, virtual currency balance, or last logged in, developers can target specific player groups with personalized offers, promotions, and incentives. This capability allows for more effective monetization strategies, as it can deliver the right content to the right players at the right time, ultimately enhancing player engagement and driving revenue growth. Whether it's granting special rewards to loyal players, running targeted promotions for new users, or removing themed items from a players' inventory after a sale or season ends, actions on player segments provide the flexibility and control needed to optimize monetization and create compelling gaming experiences. 

There are 3 Action types available to use within Economy V2:
- **Add Inventory Item (V2)**: Enables the addition of one or more quantities of an item to players' inventory.
- **Subtract Inventory Item (V2)**: Allows the removal of one or more quantities of an item from players' inventory.
- **Delete Inventory Item (V2)**: Permits the removal of all quantities of an item from players' inventory.

## Segment Actions, Rules, and Tasks

Actions can be executed in three key areas within the PlayFab platform: **Player Segments**, **Scheduled Tasks**, and **Rules**. Each of these features allows developers to implement actions at different stages of the player's journey.

- **Player Segments**: With Player Segments, actions can be triggered based on grouping players with similar characteristics. This enables developers to target specific player groups with tailored experiences or rewards.

- **Scheduled Tasks**: Scheduled Tasks automate common game operation routines, such as adjusting store prices based on the time of day or injecting virtual currencies into the game economy daily. This ensures that in-game processes run smoothly without manual intervention.

- **Rules**: In Rules, developers can respond to PlayStream events in real-time. This feature can be used to reward players or send notifications when they achieve specific milestones, such as reaching a certain level.

## See also

* [Economy V2 overview](overview.md)
