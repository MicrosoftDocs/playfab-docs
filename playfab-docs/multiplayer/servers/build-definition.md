---
title: Build definition and configuration
author: joannaleecy
description: VM build definition and configuration.
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, deploy, powershell
ms.localizationpriority: medium
---

# Build definition and configuration

This topic describes the parameters you need to specify when deploying/creating a Virtual Machine (VM)/game server build.

A build is created by specifying its *build definition* and *build configuration*. 

Build definition **cannot be modified** after it is created. This requires you to select what Virtual Machines (VMs) you want, upload your PlayFab Multiplayer Game Server Build, assets, certificates, and more.

Build configuration determines how your game scales across Azure. This **can be modified at any time** in a build's life.

You can also view the VM build definition and configuration on the __New Build__ page in Game Manager. For instructions, see [How to view the **New Build** page using Game Manager](#how-to-view-the-new-build-page-using-game-manager).

### Build definition

Build definition is determined by the following list of parameters. 

For sample values you can use to deploy a simple server, see [Walk-through of deploying builds using Game Manager](quickstart-for-multiplayer-servers-game-manager.md).

| Parameter | Description                                  | Usage             |
|------------|----------------------------------------------|-------------------|
| Build Name |This is a string used to refer to the build.  | Easy identifier for the different builds that you maintain                |
| Virtual machine (VM) selection | A drop-down list of global distributed Azure VMs with different technical specifications | Select the VMs based on what you need&mdash;number of cores, RAM, storage, region. For details, see [Multiplayer Servers details and price sheet](multiplayer-servers-detailed-price-sheet.md).  |
| Servers per machine | Number of game servers hosted on each VM. The number of cores in the VM is split by the number of servers. | |
| Virtual machine OS | Select Windows or Linux platform. | |
| Container | The container that will host your game server. | For Windows, you can simply select the managed Windows Server Core containers. For Linux-based VMs, see [Deploying Linux-based builds](deploying-linux-based-builds.md).|
| Assets | Files you want uploaded on the servers. You can upload multiple assets but one of the assets **must** contain your [PlayFab Multiplayer Game Server Build](#). <br>All assets combined should be less than 10GB in size and must be in *zip*, *tar.gz* or *tar* file type. <br>Each asset has a mount path associated with it. This specifies where it is mounted in the container file system.| Asset filenames can only contain alphanumeric characters, underscores, hyphens, and periods. You can use C:\Assets as the typical mount path. What this means that PlayFab will unzip your assets and mount it **in the container file-system** (not the VM) as a folder in the **C**  drive under Assets. |
| Start command | The command to run when the game server starts, make sure to include any arguments that you need. |    |
| Network | Define the port name, number, and protocol (TCP or UDP) to be used for incoming network traffic. Outgoing (or solicited) network flows do not need to be configured. For more networking information, see [Connecting clients to game servers](connecting-clients-to-game-servers.md).| |
| Certificate (optional) | Upload certificates for the game server. This is a .pfx (Windows) or .pem (Linux) file containing the certificate to be installed within the container. Certificate names can only contain letters and numbers. No spaces or special characters such as dashes and underscores. | Typically, the certificate for service-to-service authentication is installed through this configuration. |
| Metadata (optional)   | A set of property-values that can be retrieved using GSDK | |

### Build configuration

Build configuration is determined by the following list of parameters. When selecting the virtual machine size and regional configuration, keep in mind the overall usage limits configured for your PlayFab title. For more information, see [Accessing increased core limits and additional Azure regions](identifying-and-increasing-core-limits.md).

| Parameter | Description                                  | 
|-----------|----------------------------------------------|
| Region               | Select the Azure region where game servers should be deployed. Define the number of standby servers and maximum servers. |
| Standby servers      | How many game servers should be maintained in a "standby state" to handle incoming allocations in the specified region. This should be determined by the maximum allocation rate (allocations per second) for the build, and tuned over time as player behavior changes. |
| Maximum servers      | The maximum number of game servers to operate in the specified region |

## How to view the **New Build** page using Game Manager

This is the fastest way to view what's required when deploying/creating a VM build.

* Log into your developer account on [PlayFab.com](https://playfab.com)
* Go to **My Studios and Titles** page and select your game title to display the dashboard
* Go to **Multiplayer** > **Servers** page, select **New Build** at the top right to create a new build

> [!Note]
> The Multiplayer Servers feature needs to be enabled in order to access and view the page. If you haven't done so, see [Enable PlayFab Multiplayer Server functionality](enable-playfab-multiplayer-servers.md)

## Next step

* [Create your first server](create-your-first-server.md)
* [Walk-through of deploying builds using Game Manager](quickstart-for-multiplayer-servers-game-manager.md)
* [Using PlayFab Multiplayer Servers to host multiplayer games](using-playfab-servers-to-host-games.md)
* [Pricing](multiplayer-servers-detailed-price-sheet.md)
* [Terminology](server-terms.md)
* [Resources and samples](server-samples-resources.md)