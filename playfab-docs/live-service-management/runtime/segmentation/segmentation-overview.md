---
title: Segmentation
author: joannaleecy
description: Landing page for Segmentation.
ms.author: joanlee
ms.date: 06/12/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, segmentation
ms.localizationpriority: medium
---

# Segmentation

Segmentation lets you create targeted groups of players based on their player properties. When PlayStream events are processed, your configuration drives the addition of players into and out of the segments you define.

This all happens in real time - so there should be no perceptual lag, even at large scale. If you can tie an event to the thing you want to use as a differentiating factor, you can make a segment for it, and that segment will apply retroactively to *all* players, based on the data in their profiles.

Let's say that you want to define a segment of players where XP > 3,000, then every player with XP > 3,000 will now be in that segment.

In the example shown below, this particular segment is evaluated anytime the statistic called **Total_XPGained** changes. If the condition (> 3000) evaluates to **true**, then the player enters the **High XP Players** segment, and the corresponding action(s) will be triggered.

In this case, it sends a push notification, and grants gold to the player.

> [!NOTE]
> You can also trigger a different custom action(s) when the player leaves a segment, allowing you to make any other required changes as a result.

There are various basic actions available, including granting an item to the player, granting virtual currency, changing a statistic, banning a player, sending a player an email or sending a Push notification. You can also trigger custom CloudScript to be run instead.