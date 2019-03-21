---
title: Actions & Rules
author: v-thopra
description: Landing page for Actions & Rules.
ms.author: v-thopra
ms.date: 06/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, automation, actions, rules
ms.localizationpriority: medium
---

# Actions &amp; Rules

Use PlayStream Rules to react to PlayStream Events in real time. A Rule consists of exactly one Trigger, an optional list of conditions, and one or more actions to take when that trigger is activated.

For example, if you want to send a reward to your players and send a them a notification when they have more than 10,000 XP you could:

1. Define a [Segment](../../analytics/segmentation/index.md) for your users called “High XP Players” and set the criteria as XP >= 10,000.
2. Create a rule that is triggered by the PlayStream event of those players moving into the High XP Players segment.
3. Set two actions for that rule:
   1. Grant virtual currency to the player in the segment.
   2. Send a push notification to congratulate the player and let them know what they've received.

## Links

- [Actions &amp; Rules quickstart](quickstart.md)
- [Actions &amp; Rules tutorials](tutorials.md)
