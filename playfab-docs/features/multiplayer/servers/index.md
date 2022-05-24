---
title: Servers
author: joannaleecy
description: Overview of PlayFab's multiplayer server hosting service.
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.prod: playfab
keywords: playfab. multiplayer, servers
ms.localizationpriority: medium
---

# Multiplayer Servers

PlayFab Multiplayer Servers (MPS) is a server-hosting service optimized for games. It enables you to dynamically scale custom game servers according to demand. Because MPS is built on Azure Compute, it is part of a globally distributed cloud service that offers many capabilities.

As a PlayFab customer, you can access MPS and use its free quota to evaluate and test products.

## Features of MPS

* Server infrastructure optimized for hosting multiplayer games
* Cloud capacity that scales on demand
* Multiple ways to manage scaling
* Faster response time
* Capability to schedule tasks dynamically
* Capability to programmatically change the number of standby servers
* Availability of stable testing and production environments for game servers while they run as containerized applications
* Flexibility to deploy Windows or Linux game servers
* Reduction in latency thanks to VMs built on globally distributed Azure Compute
* Full-fledged identity solution with managed end-point protection
* Wide range of capabilities for desired gaming experience
* Compatibility with PlayFab LiveOps and multiplayer features

## How to use MPS

If you are still in the early stages of development but want to evaluate or learn how to use MPS, see [Create your first server](create-your-first-server.md), which uses our samples to walk you through the process of deploying servers for using MPS.

These are the typical steps for using MPS:

1. [Author a game server build](using-playfab-servers-to-host-games.md#1-author-a-game-server-build).
2. [Deploy a VM build](using-playfab-servers-to-host-games.md#2-deploy-a-build).
3. [Scale game servers](using-playfab-servers-to-host-games.md#3-scale-game-servers).
4. [Measure player latency](using-playfab-servers-to-host-games.md#4-measure-player-latency-to-azure-regions).
5. [Request game servers](using-playfab-servers-to-host-games.md#5-request-game-servers).
6. [Connect and play](using-playfab-servers-to-host-games.md#6-connect-and-play).

## See also

* [Using PlayFab Multiplayer Servers to host multiplayer games](using-playfab-servers-to-host-games.md)
* [Create your first server](create-your-first-server.md)
* [Terminology](server-terms.md)
* [PlayFab Multiplayer Server SDKs](server-sdks.md)
* [PlayFab Multiplayer Server API reference](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)