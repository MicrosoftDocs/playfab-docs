---
title: Segmentation
author: v-thopra
description: Landing page for Segmentation.
ms.author: v-thopra
ms.date: 06/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, segmentation
ms.localizationpriority: medium
---

# Segmentation

Segmentation lets you create targeted groups of players based on player properties. Upon PlayStream events being processed, your configuration will drive the addition of players into and out of the segments you define. This all happens in real time -- there should be no perceptual lag, even at large scale. If you can tie an event to the thing you want to use as a differentiating factor, you can make a segment for it, and segments will apply retroactively to all players, based on the data in their profiles -- so if you define a segment of players where XP > 3,000, then every player with XP > 3,000 will now be in that segment.

![High XP Segment Definition](media/playstream-segment-highxp.png)

For example, this particular segment will be evaluated anytime the statistic called "Total_XPGained" changes. If the condition (> 3000) evaluates to true, then the player will enter the “High XP Players" segment, and the corresponding action(s) will be triggered -- in this case, it will send a push notification, and grants gold to the player. You can also trigger a different custom action(s) when the player leaves a segment, allowing you to make any other changes needed as a result.

There are a variety of basic actions available, including granting an item to the player, granting virtual currency, changing a statistic, banning a player, sending a player an email or sending a Push notification. You can also trigger custom CloudScript to be run instead.
