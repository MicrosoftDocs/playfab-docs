---
title: PlayFab Multiplayer Servers 2.0 (Thunderhead)
author: v-thopra
description: Describes how to set up PlayFab's multiplayer server hosting service (Thunderhead), which allows you to operate a dynamically scaling pool of custom game servers in Azure.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab. multiplayer servers, azure, thunderhead
ms.localizationpriority: medium
---

# PlayFab Multiplayer Servers 2.0 (Thunderhead)

PlayFab's multiplayer server hosting service allows you to operate a dynamically scaling pool of custom game servers in Azure.

This service is currently available as a private preview to a limited set of customers. If you are an existing PlayFab Pro or Enterprise customer and interested in early access to this feature set, please reach out to us through our community Slack channel, your account manager or email us at [playcompute@microsoft.com](mailto:playcompute@microsoft.com).

There are three key concepts to PlayFab multiplayer servers:

- **Game server executable** - The application that you are running in Azure. This server may be a simple network repeater, a fully authoritative game server running physics and AI, or anything in between.
- **Build** - The game server executable, packaged with assets and certificates needed to run the game. This content can be uploaded as individual certificates, zip files, and/or a container image. If you do not need a custom container image, you can use our managed Windows containers.
- **Game server** - A container running your game server executable. There may be multiple servers running on a single virtual machine.

Using PlayFab REST APIs, your matchmaking or lobby services allocates session hosts in your preferred [Azure region](https://azure.microsoft.com/en-us/global-infrastructure/regions/). Game clients can then connect players to the newly created server for play. As your player base ebbs and flows globally your build scales to meet demand.

You can upload and manage multiplayer server builds using Game Manager or the Entity API.

## Getting Started Documentation

- [Allocating game servers and connecting Visual Studio debugging tools](../../social/tournaments-leaderboards/allocating-game-servers-and-configuring-vs-debugging-tools.md)
- [Connecting clients to game servers](../../social/tournaments-leaderboards/connecting-clients-to-game-servers.md)

## SDKs and Tools

- Select Multiplayer in the [PlayFab API Reference Documentation](../../../api-references/index.md) to see the Multiplayer API Reference.
- [Beta PlayFab & Entity API SDKs (Windows C++, C#, Java, Node.js)](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/BetaSDKs-180827.zip)
- [Game Server SDK (GSDK) for C++ Windows Servers](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/microsoft.playfab.gaming.gsdk.cpp.0.0.0-beta-180613.zip)
- [GSDK C++ Windows Test Servers](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/windows_cpp_testapps_180829.zip)
- [Game Server SDK (GSDK) for C# Windows Servers](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/microsoft.playfab.gaming.gsdk.csharp.1.0.180600004.zip)
- [GSDK C# Windows Test Server](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/csWindowsRunnerGame.zip)
- [PowerShell Module](https://www.powershellgallery.com/packages/PlayFabMultiplayer/)

## August 26, 2018 - Private Preview Release Notes

### PowerShell

Get-PFMultiplayerBuild now uses the ListBuilds API to return a list of build summaries. This makes the cmdlet faster but returns less information by default. Detailed information is still available via Get-PFMultiplayerBuild, simply use the new -Default parameter:

```powershell
Get-PFMultiplayerBuild -Detailed

Get-PFMultiplayerBuild "my build name" -Detailed
```

This will use the GetBuilds API to obtain the detailed configuration for your builds.

### API Changes

ListBuilds:

- ListBuilds -> renamed ListBuildSummaries

### Property name changes

CreateBuildWithManagedContainerRequest/CreateBuildWithManagedContainerResponse:

- StartGameCommand -> renamed StartMultiplayerServerCommand
- RegionConfiguration is now RegionConfigurations (plural) for consistency throughout APIs request/responses.

GetBuilds:

- Response now contains both ContainerRunCommand and StartMultiplayerServerCommand. StartMultiplayerServerCommand is for Managed builds and ContainerRunCommand is for Custom builds. GetBuildResponse will return both but will return null appropriately (i.e. StartMultiplayerCommand will be null for Custom builds and ContainerRunCommand will be null for Managed` builds)

### Response changes

CreateBuildResponse:

- Renamed CreateBuildWithManagedContainerResponse and CreateBuildWithCustomContainerResponse. This separation was necessary to conform to our other APIs as well as ensure that we differentiate between both and are able to filter/add extra informtion for the different flavors of builds.

BuildSummary:

- This has been eliminated from GetBuild, CreateBuildWithManagedContainerResponse, and CreatedBuildWithCustomContainerResponse. All information will be at the top level response objects (CreateBuildWithManagedContainerResponse, CreateBuildWithCustomContainerResponse, GetBuildResponse)
- Additionally, BuildSummary has been changed and is only used in ListBuildSummaries and will output as a list of Id and Name. The usage has changed in that developers will have to call GetBuild passing in a BuildId to get extra information. This is an optimization necessary on our end.

### Enum changes

ContainerFlavor has had these two enum values:

- ManagedWindowsServerCore
- CustomLinux

### Known Issues and limitations

- Custom containers are not enabled in Game Manager. This is coming in a August update.
- Deleting builds through the Entity API always returns a 400 (error), but usually this error means the build will be deleted over the next 5-10 minutes.