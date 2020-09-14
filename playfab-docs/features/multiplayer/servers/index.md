---
title: Servers
author: joannaleecy
description: Overview of PlayFab's multiplayer server hosting service.
ms.author: joanlee
ms.date: 07/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab. multiplayer, servers
ms.localizationpriority: medium
---

# Multiplayer Servers

PlayFab's multiplayer server hosting service allows you to operate a dynamically scaling pool of custom game servers in Azure.

All PlayFab indie, pro, and enterprise tier customers can access the service and use a limited, free quota of multiplayer servers for product evaluation and testing. 

There are three key concepts to PlayFab multiplayer servers:

1. **Game server executable**. This is the application that you are running in Azure. This server may be a simple network repeater, a fully authoritative game server running physics and AI, or anything in between.
2. **Build**. This is the game server executable, packaged with assets and certificates needed to run the game. This content can be uploaded as individual certificates, zip files, and/or a container image. If you do not need a custom container image, you can use PlayFab managed Windows containers.
3. **Game server**. A container running your game server executable. There may be multiple servers running on a single virtual machine.

These are the typical steps for using the service:

1. **Author game server**. Scaling your server requires integration with the PlayFab game server SDK (GSDK) and testing the server executable in a container. You can download a mock agent and the Windows container image PlayFab uses for local development.
2. **Upload game server executable and assets**. Upload the server and manage builds through Game Manager or PlayFab APIs and SDKs.
3. **Scale game server build**. Once you've uploaded server assets you can create *builds*. PlayFab dynamically creates and recycles virtual machines to fulfill player demand and maintain standing-by levels you specify.
4. **Measure player latency**. When players initiate a multiplayer experience, send UDP messages to PlayFab quality-of-service (QoS) beacons to measure network latency to Azure.
5. **Request multiplayer server**. When players need a multiplayer server, request one to be allocated from a build's standing-by pool. This request can come from a lobby or matchmaking service you operate, or directly from a client calling PlayFab.
6. **Connect and play**. PlayFab will fulfill a server request within 1 second if standing-by servers are available. Once a server has been put into the active state, clients connect to the server and play.

![PlayFab Multiplayer Server Hosting Service diagram](media/tutorials/multiplayer-server-hosting-service-diagram.png)

## Reference Documentation and Tools
- [Multiplayer Server API Reference](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)
- [PowerShell Module](https://www.powershellgallery.com/packages/PlayFabMultiplayer)

## Game Server SDK 
- [Game Server SDK (GSDK) for C++ Windows servers via nuget](https://www.nuget.org/packages/com.playfab.cppgsdk.v140)
- [Game Server SDK (GSDK) for C# Windows servers via nuget](https://www.nuget.org/packages/com.playfab.csharpgsdk)
- [Game Server SDK (GSDK) for Java Windows & Linux servers via Maven](https://mvnrepository.com/artifact/com.playfab/gameserverSDK)

## Game Server SDK Samples
*Links navigate to PlayFab's sample repo in Github*
- [Game Server SDK (GSDK) Sample - Basic Windows Server](https://github.com/PlayFab/gsdkSamples)
- [Game Server SDK (GSDK) Sample - Unity - Windows Server and Linux Server](https://github.com/PlayFab/gsdkSamples/blob/master/UnityMirror/README.md)
