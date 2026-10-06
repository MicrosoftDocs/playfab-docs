---
title: Best practices and launch checklist
author: ravarnamsft
description: A set of guidelines to make the best use of PlayFab MPS
ms.author: ravarna
ms.date: 09/30/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, servers, best practices, launch checklist
ms.localizationpriority: medium
---

# Best practices and launch checklist

Here are some best practices during various stages of the game lifecycle, to make the most of PlayFab Multiplayer Servers (MPS):

## Development

* Use the [LocalMultiplayerAgent (LMA)](https://github.com/PlayFab/MpsAgent) for iterative testing on your local workstation. This saves both time and money while also simplifying debugging since all artifacts run locally. The tool is open sourced and contributions / enhancements are always welcome. More details around using it are available [here](locally-debugging-game-servers-and-integration-with-playfab.md)

* Make your game server process exit when its game session is over, for example when the match ends or when the last connected player leaves. If your game lets players reconnect, wait for a short grace period first. MPS doesn't end a game session for you. A server stays Active until its process exits. MPS doesn't remove Active servers when your build scales down, so a server that never exits keeps using capacity that you pay for. When the process exits, MPS replaces it with a new server. For more information, see [Lifecycle of a multiplayer server](multiplayer-game-server-lifecycle.md).

* Start a timer when your server becomes Active, for example when the `ReadyForPlayers` method of the Game Server SDK (GSDK) returns `true`. If no player connects within a few minutes, exit the process. This way, a server that nobody joins, for whatever reason, doesn't stay Active indefinitely. Base the timeout on how long your players usually take to connect.

* Register a GSDK shutdown callback that does any cleanup your server needs and then exits the process. The GSDK doesn't exit the process for you. MPS calls your callback when you call the [ShutdownMultiplayerServer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.shutdownmultiplayerserver) API. Call this API only in an emergency, for example to terminate game servers that are stuck. Don't use it to end game sessions under normal circumstances. Your game servers should exit on their own, as described earlier in this section. If the process is still running 15 minutes after a shutdown request, MPS forcefully terminates it. For more information, see [Gracefully shutting down your game server](integrating-game-servers-with-gsdk.md#gracefully-shutting-down-your-game-server).

* Use [Schedules](scheduled-standby.md) to set up concrete schedules to save on standingBy server costs. For example, if all testing and validation is performed during business hours, the schedule can be set to have standingby servers only during business hours. There's no extra cost to set up schedules.

* Use [VM metrics](vm-metrics.md) or your own [profilers](attaching-a-profiler.md) to decide how many game servers to run on one VM of the size you chose. Load-test with every server on the VM Active and full of players. Servers on the same VM can be allocated, and start their game sessions, at almost the same time, so include that case in your tests. Leave CPU headroom: on a VM whose CPU is saturated, allocations can be slow or fail.

* Use [Server Logs](archiving-and-retrieving-multiplayer-server-logs.md) and [Crash Dumps](crash-dump-collection.md) for deeper analysis.

## Launch readiness

* Tailor your allocation requests towards [Build Aliases](allocating-with-build-alias.md). They help in seamless migration of game clients to newer game servers as part of server updates and can also help in managing quota issues (discussed later).

* Use the [QoS Beacons](using-qos-beacons-to-measure-player-latency-to-azure.md) to track the closest region for a game client and using that for allocations. These can also combined with [PlayFab Matchmaking](../matchmaking/index.md) to group clients with similar latencies together and allocate a server closest to them.

* Use the full breadth of PlayFab MPS geographic coverage to ensure the game servers are always located close to your players. Consider using multiple regions in a geographic area to allow for higher availability in case of regional failures. For example, having servers in NorthEurope and WestEurope and specifying both regions in the allocation request (in priority order) allows for an allocation that fails in one region to succeed in the next region on the list.

* When you allocate against a [build alias](allocating-with-build-alias.md), list every region that gives your players an acceptable experience in `PreferredRegions`, in order of preference. MPS tries your regions in that order, and the build weights only decide which build serves a request within a region. A build with a weight of 0 is never used, not even as a fallback. For details, see [Fallback to other builds and regions](allocating-with-build-alias.md#fallback-to-other-builds-and-regions).

* If [RequestMultiplayerServer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.requestmultiplayerserver) fails with the `MultiplayerServerTooManyRequests` error, none of the builds had a StandingBy server in any of the requested regions. Despite its name, this error doesn't mean that your requests are throttled. To avoid it:

  * List several nearby regions in `PreferredRegions`.
  * Set your standby servers for your expected peak.
  * Set the maximum number of servers for each build region with headroom above your expected peak. MPS doesn't create servers beyond that maximum, even when standby runs out.

* Request [quota](quota-changes.md) well before launch, for every VM family and region that your builds use. When you roll out a new build, the old and new builds use cores at the same time until the old build's servers drain, so request enough quota for both. To spread your capacity, consider putting builds that use different VM families behind the same alias, so allocations can fall back to another VM family in the same region.

* There can be cases where the virtual machine SKU for your game server isn't available in all regions where the game is set to launch. In such cases, either use aliases to split builds by SKUs and regions or use region overrides within a single build to choose a different virtual machine SKU just for those regions.

* Use [Dynamic StandingBy](dynamic-standby.md) to scale up game servers based on demand. This, combined with the default static standingBy configuration can provide a cost effective way to handle high demand during launch. 

* Set up monitoring for your game servers before launch. Turn on [VM metrics](vm-metrics.md) to see CPU, memory, disk, and network metrics for your VMs in Game Manager. For more advanced monitoring, use [VmStartupScript](vmstartupscript.md) to install your own monitoring tools on your VMs. The [VmStartupScriptGallery](https://github.com/PlayFab/VmStartupScriptGallery) repository has samples that send VM metrics and game server logs to services such as Azure Monitor, Application Insights, and Azure Data Explorer.

## Launch day

* Track the successful launch of your game with the dashboards and event streams in [PlayFab Game Manager](https://developer.playfab.com/). Take time to celebrate, you've earned it!

## Post launch

* Games tend to fall into a demand rhythm that can again be composed into [Schedules](scheduled-standby.md). Use the schedules along with [Dynamic StandingBy](dynamic-standby.md) for a cost effective, post launch game scaling.

* Use [Build Aliases](allocating-with-build-alias.md) for game server updates and shaping traffic gradually over to the new game experience.

* When you move an alias to new builds, set the standby servers of the old builds to 0 so that MPS can release their idle VMs. Delete the old builds only after their Active servers drain. Also keep the regions that your clients request in sync with the regions where the alias's builds are deployed. If none of the alias's builds is deployed in any of the requested regions, the request fails with `MultiplayerServerNotFound`.

