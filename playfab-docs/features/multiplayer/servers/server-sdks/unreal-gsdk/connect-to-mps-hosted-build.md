---
title: Connect to Cloud-Hosted Unreal Server
author: joannaleecy
description: How to connect to a server that is hosted by MPS
ms.author: joanlee
ms.date: 12/08/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, gsdk, unreal, cloud
ms.localizationpriority: medium
---

# Connect to MPS hosted build

This article describes how you can connect clients to PlayFab Multiplayer Servers (MPS) hosted servers using a utility tool. This tool is used during development to bypass typical steps to provision and activate servers. Earlier steps in this example sequence covered adding the Unreal GSDK to a standard ThirdPersonMP tutorial project. In doing so, we set up the server connection side, but we ignored a proper client connection sequence. PlayFab requires servers to be provisioned and activated before clients can connect to them. We won't cover that process here, but more details are available in the [MPS Documentation](../../connecting-clients-to-game-servers.md). Instead, for this example, we'll bypass those complicated steps and instead use a manual utility to rapidly test connections between the client and server.

## Prerequisites

* Clone or download the [MpsSamples repo](https://github.com/PlayFab/MpsSamples)
* A fully deployed ThirdPersonMP server in "Deployed" status, with at least one server fully propped and in "Standby" mode
    * ThirdPersonMP is the sample project [built](building-the-third-person-mp-example-project.md) and [deployed](third-person-mp-example-project-cloud-deployment.md) in earlier pages of this guide.
    * A build's status becomes "Deployed" when it contains servers that are ready for connections. These servers are considered in "Standby"
* A [built game-client](building-the-third-person-mp-example-project.md), ready to connect
* Visual Studio with .NET Core 3.1 (available as an optional checkbox in the Visual Studio Installer)

## How to connect a client automatically to the server

Your built game-client will likely be __ThirdPersonMP.exe__ and be located in or near your project. If you didn't use ThirdPersonMP as a starting template, then your built game-client will be __{YourProjectName}.exe__, similarly located in or near your Unreal project. Find this file.

* Find ```ThirdPersonMP.exe```
* Create a new adjacent file ```RunCloud.bat```
* Open this file in a text editor of your choice, and set the following contents:

```Batch
ThirdPersonMP {IP-ADDRESS}:{PORT} -log
```

NOTE: Replace ```ThirdPersonMP``` with your project name if necessary.

* For now, we don't yet know the IP-ADDRESS or PORT, so just save, and leave the editor open.
* Find the file ```{MpsSamples Repo}/MpsAllocatorSample/MpsAllocatorSample.csproj```
* Open this file in Visual Studio
* Run this program
* Follow the on-screen instructions, and input the following values when prompted:
    * {Your PlayFab TitleId}
    * {Any valid and active secret key for your PlayFab Title}
    * Choose __1__ to __RequestMultiplayerServer__
    * Enter the {BuildId} for the __Deployed__-Status server build you wish to test
        * This can be found next to the name in the list of all builds, in the __Details__ tab of the specific build, or in the URL for any of the build specific pages
    * If you have multiple regions defined, you are prompted to select one. Otherwise, it auto-selects if there's only one available region.
    * For Player IDs, you can type real, or fake hex-number value
        * For users who followed the ThirdPersonMP setup, you can pick any hex-number, such as 1337, abc123, or etc.
        * Input at least one number, and then hit enter an extra time to finish
* You should receive a response that looks like this:

```json
{
  "ConnectedPlayers": [],
  "FQDN": "...",
  "IPV4Address": "52.180.68.101",
  "LastStateTransitionTime": "2021-12-06T22:12:46.212Z",
  "Ports": [
    {
      "Name": "gameport",
      "Num": 30000,
      "Protocol": "UDP"
    }
  ],
  "Region": "WestUs",
  "ServerId": "...",
  "SessionId": "...",
  "State": "Active",
  "VmId": "..."
}
```

* NOTE: Values unimportant to this example have been replaced with ```...```
* Look for __IPV4Address__ and __Ports.Num__ in your response
    * In the example above, these values are: ```52.180.68.101``` and ```30000``` respectively
    * Your values can/will be different
* Return to your ```RunCloud.bat``` file, and fill in these values for IP-ADDRESS and PORT. Example:

```Batch
ThirdPersonMP 52.180.68.101:30000 -log
```

* From windows explorer, double click this .bat file, to run the game-client, wait a moment, and then double click it again
* This should start two instances of your game-client, both connected to your cloud hosted game server
* From here, you can run around in both games, and you should see that both users' movements and actions are reflected in both game clients, for both players
    * SUCCESS! If you see that, you've completed the full Setup/Build/Deploy/Connect process

## Navigation

For some users, this guide sequence is now finished. You can return to the main [Unreal GSDK Plugin](index.md) guide.

If your test was run on Windows servers, then you can try the more advanced [Linux Server](setting-up-a-linux-dedicated-server-on-playfab.md) deployment guide.
