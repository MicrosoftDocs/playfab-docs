---
title: What are rewarded Ads?
author: fprotti96
description: Overview of rewarded Ads.
ms.author: fprotti
ms.date: 02/20/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, rewarded ads
ms.localizationpriority: medium
---

# Rewarded ads
Rewarded video ads are a popular monetization strategy in free-to-play games. They offer players the option to watch a short video in exchange for in-game rewards, such as currency or special items. This approach not only generates revenue but also enhances player engagement.

## What is an ad placement?
An ad placement consists of a list of defined rewards to grant once a player watches an ad. You control the odds of a player receiving a randomized reward by giving each reward a different weight, which determines the likelihood of a player receiving that reward. (For example, a rare item might have a lower weight compared to common currency.) Additional customization is available by setting a limit on the number of times a player can be rewarded for watching an ad, this is crucial for maintaining game balance and encouraging daily engagement. For example, it's common to set a limit of 3 times per day, per player.

> [!TIP]
> Additionally, leverage player [Segments](../../live-service-management/game-configuration/segmentation/segmentation-overview.md) to set overrides that allow different groups of players to receive different rewards. For example, reward your VIP players with a special item while other players are rewarded with currency. 

## Why use rewarded ads?
Rewarded ads create incentives for players to engage regularly with your game and offer them greater control over how they choose to engage with in-game advertising. This can lead to increased playtime, higher retention rates, and ultimately, greater revenue.

Incorporating rewarded ads into your game can significantly boost player engagement and revenue. By carefully designing ad placements and leveraging player segments, you can create a rewarding experience for your players while achieving your monetization goals.