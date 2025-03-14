---
title: Building your Unreal Example Project
author: joannaleecy
description: How to build an Unreal Project, specifically the build instructions relevant to an Unreal project deployed to MPS
ms.author: joanlee
ms.date: 12/08/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, gsdk, unreal
ms.localizationpriority: medium
---

# Build the ThirdPersonMP Example Project

This article describes how to successfully build a PlayFab Multiplayer compatible Unreal project using the Unreal ThirdPersonMP sample as a template project. In this guide you will find all the build configurations needed by later steps to test and verify your Unreal project. There are no special GSDK steps on this page, this only covers a specific set of Unreal build instructions useful for this example.

## Goals

* Build the "Development Editor"
* Build a game-client
* Build the "Development Server"
* Build a release Server

## Requirements

* Download Visual Studio. The [community version](https://visualstudio.microsoft.com/vs/community/) is free.
    * Required workloads: .NET desktop development and Desktop development with C++
* Download Unreal Engine Source Code. For instructions, see [Downloading Unreal Engine Source code (external)](https://docs.unrealengine.com/ProgrammingAndScripting/ProgrammingWithCPP/DownloadingSourceCode/).
* [Completed Unreal Project](third-person-mp-example-project-setup.md) with [PlayFab Unreal GSDK](third-person-mp-example-gsdk-project-setup.md) installed and configured
* Knowledge about [Unreal Build Configuration](https://docs.unrealengine.com/ProductionPipelines/DevelopmentSetup/CompilingProjects/) options

## Instructions

The [GSDK setup](third-person-mp-example-gsdk-project-setup.md) guide previously described the steps to "Switch Unreal Engine Version" and "Generate Visual Studio project files". There is also an [Unreal guide](https://docs.unrealengine.com/ProductionPipelines/DevelopmentSetup/CompilingProjects/) about the various compilation options, which you should review.

### Development Editor

The development editor should be the first thing you build. To do this, find your ```{ProjectName}.uproject``` file, right-click, and "Generate Visual Studio project files" (You may have already done this in the previous guide, in which case, you can skip this step. Once complete, you can open ```{ProjectName}.sln``` in Visual Studio.

Once Visual Studio loads, change your configuration to "Development Server". The Solution Configuration dropdown is sometimes hard to read, but can be resized in the toolbar customization options. Now, build. The first time you do this, it can take several hours, but you likely did this in the previous guide. Repeated builds should be fairly fast for a small project. Once finished, you can run/debug the project Solution/Games/ThirdPersonMP. This will start the Development Editor.

### Build Shipping Client

Run the Development Editor. From the development editor window, pick these options in this order:

* File -> Package Project -> Build Target -> ThirdPersonMP (Or the name of your project)
* File -> Package Project -> Build Configuration -> Development
* File -> Package Project -> Windows (64-bit)
* (This opens a popup window asking you to pick a location - make sure you remember this location)
* The first time packaging occurs in this configuration, it may take a while
    * The first shipping client build will take upto multiple hours, even if you've already built Development Editor
    * Repeat builds will be much faster for a simple project like ThirdPersonMP
* Open the client location you picked and find ThirdPersonMP.exe

### Build Development Server

* Close the Development Editor (Unreal is no longer running, only Visual Studio should be open now)
* Toolbars -> Configuration -> "Development Server"
* Build/Rebuild Solution
* The first time packaging occurs in this configuration, it may take a while
    * The first development server build will take upto multiple hours, even if you've already built Development Editor
    * Repeat builds will be much faster for a simple project like ThirdPersonMP
* Use Explorer to find {projectLocation}\Binaries\Win64\ThirdPersonMPServer.exe

### Build Shipping Server

Run the Development Editor. From the development editor window, pick these options in this order:

* File -> Package Project -> Build Target -> ThirdPersonMPServer (Or the name of your project)+Server
* File -> Package Project -> Build Configuration -> Development
* File -> Package Project -> Windows (64-bit)
* (This opens a popup window asking you to pick a location - make sure you remember this location)
* The first time packaging occurs in this configuration, it may take a while
    * The first shipping server build will take upto multiple hours, even if you've already built Development Editor
    * Repeat builds will be much faster for a simple project like ThirdPersonMP
* Open the server location you picked and find ThirdPersonMPServer.exe

## Next steps

You are now ready to [deploy your game server](third-person-mp-example-project-local-deployment-and-debugging.md) on your local machine.

Alternately, you can return to the main [Unreal GSDK Plugin](index.md#deploy-to-playfab) guide.
