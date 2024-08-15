---
title: Best practices and launch checklist
author: ravarnamsft
description: A set of guidelines to make the best use of PlayFab MPS
ms.author: ravarna
ms.date: 08/12/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, servers, best practices, launch checklist
ms.localizationpriority: medium
---

# Best practices and launch checklist

Here are some best practices during various stages of the game lifecycle, to make the most of PlayFab MPS:

## Development

* Use the [LocalMultiplayerAgent (LMA)](https://github.com/PlayFab/MpsAgent) for iterative testing on your local workstation. This saves both time and money while also simplifying debugging since all artifacts run locally. The tool is open sourced and contributions / enhancements are always welcome. More details around using it are available [here](locally-debugging-game-servers-and-integration-with-playfab.md)

* Use [Schedules](scheduled-standby.md) to set up concrete schedules to save on standingBy server costs. For example, if all testing and validation is performed during business hours, the schedule can be set to have standingby servers only during business hours. There's no extra cost to set up schedules.

* Use [VmMetrics](vm-metrics.md) or your own [Profilers](attaching-a-profiler.md) to determine how many game servers can be packed within a single virtual machine in the SKU of your choice.

* Use [Server Logs](archiving-and-retrieving-multiplayer-server-logs.md) and [Crash Dumps](crash-dump-collection.md) for deeper analysis.

## Launch Readiness

* Tailor your allocation requests towards [Build Aliases](allocating-with-build-alias.md). They help in seamless migration of game clients to newer game servers as part of server updates and can also help in managing quota issues (discussed later).

* Use the [QoS Beacons](using-qos-beacons-to-measure-player-latency-to-azure.md) to track the closest region for a game client and using that for allocations. These can also combined with [PlayFab Matchmaking](../matchmaking/index.md) to group clients with similar latencies together and allocate a server closest to them.

* Use the full breadth of PlayFab MPS geographic coverage to ensure the game servers are always located close to your players. Consider using multiple regions in a geographic area to allow for higher availability in case of regional failures. For example, having servers in NorthEurope and WestEurope and specifying both regions in the allocation request (in priority order) allows for an allocation that fails in one region to succeed in the next region on the list.

* Ensure you've requested and have the [Quota](quota-changes.md) approved for the virtual machine SKU(s) that you have selected for your game servers.

* There can be cases where the virtual machine SKU for your game server isn't available in all regions where the game is set to launch. In such cases, either use aliases to split builds by SKUs and regions or use region overrides within a single build to choose a different virtual machine SKU just for those regions.

* Use [Dynamic StandingBy](dynamic-standby.md) to scale up game servers based on demand. This, combined with the default static standingBy configuration can provide a cost effective way to handle high demand during launch. 

## Launch Day

* Track the successful launch of your game with the dashboards and event streams in [PlayFab Game Manager](https://developer.playfab.com/). Take time to celebrate, you've earned it!

## Post Launch

* Games tend to fall into a demand rhythm that can again be composed into [Schedules](scheduled-standby.md). Use the schedules along with [Dynamic StandingBy](dynamic-standby.md) for a cost effective, post launch game scaling.

* Use [Build Aliases](allocating-with-build-alias.md) for game server updates and shaping traffic gradually over to the new game experience.

