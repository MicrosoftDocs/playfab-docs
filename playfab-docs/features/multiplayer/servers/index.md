---
title: Servers
author: joannaleecy
description: Overview of PlayFab's multiplayer server hosting service.
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab. multiplayer, servers
ms.localizationpriority: medium
---

# Multiplayer Servers

PlayFab Multiplayer Servers (MPS) is a server hosting service optimized for games. It enables you to dynamically scale custom game servers according to demand. 

Our servers are built on Azure Compute so it is a global distributed cloud service that offers a broad range of compute capacity.

As a PlayFab customer, you can access our service and use a limited, free quota of multiplayer servers for product evaluation and testing.

## Features

* Server infrastructure optimized for hosting multiplayer games
* Cloud compute capacity that scales on demand
* Multiple ways to manage scaling. Faster response time with the ability to schedule, dynamically, and programmatically change the number of standby servers
* Consistent test and production environment for game servers as they run as containerized applications
* Deploy Windows or Linux game servers
* VMs are built on global distributed Azure Compute services for low latencies
* Full-fledged identity solution with managed end-point protection
* Wide range of compute capacities for desired gaming experience
* Works well with other PlayFab LiveOps and multiplayer features

## How to use the service

These are the typical steps to use PlayFab Multiplayer Servers.

If you are still in the early stages of development but want to evaluate or learn how to use this feature, see [Create your first server](create-your-first-server.md). This topic uses our samples to walk you through the process of deploying servers using our service.

1. [Author a game server build](using-playfab-servers-to-host-games.md#1-author-a-game-server-build)
2. [Deploy a VM build](using-playfab-servers-to-host-games.md#2-deploy-a-build)
3. [Scale game servers](using-playfab-servers-to-host-games.md#3-scale-game-servers)
4. [Measure player latency](using-playfab-servers-to-host-games.md#4-measure-player-latency-to-azure-regions)
5. [Request game servers](using-playfab-servers-to-host-games.md#5-request-game-servers)
6. [Connect and play](using-playfab-servers-to-host-games.md#6-connect-and-play)

## See also

* [Using PlayFab Multiplayer Servers to host multiplayer games](using-playfab-servers-to-host-games.md)
* [Create your first server](create-your-first-server.md)
* [Terminology](server-terms.md)
* [PlayFab Multiplayer Server SDKs](server-sdks.md)
* [PlayFab Multiplayer Server API reference](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)