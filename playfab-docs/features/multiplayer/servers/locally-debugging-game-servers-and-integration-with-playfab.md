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

PlayFab multiplayer game servers require integration with the [PlayFab Game Server SDK (GSDK)](integrating-game-servers-with-gsdk.md). In addition, game servers are run as containerized applications on the PlayFab Multiplayer platform.

Running them as containerized applications enables running and debugging the server locally, in an environment that matches that of the PlayFab platform in **Azure**. This facilitates faster development iterations. This article helps you verify that your PlayFab game server conforms to the platform requirements.  

The PlayFab local debugging toolset includes a mock PlayFab **VmAgent** that provides mock responses to the **GSDK**, and verifies whether your game is integrated with **GSDK** correctly. With the mock responses, it cycles the game server through various states in its lifecycle on the PlayFab Multiplayer platform.

The agent can also be configured to run the game server as a containerized application, and verify that your game server is packaged with all the required dependencies and will run without issues.

## Setup

- Download the local debugging toolset from [here](https://github.com/PlayFab/LocalMultiplayerAgent/releases) and extract it to a folder of your choice (such as **C:\PlayFabVmAgent**).  

## Verifying GSDK integration

Integrate your game server with **GSDK** and build it. More information is available in our tutorial [Integrating game servers with the PlayFab Game Server SDK (GSDK)](integrating-game-servers-with-gsdk.md).  

- In the extracted folder, you will find a **MultiplayerSettings.json** file, open it in a text editor (such as [Visual Studio Code](https://code.visualstudio.com/download)) and update the following properties:  
  - **OutputFolder**: Path to a drive or folder where the outputs and config files will be generated. Ensure there is sufficient space available since the game server will be extracted under this path.
  - **RunContainer**: Set it to *false*.
- In a **Powershell** window (as Administrator):  
  - **cd** in to the folder where the toolset was extracted.
  - Run **MockVmAgent.exe**. At this point, the **MockVmAgent** acts as **HTTP** listener, waiting for heartbeats from the **GSDK** integrated with your game server.
- Run your game server executable as it would be started on the PlayFab platform (if the game server needs **cmdline** arguments, you may need to run it from a **cmd** window).
- If the **GSDK** has been integrated correctly, you will see the **MockVmAgent** print the following outputs:  
  - **CurrentGameState** - Initializing (this is optional and may not show up if your game directly calls **GSDK::ReadyForPlayers** and does not call **GSDK::Start**).
  - **CurrentGameState** - StandingBy  
  - **CurrentGameState** - Active
  - **CurrentGameState** - Terminating
- After the terminating state, your game should exit shortly, saying that the shutdown callbacks have been set up correctly. It is important to verify this, to avoid ungraceful shutdowns on the PlayFab platform.
- Close the console window for **MockAgent.exe** (which will terminate it).

### Testing connection to your game

Once your game executable is running and **MockVmAgent** output prints **CurrentGameState - Active**, you should be able to connect to your game using the **IP** address **127.0.0.1**, and the port at which your game server is listening on.

The **MockVmAgent** requests the game server to terminate (via **GSDK**) after a configurable number of heartbeats. This can be tuned by updating **NumHeartBeatsForTerminateResponse** in the **MultiplayerSettings.json** file.

## Verifying containerization

### Pre-requisites

- **Windows 10** with April 2018 (**1803**) update.  
- Get the docker from [here](https://download.docker.com/win/stable/Docker%20for%20Windows%20Installer.exe) or from the main [page](https://www.docker.com/products/docker-desktop).

### Running the game server in a container

- In a **Powershell** window (as Administrator):  
  - **cd** in to the folder where the toolset was extracted.  
  - Run **Setup.ps1**. This should set up docker networks, firewall rules to communicate with the local mock Playfab **VMagent**, and pull down the PlayFab docker image from [Microsoft/PlayFab-Multiplayer](https://hub.docker.com/r/microsoft/playfab-multiplayer/). The first time this set up runs, it can take a few minutes while it downloads the container image. You might need to override the execution policy to allow script execution.

- Compress your game server and its dependencies to a zip archive, in the same way that it's uploaded to PlayFab multiplayer platform.

  > [!NOTE]
  > Avoid this common mistake - do not accidentally zip a folder *within* a folder in the zip. After zipping, browse the zip folder and double-check that your compression software did not add an extra layer of file hierarchy.

- In the folder where PlayFab multiplayer toolset was extracted, you will find a **MultiplayerSettings.json** file.  Open it in a text editor (such as [Visual Studio Code](https://code.visualstudio.com/download)) and update the following properties:
  - **RunContainer**: Set it to *true*.
  - **OutputFolder**: Path to a drive or folder where the outputs and config files will be generated. Ensure there is sufficient space available, since the game server will be extracted under this path.
  - **LocalFilePath**: Full local path (on your workstation) to the game server asset zip file created earlier.  For example: **D:\\\\MyAmazingGame\\\\asset.zip** (note that backslashes need to be escaped for **JSON** formatting).
  - **MountPath**: The path within the container where the asset should be mounted. The sample value should be:  **C:\\\\Assets** (note that backslashes need to be escaped for **JSON** formatting).
  - **StartGameCommand**: The full path to the game server executable within the container (that includes the mount path above). Assuming the executable name is:  **mygame.exe**, a sample path would be **C:\\\\Asssets\\\\mygame.exe**.
  - **PortMappingsList**: Update the **GamePort** section to match the protocol and port where your game server is listening for clients. You can leave **NodePort** at **56100**. If your game needs multiple ports, copy/paste the existing port configuration and increment **NodePort** (along with new **GamePort** settings).
  - **SessionCookie** (optional): Any session cookie that gets passed to your game server as part of the [RequestMultiplayerServer API](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.requestmultiplayerserver) call.

- Open a **Powershell** window (as Administrator) in the folder where the toolset was extracted (**C:\PlayFabVmAgent**) and run **MockVmAgent.exe**. Eventually, you should see game state change output in the **Powershell** window (just like in the Verifying **GSDK** integration section above).

### Testing connection to your game running within a container

Once your game executable is running and **MockVmAgent** output prints **CurrentGameState - Active**, you should be able to connect to your game using **ipaddress 127.0.0.1** and **port = NodePort** (by default **56100**) that's specified in the **MultiplayerSettings.json** file.

The **MockVmAgent** requests the game server to terminate (via **GSDK**) after a configurable number of heartbeats. This can be tuned by updating **NumHeartBeatsForTerminateResponse** in the **MultiplayerSettings.json** file.

### Troubleshooting

- All logs are located under **OutputFolder** specified in the **MultiplayerSettings.json** file. **MockVmAgent** creates a new folder each time it is started, with the timestamp as folder name. All game server logs emitted via **GSDK** are located within the **GameLogs** folder.

If the game server was run within a container, there might be an addition level of directory hierarchy to sift through. The **GSDK** itself emits some logging for debugging purposes. These logs are also located within the **GameLogs** folder.
  
- **MockVmAgent** should be restarted for each iteration of testing. In some cases, based on in-memory state, it will request the game server to terminate immediately on the first response. A restart of the **MockVmAgent** will fix that.

## Known limitations

1. **Linux** is not currently supported, but will be added soon.
2. Containers may not be stopped at the end of the debugging.

Please run the commands below in **Powershell** (as Administrator). Note that these will stop and remove all containers, including ones not started by the **MockAgent**.

```powershell
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)  
```
