---
title: "Walkthrough: Deploy builds using Game Manager"
author: joannaleecy
description: "Walkthrough: Deploy builds using Game Manager"
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, game manager
ms.localizationpriority: medium
---

# Walkthrough: Deploy builds using Game Manager

This topic describes how to deploy builds for VMs using Windows OS in Game Manager based on the Windows Runner C# sample.

> [!Note]
> In order to use and view the PlayFab Multiplayer Servers, you need to enable the feature from Game Manager. For instructions, see [Enable the PlayFab Server feature](enable-playfab-multiplayer-servers.md).

Deploying a build is one of the processes in creating a game server using the [Windows Runner C# sample](windows-runner-sample.md). 

## Prerequisites

Make sure you have completed the following steps.

* [Configure API feature option](windows-runner-sample.md#configure-api-feature-option)
* [Server set up](windows-runner-sample.md#server-set-up).

## Steps

1. Log into your developer account on [PlayFab.com](https://playfab.com)
2. Go to **My Studios and Titles** page and select your game title to display the dashboard
3. Go to **Multiplayer** > **Servers** page, select **New Build** at the top right to create a new build
4. Use "My build" as the Build Name
5. Select a server with limited free usage, such as **Av2** (until July 2021) and **Dasv4** (from July 2021)
6. Set **1** for Servers per machine

Image below shows values used in the info section section.
![Create a new build for Multiplayer Servers using Game Manager](media/create-your-first-server/windowsrunner-build-info.png)

7. Under Virtual Machine OS, select **Windows** as the platform, **Windows Server Core** as the Container image

Image below shows values used in the OS section.
![OS section of a new build using Game Manager](media/create-your-first-server/windowsrunner-os1.png)

8. Under Assets, select **Upload** then navigate to folder with the compiled PlayFab Multiplayer Server Build for the WindowsRunnerSample.  To get the Build, see [Server side set up](windows-runner-sample.md#server-set-up)
* Set __C:\Assets__ as the mount path

Image below shows values used in the assets section.
![Assets section of a new build using Game Manager](media/create-your-first-server/windowsrunner-os2.png)

9. Set  __C:\Assets\WindowsRunnerCSharp.exe__ as the Start Command.

10. For network, use port **3600** using **game_port** as the name. Use **TCP** as the protocol as shown in the image below.

![Set network values for a new build using Game Manager](media/create-your-first-server/windowsrunner-network-tcp.png)

11. Under Regions, select "East US", 1 standby server and 1 maximum server.

12. Select **Save** to start the deployment process. You will be taken to the build home page. The build will display the **Deploying** status as show in the image below. In 10 to 20 minutes, your build should be in the **Deployed** state.

![Screenshot showing servers deploying](media/create-your-first-server/windowsrunner-server-deploying.png)

* After servers are deployed, [set up the client and connect to the servers](windows-runner-sample.md#client-set-up).

## See also

* [Walkthrough: Deploying builds using PowerShell/API](quickstart-for-multiplayer-servers-api-powershell.md)
* [Windows Runner C# sample](windows-runner-sample.md)
* [Samples and resources](server-samples-resources.md)