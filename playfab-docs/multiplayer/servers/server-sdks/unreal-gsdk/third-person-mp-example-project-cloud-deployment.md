---
title: GSDK Project Cloud Deployment
author: joannaleecy
description: Deploying an Unreal GSDK Project to the Cloud
ms.author: joanlee
ms.date: 12/08/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, gsdk, unreal, cloud
ms.localizationpriority: medium
---

# Deploy and Run Windows Server in the Cloud

This guide explains how to deploy your Windows server build to PlayFab Multiplayer Server (MPS) cloud. This is great for testing and rapid iteration of your game server while in development. Many users will use [Linux servers](setting-up-a-linux-dedicated-server-on-playfab.md) for a production release after testing with Windows.

## Goals

* Deploy a project to the cloud.
* Connect to it from a local game-client

## Requirements

* Download Visual Studio. The [community version](https://visualstudio.microsoft.com/vs/community/) is free.
    * Required workloads: .NET desktop development and Desktop development with C++
* Download Unreal Engine Source Code. For instructions, see [Downloading Unreal Engine Source code (external)](https://docs.unrealengine.com/ProgrammingAndScripting/ProgrammingWithCPP/DownloadingSourceCode/).
* [Completed Unreal Project](third-person-mp-example-project-setup.md) with [PlayFab Unreal GSDK](third-person-mp-example-gsdk-project-setup.md) installed and configured
* [Release Server](building-the-third-person-mp-example-project.md) configuration of your project built from Visual Studio or Development Editor
* [Client](building-the-third-person-mp-example-project.md) configuration of your project built from Visual Studio or Development Editor
* MPS is [enabled for your title](../../enable-playfab-multiplayer-servers.md), and billing is set up
* [Optional] Install [Docker for Windows](https://docs.docker.com/desktop/windows/install/)

## Instructions

### Package the game-server

* [OPTIONAL] This section can be done to refresh the files which Unreal builds into your project. This is useful if you've recently created or deleted files.
    * If you have not recently built your project in "development editor" configuration, do so now
    * Close Visual Studio
    * Navigate to the ```{ProjectName}.uproject``` file for your project
    * Right-click on the ```{ProjectName}.uproject``` file in your file editor and select "Generate Visual Studio Project Files"    
    * Re-open the {ProjectName}.sln file in Visual Studio
* Select __Development Editor__ configuration
* Run your project
* Observe the Unreal Editor, which should have loaded your project
* In the top left of the Unreal editor menu, Select __File__ -> __Package__ -> __Build Target__ -> __{ProjectName}Server__
* Select __File__ -> __Package__ -> __Build Configuration__ -> __Shipping__
* Select __File__ -> __Package__ -> __Windowsx64__
* Select and remember an output location {ShippingServerFolder}
* You can now use this packaged version of your game-server to [test with LocalMultiplayerAgent](../../locally-debugging-game-servers-and-integration-with-playfab.md)
* Once verified with LocalMultiplayerAgent, see [creating a build guide](../../deploying-playfab-multiplayer-server-builds.md)
    * Testing on MPS at this point will require an intermediate tool from [PlayFab MpsAllocatorSample](https://github.com/PlayFab/MpsSamples/tree/main/MpsAllocatorSample)
    * This tool bypasses some client work for now, and allows us to allocate a server without a direct request from the game-client
    * The proper way to do this on a client is a separate topic covered in the [allocation guide](../../allocating-game-servers-and-configuring-vs-debugging-tools.md).
* Zip your Shipping Server build from {ShippingServerFolder} above
    * Your zip should contain everything in {ShippingServerFolder}, optionally at the root of the zip file
    * [Optional] IE, the root of your zip should contain {ProjectName}Server.exe (It's suggested the exe should not be in a subfolder such as "WindowsServer". Rebuild your zip if desired)
* Get familiar with the [build creation process guide](../../deploying-playfab-multiplayer-server-builds.md)
* Specific details for specific configurations are detailed below:

### Set up a Windows Dedicated Server on PlayFab

This section will cover creating a build in PlayFab MPS, uploading your game-server, and connecting to it for the first time. You can also follow the core MPS [server creation guide](../../create-your-first-server.md) for less Unreal specific instructions.

* Navigate to Game Manager -> Multiplayer
* Select __New Build__
* Give the build a name
* Select a Virtual Machine (For the samples described in these guides, the recommended option with the fewest cores is sufficient)
* Servers per machine can be approximately 1~10
    * Improving/Raising this number is based on the performance of your game-server
    * You can use [VM metrics](../../vm-metrics.md) to measure performance of your game server, and optimize to raise this number
* Skip __Server details__ for now (covered in the next step)
* In the Assets block, drag your zip file from the previous section into the upload box
    * If you're re-launching, you can select __Use existing assets__
* Wait for the upload to complete
* Skip __Start Command__ for now (covered in the next step)
* In the Network block, set the Port Name field to ```gameport```
    * It's mandatory to define the port that will be used to connect to your game-server
    * Unreal GSDK contains code to read this port automatically, and internally override the Unreal Server host port according to this value
    * The name of this port is required to be ```gameport```
* Continue to the next step that matches the "Server Details" that you want to configure

#### Option 1: Windows Process Mode

This option runs your game-server(s) as a process directly on the VM. Your processes will share access to the full machine, including ports, drives, etc. This option unzips your asset upload, and executes the "Start Command" from the location of your unzipped files as the working directory.

* In __Server Details__, select __Process__ and __Windows__
* In __Assets__, set the start command to:
    * ```{ProjectName}Server.exe``` or ```{ProjectName}Server.exe -log``` if you want to generate log files
    * The start command is executed from the command-line, using your unzipped asset files as the working directory
    * If you chose to pack your zip file with sub-folders, you can specify a relative path such as: ```WindowsServer/{ProjectName}Server.exe``` to access your project with a relative sub-path
* Select __Add Build__
* Skip ahead to the __Configure Regions__ section below

#### Option 2: Windows Container Mode

This option runs your game-server(s) in docker containers, isolating them from each other. Each server process will have a separate virtual drive, virtual network ports, etc. This option unzips your asset to a Mount Path you will define, and expects your start command to be a full path, based on the Mount Path.

Prerequisite requirement: Configure Docker to run Windows containers

* In __Server Details__, select __Process__ and __Windows__
* In __Assets__
    * Set the __Mount Path__ for your gameServer zip file to ```C:\assets``` (or something similar, denoted as {MountPath})
    * Set the start command to: ```{MountPath}\{ProjectName}Server.exe``` or ```{MountPath}\{ProjectName}Server.exe -log``` if you want to generate log files
    * The start command should represent a full path in the container, to your -Server.exe file
    * If you chose to pack your zip file with sub-folders, you can specify an absolute path such as: ```{MountPath}\WindowsServer\{ProjectName}Server.exe``` to access your project with an absolute sub-path
* Select __Add Build__
* Skip ahead to the __Configure Regions__ section below

## Next steps

Many users will want to test their server by [connecting a game client](connect-to-mps-hosted-build.md).

Other users may optionally continue on to rebuild and redeploy their servers using [Linux containers](setting-up-a-linux-dedicated-server-on-playfab.md). Linux reduces the server-hosting costs for large-scale deployment.

Otherwise, you can return to the main [Unreal GSDK Plugin](index.md) guide.
