---
title: LocalMultiplayerAgent Overview
author: emmayspark
description: Overview page for LocalMultiplayerAgent.
ms.author: emmapark
ms.date: 11/19/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, multiplayerServer, localMultiplayerAgent, MPS Agent, MPS Samples
ms.localizationpriority: medium
---

# LocalMultiplayerAgent overview

LocalMultiplayerAgent(LMA) is a helper agent to facilitate faster development iterations by testing or running your game server on your local machine. Without any cloud connection, LMA can provide mock responses to the Game server SDK(GSDK) and test your game servers as it's running on PlayFab Multiplayer Servers(MPS). 

Here are some examples you can do with LocalMultiplayerAgent:
 - Verify GSDK integration with your game servers.
 - Test connection to your game servers
 - Run a diagnosis on your game servers: Logs and config files generated on each game session
 - Verify build configuration

## Prerequisites

1.  Game Server integrated with GSDK.  
GSDK facilitates two-way communication between your game server process and the MPS service. To learn how to integrate game servers with GSDK, see [this article](../integrating-game-servers-with-gsdk.md). 
The tutorial uses the Wrapper sample on GitHub. The Wrapper sample includes a fake game and GSDK. 
To download the sample, see [PlayFab Wrapper Sample](https://github.com/PlayFab/MpsSamples/tree/main/wrappingGsdk).
  
2.  LocalMultiplayerAgent (LMA) toolset.  
Download the latest [release](https://github.com/PlayFab/MpsAgent/releases) and extract it to the desired folder. (such as C:\PlayFabVmAgent)  

3.  [Optional] Install [Docker Desktop on Windows](https://docs.docker.com/docker-for-windows/install/).  
LMA can debug Linux/Windows container game servers using Docker for Windows.
You can skip this part if you want to run your game server as a process (run executable game server) instead of a container. 

## Next steps

- [Run LocalMultiplayerAgent in Process Mode](run-process-based-gameserver.md)  
  In Process mode, LMA will run an executable game server and directly communicate with it without the need to set up Docker.  
  Container knowledge isn't required - you don't need to create any program that runs in a container. 

- [Run LocalMultiplayerAgent in Container Mode](run-container-gameserver.md)  
  In Container mode, LMA will run and test a game server running in a [Windows/Linux]container.

  
