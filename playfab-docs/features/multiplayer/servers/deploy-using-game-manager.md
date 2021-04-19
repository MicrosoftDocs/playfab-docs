---
title: "Deploy builds using Game Manager"
author: joannaleecy
description: "Deploy builds using Game Manager"
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, game manager
ms.localizationpriority: medium
---

# Deploy builds using Game Manager

This topic lists the general steps to deploy/create builds for VMs using Game Manager.

If this is your first time deploying a build, we recommend deploying a build using the [Windows Runner C# sample](windows-runner-sample.md) or [Wrapper sample](wrapper-sample.md) because they come with all the assets you need to actually deploy servers.

> [!Note]
> In order to use and view the PlayFab Multiplayer Servers, you need to enable the feature from Game Manager. For instructions, see [Enable the PlayFab Server feature](enable-playfab-multiplayer-servers.md).

For details about the values you can use for each parameter, see [Build definition](build-definition.md).

1. Log into your developer account on [PlayFab.com](https://playfab.com). Go to **My Studios and Titles** page and select your game title to display the dashboard
2. Go to **Multiplayer** > **Servers** page, select **New Build** at the top right to create a new build
3. Use a descriptive string as the Build Name
4. Select a server with limited free usage, such as **Av2** (until July 2021) and **Dasv4** (from July 2021) during development
5. Set a value you want for Servers per machine

Image below shows values used in the info section.
![Create a new build for Windows game servers](media/create-your-first-server/windowsrunner-build-info.png)

6. Under Virtual Machine OS, select either **Windows** or **Linux** as the platform

* For Windows platform, select **Windows Server Core** as the Container image for a simple, straightforward deployment. 
* For Linux platform, you need to create your own container image. For more instructions, see [Create and deploy Linux container images](deploying-linux-based-builds.md). If you have already uploaded a container image, it will appear in the __Image__ dropdown. To use it, select the image.

Image below shows values used in the OS section when you select Windows as the platform.
![OS section of a new build using Game Manager for Windows game servers](media/create-your-first-server/windowsrunner-os1.png)

7. Under Assets, select **Upload**. Navigate to folder with the compiled PlayFab Multiplayer Server Build and then select the .zip package to upload.

* For Windows platform, you must upload a PlayFab Game Server Build as an asset. To learn how to create a PlayFab Game Server Build, see [Author a game server build](author-a-game-server-build.md). Upload assets to modify and customize the Windows container image.
* For Linux platform, uploading an asset is optional as the PlayFab Game Server Build can be included as part of the container image. But you must still have a PlayFab Game Server Build.

If you are uploading assets:
* Set __C:\Assets__ or select a different path as the mount path
* Set  __C:\Assets\YourGameServerBuild.exe__ as the Start Command

![Upload assets in Game Manager](media/create-your-first-server/server-upload-asset.png)

8. For network, set the port number, name, and protocol

![Network settings in Game Manager](media/create-your-first-server/server-network-settings.png)

9. Under Regions, select the region you want to deploy the servers. Then specify the number of standby and maximum servers.
10. Select **Save** to start the deployment process. You will be taken to the build home page. The build will display the **Deploying** status as show in the image below. 

In a couple minutes, your build should be in the **Deployed** state. This means that servers are deployed and can be allocated. For more information on allocating game servers you can check [here](allocating-game-servers-and-configuring-vs-debugging-tools.md) whereas you can use the [MpsAllocatorSample](mps-allocator-sample.md) to experiment with server allocation.

### Configure region information

After deploying builds, you can still modify the following parameters.
* Regions
* Standby servers
* Maximum servers

To configure regional settings:
* Go to the __Servers__ > __Builds__ page
* Select the build you want to modify
* On the __Regions__ tab and go to the **Servers by region** section
* Add/remove region and modify the server numbers

![Deployed builds in Game Manager](media/create-your-first-server/server-region-settings.png)

## See also

* [Walkthrough: Deploy builds using Game Manager](quickstart-for-multiplayer-servers-game-manager.md)
* [Deploy a build using PowerShell/API](deploy-using-powershell-api.md)
* [Create your first server](create-your-first-server.md)
* [Wrapper C# sample](wrapper-sample.md)
* [MPS Allocator Sample](mps-allocator-sample.md)
* [Samples and resources](server-samples-resources.md)
