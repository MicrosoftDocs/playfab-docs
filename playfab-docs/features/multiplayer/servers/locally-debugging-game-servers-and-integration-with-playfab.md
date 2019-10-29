---
title: Locally debugging game servers and integration with PlayFab
author: v-thopra
description: Describes how to integrate PlayFab multiplayer game servers with the PlayFab Game Server SDK (GSDK) and verify and debug the integration.  
ms.author: v-thopra
ms.date: 01/15/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, debugging, integration, thunderhead, playfab game server sdk
ms.localizationpriority: medium
---

# Locally debugging game servers and integration with PlayFab

## Overview

PlayFab multiplayer game servers require integration with [PlayFab Game Server SDK (GSDK)](integrating-game-servers-with-gsdk.md). In addition, game servers are run as containerized applications on the PlayFab Multiplayer platform.  

Running them as containerized applications enables running and debugging the server locally, in an environment that matches that of the PlayFab platform in Azure. This facilitates faster development iterations. This article helps you verify that your PlayFab game server conforms to the platform requirements.  

The PlayFab local debugging toolset includes a mock PlayFab VmAgent that provides mock responses to the GSDK and verifies whether your game is integrated with the GSDK correctly. With the mock responses, the VmAgent cycles the game server through various states in its lifecycle on the PlayFab Multiplayer platform.  

The agent can also be configured to run the game server as a containerized application and verify that your game server is packaged with all the required dependencies and will run without issues on the PlayFab Multiplayer platform.

## Basic Setup

- Integrate your game server with the GSDK and build it. More information is available in our tutorial [Integrating game servers with the PlayFab Game Server SDK (GSDK)](integrating-game-servers-with-gsdk.md).  
- Compress your game server and its dependencies to a zip archive, in the same way that it's uploaded to PlayFab Multiplayer platform.  

  > [!NOTE]
  > Avoid this common mistake - do not accidentally zip a folder *within* a folder in the zip. After zipping, browse the zip folder and double-check that your compression software did not add an extra layer of file hierarchy.

- Download the local debugging toolset from [here](https://github.com/PlayFab/LocalMultiplayerAgent/releases) and extract it to a folder of your choice (such as **C:\PlayFabVmAgent**).
- In the extracted folder, you will find a **MultiplayerSettings.json** file, open it in a text editor (such as [Visual Studio Code](https://code.visualstudio.com/download)) and update the following properties:  
  - **OutputFolder**: Path to a drive or folder where the outputs and config files will be generated. Ensure there is sufficient space available since the game server will be extracted under this path.
  - **LocalFilePath**: Full Local Path (on your workstation) to the game server asset zip file created earlier, for example: **D:\\\\MyAmazingGame\\\\asset.zip** (note that backslashes need to be escaped for JSON formatting).
  - **MountPath**: The path within the container that the asset should be mounted at. We recommend using the sample value - **C:\\\\Assets** (note that backslashes need to be escaped for JSON formatting).
  - **StartGameCommand**: The full path to the game server executable within the container (that includes the mount path above). Assuming the executable name is **mygame.exe**, a sample path would be **C:\\\\Assets\\\\mygame.exe**.
  - **PortMappingsList**: Update the GamePort section to match the protocol and port at which your game server is listening for clients. You can leave NodePort at 56100. If your game needs multiple ports, copy paste the existing port configuration and increment NodePort (along with new GamePort settings).
  - **SessionCookie** (optional): Any session cookie that gets passed to your game server as part of the [RequestMultiplayerServer API](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.requestmultiplayerserver) call.

## Verifying GSDK integration

- In the **MultiplayerSettings.json** file, set **RunContainer** to **false**.
- In a Powershell window (as Administrator):  
  - **cd** in to the folder where the toolset was extracted.
  - Run **MockVmAgent.exe**. At this point, the **MockVmAgent** sets up the http listener, unzips the game asset and starts the game server in a separate Process and waits for heartbeats from the GSDK integrated with your game server.
- If the GSDK has been integrated correctly, you will see the **MockVmAgent** print the following outputs:  
  - **CurrentGameState - Initializing** (this is optional and may not show up if your game directly calls **GSDK::ReadyForPlayers** and does not call **GSDK::Start**)
  - **CurrentGameState - StandingBy**  
  - **CurrentGameState - Active**
  - **CurrentGameState - Terminating**
- After the terminating state, your game should exit soon, if the shutdown callbacks have been set up correctly. It is important to verify this to avoid ungraceful shutdowns on the PlayFab platform.
- The **MockVmAgent** should also terminate along with the game.

### Testing connection to your game

Once your game executable is running and **MockVmAgent** output prints **CurrentGameState - Active**, you should be able to connect to your game using **ipaddress 127.0.0.1** and the port at which your game server is listening on.

The **MockVmAgent** requests the game server to terminate (via GSDK) after a configurable number of heartbeats. This can be tuned by updating **NumHeartBeatsForTerminateResponse** in the **MultiplayerSettings.json** file.

## Verifying containerization

### Prerequisites

- Windows 10 Pro (or above) with April 2018 (1803) update.
- Get Docker from [here](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe) or from the main [page](https://www.docker.com/products/docker-desktop).

### Setup

- Ensure that Docker is set to [use Windows Containers](https://docs.docker.com/docker-for-windows/#switch-between-windows-and-linux-containers)
- In a Powershell window (as Administrator):  
  - **cd** in to the folder where the toolset was extracted.  
  - Run `Setup.ps1`. This should set up docker networks, firewall rules to communicate with the local **MockVmAgent** and pull down the PlayFab docker image from [Microsoft/PlayFab-Multiplayer](https://hub.docker.com/r/microsoft/playfab-multiplayer/). Note that the first time this set up runs, it can take a few minutes while it downloads the container image.  
      > [!NOTE]
    > To run this setup successfully, you may have to configure the firewall of any 3rd party antivirus program (such as McAfee, Norton, or Avira) that you have installed.  

### Running the game server within a container

- In the **MultiplayerSettings.json file**, set **RunContainer** to **true**.
- Open a **Powershell** window (as Administrator) in the folder where the toolset was extracted (C:\PlayFabVmAgent) and run `MockVmAgent.exe`. This should start the game server within a container. Eventually, you should see game state change output in the Powershell window (just like in the Verifying GSDK integration section above).

### Testing connection to your game running within a container

Once your game executable is running and MockVmAgent output prints **CurrentGameState - Active**, you should be able to connect to your game using **ipaddress 127.0.0.1** and **port = NodePort** (by default **56100**) that's specified in the **MultiplayerSettings.json** file.

The MockVmAgent requests the game server to terminate (via GSDK) after a configurable number of heartbeats. This can be tuned by updating **NumHeartBeatsForTerminateResponse** in the **MultiplayerSettings.json** file.

### Troubleshooting

- All logs are located under **OutputFolder** specified in the **MultiplayerSettings.json** file. MockVmAgent creates a new folder each time it is started, with the timestamp as folder name. All game server logs emitted via GSDK are located within the GameLogs folder.  
If the game server was run within a container, there might be an addition level of directory hierarchy to sift through. The GSDK itself emits some logging for debugging purposes. These logs are also located within the GameLogs folder.  
- Ensure firewalls (windows and other anti-virus) are configured to allow the traffic over the ports.  
- If you get an error similar to: Docker API responded with status code=InternalServerError, response={"message":"failed to create endpoint <container_name> on network playfab: hnsCall failed in Win32: The specified port already exists". It is likely there is already a container running on the specified port. This can happen if the MockVmAgent exits prematurely, Find the container that is running via the command `docker ps`, and then kill it using `docker kill <container_name>`.

### Known Limitations

1. Linux is not currently supported, but will be added soon.
2. Containers may not be stopped at the end of the debugging. Please run the commands below in a powershell (as Administrator). Note that these will stop and remove all containers, including ones not started by the MockVmAgent.

```powershell
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)  
```
