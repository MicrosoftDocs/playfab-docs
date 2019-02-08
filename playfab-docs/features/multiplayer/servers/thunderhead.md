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

The **PlayFab Multiplayer Server** hosting service allows you to operate a dynamically scaling pool of custom game servers in **Azure**.

This service is currently available as a private preview to a limited set of customers. 

If you are an existing **PlayFab Pro** or **Enterprise** customer, and interested in early access to this feature set, please reach out to us through our community **Slack** channel, your **Account Manager** or email us at [playcompute@microsoft.com](mailto:playcompute@microsoft.com).

There are three key concepts to **PlayFab Multiplayer Servers**:

1. **Game Server executable** - The application that you are running in **Azure**. This server may be a simple network repeater, a fully authoritative game server running physics and **AI**, or anything in between.
2. **Build** - The game server executable, packaged with assets and certificates needed to run the game. This content can be uploaded as individual certificates, zip files, and/or a container image. If you do not need a custom container image, you can use our managed **Windows** containers.
3. **Game Server** - A container running your **Game Server Executable**. There may be multiple servers running on a single virtual machine.

Using **PlayFab REST APIs**, your matchmaking or lobby services allocates session hosts in your preferred [Azure region](https://azure.microsoft.com/en-us/global-infrastructure/regions/). Game **Clients** can then connect **Players** to the newly created server for play. As your **Player** base ebbs and flows globally, your build scales to meet the demand.

You can upload and manage multiplayer server builds using **Game Manager** or the **Entity API**.

## Getting started documentation

- [Allocating game servers and connecting Visual Studio debugging tools](allocating-game-servers-and-configuring-vs-debugging-tools.md)
- [Connecting clients to game servers](connecting-clients-to-game-servers.md)

## SDKs and Tools

- Select Multiplayer in the [PlayFab API Reference Documentation](../../../api-references/index.md) to see the Multiplayer API Reference.
- [Beta PlayFab & Entity API SDKs (Windows C++, C#, Java, Node.js)](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/BetaSDKs-180827.zip)
- [Game Server SDK (GSDK) for C++ Windows Servers](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/microsoft.playfab.gaming.gsdk.cpp.0.0.0-beta-180613.zip)
- [GSDK C++ Windows Test Servers](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/windows_cpp_testapps_180829.zip)
- [Game Server SDK (GSDK) for C# Windows Servers](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/microsoft.playfab.gaming.gsdk.csharp.1.0.180600004.zip)
- [GSDK C# Windows Test Server](https://s3-us-west-2.amazonaws.com/api-playfab-com-craft-files/FileAssets/csWindowsRunnerGame.zip)
- [PowerShell Module](https://www.powershellgallery.com/packages/PlayFabMultiplayer/)

## August 26, 2018 - Private Preview release notes

### PowerShell

**Get-PFMultiplayerBuild** now uses the **ListBuilds API** to return a list of build summaries. This makes the **cmdlet** faster, but returns less information by default. Detailed information is still available via **Get-PFMultiplayerBuild**.

Simply use the new **-Default** parameter, as seen below.

```powershell
Get-PFMultiplayerBuild -Detailed

Get-PFMultiplayerBuild "my build name" -Detailed
```

This will use the **GetBuilds API** to obtain the detailed configuration for your builds.

## API Changes

### ListBuilds

- **ListBuilds** have been renamed to **ListBuildSummaries**.

### Property name changes

**CreateBuildWithManagedContainerRequest/CreateBuildWithManagedContainerResponse**:

- **StartGameCommand** -> renamed **StartMultiplayerServerCommand**
- **RegionConfiguration** is now **RegionConfigurations** (plural) for consistency throughout **APIs** request/responses.

### GetBuilds

- Response now contains both **ContainerRunCommand** and **StartMultiplayerServerCommand**.
  - **StartMultiplayerServerCommand** is for **Managed** builds.
  - **ContainerRunCommand** is for **Custom** builds.

 - **GetBuildResponse** will return both, but will return **null** appropriately (i.e. **StartMultiplayerCommand** will be **null** for **Custom** builds, and **ContainerRunCommand** will be **null** for **Managed** builds)

## Response changes

### CreateBuildResponse

Has been separated and renamed to:

- **CreateBuildWithManagedContainerResponse**
- **CreateBuildWithCustomContainerResponse**

This separation was necessary to conform to our other **APIs** - as well as to ensure that we differentiate between both and are able to filter/add extra information for the different flavors of builds.

### BuildSummary

This has been eliminated from:

- **GetBuild**
- **CreateBuildWithManagedContainerResponse**
- **CreatedBuildWithCustomContainerResponse**

All information will be at the top level response objects:

- **CreateBuildWithManagedContainerResponse**
- **CreateBuildWithCustomContainerResponse**
- **GetBuildResponse**

Additionally, **BuildSummary** has been changed, and is only used in **ListBuildSummaries** and will output as a list of **IDs** and **Names**. 

The usage has changed, so that developers will have to call **GetBuild** passing in a **BuildId** to get extra information. This optimization is required on our end.

### Enum changes

**ContainerFlavor** has had these two enum values:

- **ManagedWindowsServerCore**
- **CustomLinux**

### Known Issues and limitations

- Custom containers are not enabled in **Game Manager** (this is coming in an update soon).
- Deleting builds through the **Entity API** always returns a **400** (**Error**), but this usually means that the build will be deleted over the next 5-10 minutes.