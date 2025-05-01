---
title: PlayFab Unreal GSDK Plugin Overview
author: joannaleecy
description: Overview of all the pages covering the PlayFab Unreal GSDK Plugin
ms.author: joanlee
ms.date: 12/08/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, gsdk, unreal, cloud, linux
ms.localizationpriority: medium
---

# How to use PlayFab GSDK Unreal plugin

This article describes how to integrate PlayFab Multiplayer Server SDK (GSDK) Unreal Online Subsystem (OSS) plugin with your Unreal project.

This plugin offers both a Blueprint API and a C++ API. The Blueprint API still requires your Unreal Project to be a C++ project, and will not work on a Blueprint only project. If it is currently a Blueprint only project, then you need to convert to a C++ project beforehand, before adding the plugin.

It has been originally tested with Unreal Engine 4.26, 4.27, 5.0 and, 5.1. This plugin will be actively maintained to work with the latest 3 - 4 versions of Unreal. If something fails using these versions, please open an issue here: [Unreal Engine GSDK Repo](https://github.com/PlayFab/gsdk/issues).

To use these guides, replace all instances of __ThirdPersonMP__ with your project name, if different.

## Requirements

* Download Visual Studio. The [community version](https://visualstudio.microsoft.com/vs/community/) is free.
    * Required workloads: .NET desktop development and Desktop development with C++
* Download Unreal Engine Source Code. For instructions, see [Downloading Unreal Engine Source code (external)](https://docs.unrealengine.com/ProgrammingAndScripting/ProgrammingWithCPP/DownloadingSourceCode/).
* If you haven't already, perform a git clone this repo to your local machine
    * ```git clone https://github.com/PlayFab/gsdk.git```
    * Later steps will involve integrating files from this repo to your project
* [Optional] Download the [LocalMultiplayerAgent](https://github.com/PlayFab/MpsAgent/releases)
    * [Optional] Alternatively, download [LocalMultiplayerAgent source](https://github.com/PlayFab/MpsAgent/tree/main/LocalMultiplayerAgent).
* [Optional] [PlayFab Marketplace plugin](https://www.unrealengine.com/marketplace/product/playfab-sdk) or the [source version on GitHub](https://github.com/PlayFab/UnrealMarketplacePlugin/tree/master/PlayFabPlugin/PlayFab). This plugin is not required for GSDK but is required for many PlayFab services, including login.

## Project creation

The Unreal server project needs to be a network-enabled multiplayer Unreal project with a dedicated-server mode. If you don't have a project that meets these prerequisites, follow our [Unreal prerequisite set up guide](third-person-mp-example-project-setup.md) to set one up. Once you have a network-enabled, multiplayer project, with a dedicated server, return to this step and continue.

When ready, open your network-enabled multiplayer Unreal server project, and continue to the next step to install the Unreal GSDK.

## Project GSDK setup

* GSDK Project Prerequisite details
    * Dedicated Server:
        * Your project should have a separate {ProjectName}Server.Target.cs file
        * This file should contain ```Type = TargetType.Server;``` to enable dedicated server mode
        * When built in "development server" configuration for Win64, your output contains {ProjectName}Server.exe
    * Network-enabled:
        * There are multiple ways to meet this requirement, but the simple answer is: your client can establish a network connection with a game-server on a separate machine, and communicate meaningfully
        * Our instructions direct you through Unreal's built-in data replication system, which handles most of this requirement for you
        * You can establish this connection more directly with a socket, such as through the ISocketSubsystem, which is a much more advanced topic
    * Multiplayer:
        * Your game-server can accept multiple incoming client connections, and communicate properly with both
        * Again, with Unreal's built-in data replication, this requirement is mostly handled for you

With a properly configured multiplayer project, you're ready to [install the GSDK](third-person-mp-example-gsdk-project-setup.md). This plugin will allow your server to run on PlayFab Multiplayer Services.

## Unreal project build configurations

Once the GSDK is installed and configured in your project, you can [build your Unreal project](building-the-third-person-mp-example-project.md). There are multiple build configurations you will need to execute the full range of tests in future steps.

## Test local server deployment

Once you have any client build, and a "Development Server" build, you can [test the MPS deployment process locally](third-person-mp-example-project-local-deployment-and-debugging.md), and verify your server works.

## Deploy to PlayFab

You're now ready to create game-servers in the cloud using PlayFab Multiplayer Services. PlayFab MPS supports [Windows servers](third-person-mp-example-project-cloud-deployment.md) and [Linux servers](setting-up-a-linux-dedicated-server-on-playfab.md).

## Connect to deployed server

Finally, you're ready to [connect to your deployed server](connect-to-mps-hosted-build.md).

## Acknowledgments

Thank you to [Stefan Krismann](https://github.com/stkrwork) for creating and submitting this plugin.

Thank you to [Nick Arthur](https://github.com/narthur157) for his amazing [Dockerfile](https://github.com/narthur157/playfab-gsdk-ue4).

Thank you to [Adam Rehn](https://github.com/adamrehn) for all his work with Unreal and Docker, including code, samples, examples, and tutorials.
