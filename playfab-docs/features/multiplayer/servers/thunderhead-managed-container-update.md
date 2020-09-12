---
title: PlayFab Multiplayer Server 2.0 - Managed Container Update
author: joannaleecy
description: Describes the PlayFab Multiplayer Server 2.0 (Thunderhead) Managed Container Update in October 2018.
ms.author: joanlee
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, managed container update
ms.localizationpriority: medium
---

# PlayFab Multiplayer Server 2.0 - Managed container update

In October 2018, we updated the virtual machine and container configuration of PlayFab Multiplayer server 2.0 (Thunderhead) to use Windows Server 2016 (1803).

## October 2018 changes to managed containers

As of October 11, 2018, Thunderhead preview customers who use managed, Windows containers have had their uploaded assets layered on a special PlayFab container image. This image is based on the Windows 10 client operating system, and those containers are hosted on Windows Server 2016.

Over the following two weeks customers were transitioned to a more reliable and better performing configuration:

- Managed containers are using an official Windows Server 2016 (1803) container image as their basis. This can be downloaded at [Docker Hub](https://hub.docker.com/r/microsoft/windowsservercore/).
- Managed containers are operated on Windows Server 2016 (1803) virtual machines, using the *Server Core* SKU. The key implication is that now when you remote desktop into your deployed virtual machines, you only have PowerShell and command-prompt available in the graphical user experience. There is no "Start menu". This stream-lined configuration provides more CPU and memory resources to your game servers and reduces performance variation.

This change is not expected to break game server functionality. However we will roll it out gradually to reduce risk:

- On *Oct 19, 2018*, you will have the option of using this new configuration when you create a new build through Game Manager. Simply select Windows Server (New - 1803) as the managed container flavor, deploy, and verify your game server continues to function as expected. You cannot deploy a build with this new configuration via our APIs or PowerShell.
- On *Oct 30, 2018*, this configuration will be the default option for new builds, created through Game Manager or through PlayFab APIs.

Please [reach out to us](mailto:Thunderhead@microsoft.com) if you have any questions, concerns, or feedback.