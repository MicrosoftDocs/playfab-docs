---
title: GSDK Example Project Creation
author: joannaleecy
description: Creating an Unreal GSDK Project suitable for use by Multiplayer Servers
ms.author: joanlee
ms.date: 12/08/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, gsdk, unreal
ms.localizationpriority: medium
---

# Example Project Setup

This guide covers the construction of an example project that can operate as a game-client and dedicated game-server. This sets up the minimum requirements for an Unreal project, before the GSDK can be integrated.

This guide is an excellent starting point if you're starting from scratch.

## Goals

The project needs to have the following capabilities and features:

* Networking
* Multiplayer
* Dedicated Game-Server

To accomplish this, we construct a project from scratch using Unreal tutorials.

## Requirements

* Download Visual Studio. The [community version](https://visualstudio.microsoft.com/vs/community/) is free.
    * Required workloads: .NET desktop development and Desktop development with C++
* Download Unreal Engine Source Code. For instructions, see [Downloading Unreal Engine Source code (external)](https://docs.unrealengine.com/ProgrammingAndScripting/ProgrammingWithCPP/DownloadingSourceCode/).

## Instructions

All of the necessary instructions are in the Unreal Tutorials. First, download Unreal Engine Source Build by following [these instructions](https://docs.unrealengine.com/ProgrammingAndScripting/ProgrammingWithCPP/DownloadingSourceCode/) from the Unreal Engine website.

Next, you should follow the Unreal [Third Person Template](https://docs.unrealengine.com/Resources/Templates/ThirdPerson/) tutorial. This covers the creation of a basic project we'll use for the rest of this document.

Then, you should proceed to the Unreal [Multiplayer Programming Quick Start](https://docs.unrealengine.com/InteractiveExperiences/Networking/QuickStart/) tutorial. Note, the first step of this tutorial is an abbreviated version of the one above. This guide upgrades the ThirdPersonMP template to a multiplayer project.

Once finished with the above guides, you'll have a working multiplayer game-client. Next, you need a dedicated server. At this point, you should proceed to the Unreal [Setting Up Dedicated Servers](https://docs.unrealengine.com/InteractiveExperiences/Networking/HowTo/DedicatedServers/) tutorial. This sets up a dedicated server for your project, and concludes our list of requirements.

Once finished with all guides, you'll have a network-enabled multiplayer project with a dedicated game-server.

## Next steps

You're now ready to [install the PlayFab Unreal GSDK](third-person-mp-example-gsdk-project-setup.md) into this project.

Alternately, you can return to the main [Unreal GSDK Plugin](index.md#project-gsdk-setup) guide.
