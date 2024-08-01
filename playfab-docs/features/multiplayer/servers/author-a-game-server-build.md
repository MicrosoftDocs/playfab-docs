---
title: Author a game server build
author: joannaleecy
description: Author a game server build
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab. multiplayer, servers
ms.localizationpriority: medium
---

# Author a game server build

This topic explains how to create a game server build for PlayFab Multiplayer Servers (MPS). A game server build typically contains game assets and an executable that runs on the server.

When using PlayFab Multiplayer Servers, you need to make modifications to your regular game server build so that it can work on them. This modified server build is called a PlayFab Multiplayer Game Server Build.

If you're unsure of the terms used, see [Terminology](server-terms.md).

## How to create a PlayFab Multiplayer Game Server Build

You can convert your regular game server build into a PlayFab Multiplayer Game Server Build by integrating it with the PlayFab Game Server SDK (GSDK). 

1. Download the [GSDK](server-sdks.md) you need
2. Open your existing game server code project and add the GSDK as a dependency
3. Implement essential functions (at minimum the __Start__ and __ReadyForPlayers__ methods) using the APIs in the GSDK. For code snippets, see [Integrating game servers with GSDK](integrating-game-servers-with-gsdk.md).
4. Build and compile the game server executable to create the PlayFab Multiplayer Game Server Build

This new build now helps manage game servers that are created using PlayFab Multiplayer Servers. Adding more methods provide greater control and gives you information about the servers. For more instructions, see the [Program.cs](https://github.com/PlayFab/MpsSamples/blob/master/wrappingGsdk/wrapper/Program.cs) in the [Wrapper](wrapper-sample.md) sample.

> [!Note]
> Consider using our open source debugging utility LocalMultiplayerAgent to test your game server before uploading it into MPS. This will help prevent unnecessary costs in case your game server fails to start or is not properly integrated with GSDK. You can download LocalMultiplayerAgent [here](https://github.com/PlayFab/MpsAgent) and check the instructions [here](locally-debugging-game-servers-and-integration-with-playfab.md). LocalMultiplayerAgent can also be used for iterative testing/debugging during the development of your game server.

## Next step

When using Windows game servers, you have to use the managed Windows container image. So the PlayFab Multiplayer Game Server Build can be uploaded as a zipped file combined with other dependencies (DLL files) during the [Deploy a build](deploying-playfab-multiplayer-server-builds.md) process. To help you determine what needs to be included in the zipped file, see [Determining required DLLs](determining-required-dlls.md).

When using Linux game servers, you need to [Create your custom Linux container image](deploying-linux-based-builds.md) and the PlayFab Multiplayer Game Server Build can be included as part of the image. Once your custom image is uploaded, you would be able to [Deploy a build](deploying-playfab-multiplayer-server-builds.md).

## See also

* [Determine DLL files to be included in the asset package for Windows servers](determining-required-dlls.md)
* [Local debugging and integration for Windows servers](locally-debugging-game-servers-and-integration-with-playfab.md)
* [Create Linux servers](deploying-linux-based-builds.md)