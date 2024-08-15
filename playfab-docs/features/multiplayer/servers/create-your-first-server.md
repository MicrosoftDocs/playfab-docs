---
title: Create your first server
author: joannaleecy
description: Create your first server.
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab. multiplayer, servers
ms.localizationpriority: medium
---

# Create your first server

This topic describes how you can use our samples to create your first game server using PlayFab Multiplayer Servers. We recommend using the wrapper sample to help you create your first server.

In order to use and view the servers, you need to enable the Servers feature from Game Manager. For instructions, see [Enable the PlayFab Server feature](enable-playfab-multiplayer-servers.md).

## What you will learn

1. Deploy game servers using PlayFab Multiplayer Servers
2. Create builds that can be used to deploy game servers/VMs using Game Manager or PowerShell via APIs
3. Scale game by defining standby, maximum servers

> [!Tip]
> Certain servers have limited free usage and capacity limits. You can use them during evaluation and development. If you are enrolled in paid pricing plans, you may request additional server cores. To learn more, see [Managing Server cores quota](quota-changes.md). It is also possible to use to test the set up and integration locally using [LocalMultiplayerAgent](locally-debugging-game-servers-and-integration-with-playfab.md).

## Wrapper sample

The Wrapper sample, also known as wrappingGsdk, wraps an existing game so it can be used in the deployment of builds for game servers that use **Windows OS** or **Linux OS**.

Instead of integrating your game server build with GSDK, it uses a wrapper as a workaround by processing the standard output and error streams to call GSDK methods. Basically, the wrapper application converts your typical game server build into one that can be used with PlayFab Multiplayer Servers. 

> [!Important]
> A wrapper is a workaround by processing the standard output and error streams to call GSDK methods and it's not meant for production use. There is additional info about GSDK integration in the sample, see [Program.cs](https://github.com/PlayFab/MpsSamples/blob/master/wrappingGsdk/wrapper/Program.cs). For more information, see [Author a game server build](author-a-game-server-build.md).

To deploy servers using a wrapper, see:
1. [Use Wrapper on Fakegame](wrapper-sample.md#use-fakegame-game-server-with-the-wrapper)
2. [Use Wrapper with your existing game server](wrapper-sample.md#use-your-own-game-server-files-with-the-wrapper)

## Next steps

* [PlayFab Multiplayer Server API Reference](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)
* [PlayFab Multiplayer Server resources and samples](server-samples-resources.md)
* [PlayFab Multiplayer Server SDKs](server-sdks.md)