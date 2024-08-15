---
title: Actions & Rules
author: joannaleecy
description: Landing page for Actions & Rules.
ms.author: joanlee
ms.date: 06/12/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, automation, actions, rules
ms.localizationpriority: medium
---

# Actions and rules

Use PlayStream Rules to react to PlayStream events in real time. A Rule consists of:

- Only one Trigger
- An optional list of conditions
- One or more actions to take when that trigger is activated.

For example, if you want to send a reward to your players, and send a them a notification when they have more than 10,000 XP you could:

- Define a [Segment](segmentation-overview.md) for your users called “High XP Players”, and set the criteria as **XP >= 10,000**.
- Create a rule that is triggered by the PlayStream event of those players moving into the High XP Players segment.
- Set two actions for that rule:
   1. Grant virtual currency to the player in the segment.
   2. Send a push notification to congratulate the player and let them know what they've received.

## See also

- [Actions &amp; Rules quickstart](action-rules-quickstart.md)
