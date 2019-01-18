---
title: Quickstart for multiplayer servers (Game Manager)
author: v-thopra
description: How to you upload a sample multiplayer server and configure a server build.
ms.author: v-thopra
ms.date: 01/15/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, game manager
ms.localizationpriority: medium
---

# Quickstart for multiplayer servers (Game Manager)

This tutorial helps you upload a sample multiplayer server and configure a server build.

## Enable multiplayer servers 2.0

Multiplayer Servers 2.0 is available to PlayFab indie, pro, and enterprise-tier customers. If your title does not have access but you are interested in evaluating the service please email [sales@PlayFab.com](mailto:sales@playfab.com).

Enable the feature by clicking the Multiplayer tab in Game Manager:

![Game Manager - Multiplayer - Thunderhead Enable](media/tutorials/game-manager-thunderhead-enable.png)

## Download and build the GDSK sample

Multiplayer servers work through a special state machine by integrating with the PlayFab Game Server SDK (GSDK) (see [Basics of a PlayFab game server](basics-of-a-playFab-game-server.md)).

GSDK samples show this integration through a very simple HTTP server sample app.

**You can download a compiled version of the sample app directly from [github](https://github.com/PlayFab/gsdkSamples/releases/download/v1.0/winrunnerSample.zip).**

If you want to build the app yourself, download the [GSDK samples from github](https://github.com/PlayFab/gsdkSamples), using standard git methods or downloading as a zip file. Opening the Visual Studio project should automatically trigger dependencies like the [Game Server SDK nuget package](https://www.nuget.org/packages/com.playfab.csharpgsdk) to be downloaded.

Build the project in an x64 RELEASE flavor:

![Release GSDK Sample](media/tutorials/release-gsdk-sample.png)

ZIP up the produced x64 release binaries. There should be no internal folder structure, the zip file should be a simple flat collection of files:

![GSDK Sample Output](media/tutorials/gsdk-sample-output.png)

You can compare your build output with the compiled release on [github](https://github.com/PlayFab/gsdkSamples/releases/download/v1.0/winrunnerSample.zip).

## Upload assets and create a multiplayer server build

On the Multiplayer Servers 2.0 page, click "New Build" at the top right. Configure a new build like so:

![Game Manager - Multiplayer - Thunderhead - New Build](media/tutorials/game-manager-thunderhead-new-build-quickstart.png)

1. **Build Name.** This is a string used to refer to the build. 
2. **Virtual machine selection**. The Azure virtual machine type used to host this multiplayer server build. Standards D1_v2 is a suggested choice, and available to customers by default. Learn about other virtual machine selections at [Multiplayer Servers detailed price sheet](multiplayer-servers-detailed-price-sheet.md).
3. **Servers per machine.** How many multiplayer servers will be hosted on each virtual machine. For testing start with a value of **one.**
4. **Network.** The GSDK sample operates a simple web server on port 3600. It is important we specify this port's name as *game_port* because the game server inspects the port name through the GSDK API. See [Connecting clients to game servers](connecting-clients-to-game-servers.md) for more networking information.
5. **Assets.** Upload the GSDK sample ZIP file. PlayFab will unzip this folder and mount it in the container file-system as a folder you specify in the *C:\ * drive. *C:\Assets* is a good example, and that would result in a start game command of `C:\Assets\WindowsRunnerCSharp.exe`.

### Configure regions

After clicking **Next** we will need to configure standing-by levels and regional maximums. For testing purposes let's configure a single standing-by server in East US.

![Region Simple Input](media/tutorials/region-simple-input.png)

### Wait for the build to initialize

After clicking **Deploy** you will be taken to the build home page. You can monitor the deployment of your build from here. In 10-20 minutes your build should be in the **Deployed** state.

![Game Manager - Thunderhead Table](media/tutorials/game-manager-thunderhead-table.png)
