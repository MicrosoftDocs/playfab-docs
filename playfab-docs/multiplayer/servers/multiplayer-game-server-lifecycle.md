---
title: Lifecycle of a multiplayer server 
author: dgkanatsios
description: Describes the lifecycle of a multiplayer server
ms.author: digkanat
ms.date: 01/26/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, thunderhead, azure, server lifecycle, regions, mps, gsdk
ms.localizationpriority: medium
---

# Lifecycle of a multiplayer server

## Game Server SDK (GSDK) and game server process lifecycle

Game server lifecycle in PlayFab Multiplayer Servers (MPS) is tightly connected to the [GSDK](https://github.com/PlayFab/gsdk) methods your game server is calling as well as the state of the game server process.

> [!NOTE]
> For more information on integrating your game server with GSDK, check the docs [here](integrating-game-servers-with-gsdk.md).

At a minimum, your game server can integrate GSDK and run great on MPS just by calling the **ReadyForPlayers** GSDK method. However, we recommend calling **Start** as well when your game server process starts so MPS is aware that the game server is initializing. Calling **Start** is important in the case of a game server that takes time to start, since MPS will take down the server if it does not receive heartbeats in a timely manner when the game server starts.

## States of a game server

These are the main states of a game server in MPS:

- **Initializing**: Game server transitions to this state when it calls the **Start()** GSDK method. In this state, the game server is starting to load the necessary assets. In this state, the GSDK starts sending heartbeats to MPS.
- **StandingBy**: Game server transitions to this state when it calls the **ReadyForPlayers()** GSDK method. This method should be called when all the necessary game assets have been loaded. Essentially, this state signals to MPS that the game server is ready to be allocated, so players can connect to it.
- **Active**: Game server transitions to this state when it is [allocated](allocating-game-servers-and-configuring-vs-debugging-tools.md) by using the [RequestMultiplayerServer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.requestmultiplayerserver) API call. This state implies that players can connect to the game server and enjoy the game. The fact that the game server is active means that it will not be taken down during potential Build scale downs (i.e. if the standingBy number is decreased).
- **Terminating**: This is the state that the game server transitions when the [ShutDownMultiplayerServer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.shutdownmultiplayerserver) API is called. This state implies that the game server is shutting down and will not be available for players to connect to.

Game server process can terminate either gracefully or via a crash. This can happen at any state. MPS will:

- remove the container/process running this game server
- collect and upload the game logs so they are ready for archival ([more info](archiving-and-retrieving-multiplayer-server-logs.md))
- will create a new container/process in its place to replace the one that was terminated

> [!NOTE]
> A Game server can never transition back to StandingBy state when it is in the Active state. Once the game state is set to Active, the only way to get a new game server in StandingBy state is if your game server process exits.

### Maximum Server Lifetime

The virtual machines that host MPS servers have a maximum lifetime of 10 days, so a server's lifetime is constrained by that lifetime. A server's lifetime is guaranteed to be at least 23 hours; MPS will not allocate servers on a VM that has less that 23 hours remaining on it. The GSDK will fire the OnMaintenanceScheduled event 23 hours before the VM is forcibly terminated so that any servers running on the VM can gracefully shut down in time. If a server is still running on the VM when the VM reaches its maximum lifetime of 10 days, the server will be forcibly terminated and no logs will be uploaded. To make sure your server isn't forcibly terminated, either make sure its sessions are always less than 23 hours long or use the GSDK's OnMaintenanceScheduled event to gracefully shut down the server and migrate players to another one before the deadline.

### Terminating a game server process

When the game session ends, you should gracefully terminate the game server process so you can get a new game server. If the game server process crashes, MPS will create a new game server process to replace the one that crashed. In the event that the game server is stuck or frozen, you can always call the [ShutDownMultiplayerServer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.shutdownmultiplayerserver) API to manually terminate the game server process. This API should be called only when the game server process cannot terminate by itself. When you call this API, you will see the game server transitioning to "Terminating" and "Terminated" state. Moreover, any servers stuck in the terminating or terminated state will be replaced by the system after a period of time.

> [!NOTE]
> There is a method call on GSDK that, if used, will mark the game server as Unhealthy. At this time it is ignored by MPS, but this may change in the future. If this feature is critical for you, please leave a note at the GSDK repository [here](https://github.com/PlayFab/gsdk/issues).

### Verifying GSDK integration with your game server

MPS has a developer tool to test GSDK integration for game servers. Tool is called **LocalMultiplayerAgent**, you can download it [here](https://github.com/PlayFab/MpsAgent) and you can check the docs [here](locally-debugging-game-servers-and-integration-with-playfab.md) for more information.

### GSDK samples

To check GSDK samples demonstrating integration with popular game engines, you can check the MpsSamples repository [here](https://github.com/PlayFab/MpsSamples).
