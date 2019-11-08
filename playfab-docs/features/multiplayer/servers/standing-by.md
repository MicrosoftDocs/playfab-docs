---
title: Managing standing by servers
author: tophpalmer
description: Managing standing by servers
ms.author: chpalm
ms.date: 10/18/2019
ms.topic: article
ms.prod: playfab
keywords: playfab. multiplayer, servers
ms.localizationpriority: medium
---
# Managing standing by servers
A key benefit of using PlayFab multiplayer servers or other orchestrators is fulfilling player demand efficiently. Ideally you would only consume as much cloud compute as necessary to power active player activity. The reality is that  multiplayer servers spend some time in the following non-active states:

- **Pre-propping**. Azure and PlayFab must create the virtual machine, initialize its operating system, and configure its environment. PlayFab drives this pre-propping activity before the virtual machine is assigned to a customer and billed.
- **Propping**. The game servers assets must be loaded, and the game server application itself often need some time to prepare for players. 
- **Standing by**. In order to immediately fulfill demand for a multiplayer server, some servers are kept idle ready for players constantly.

Servers in the propping and standing-by states are billed to your title, and you will want to optimize these processes to reduce costs. You configure standing-by targets on a per build and per region basis. Typically you should set the standing-by level proportionally to the propping time and target allocation rate:

```
(Propping Time + Server time to standing by) * Target Allocation Rate  = Standing By Target 
```

Let's take an example of a Linux server that takes 100 seconds to prop, and a game that is expected to have up to 1 server allocated every 5 seconds (0.2 Servers / Second). A standing by pool of 100 * 0.2 = 20 servers will stably support this build. After 100 seconds, 20 servers will be expended but there will have been time to build another 20. 

When calling the `RequestMultiplayerServer` API, it is important to indicate all of the regions that are acceptable to the player experience. If region #1 does not have standing by servers available, than region #2 will be requested and so on. 

## Dynamic Pool Starvation Prevention (Auto On-Call)
Setting a static standby level requires setting a standby target that is sufficient to meet the allocation rate at the busiest part of the day even if that allocation rate is only hit during one hour out of the day. When a region is off peak, this standby level is likely much higher than necessary. In addition, even if you have a good idea of the peak allocation rate at your game's steady state, marketing events and other community drivers can cause player activity to significantly burst server demand to 2x or even 10x the average allocation rate.

To handle these fluctuations in allocation rate, the Dynamic Standby feature can increase the standby target in reaction to increased demand. When activated on a build, the dynamic standby feature monitors the standby pool. When the pool drops below certain thresholds, dynamic standby will increase the target standing-by target automatically to more aggressively rebuild the pool.

When allocation rates fall to a supportable rate, the standby levels will approach the target and the Dynamic Standby feature will ramp down the target level to the pre-configured floor.


