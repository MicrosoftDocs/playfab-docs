---
title: Determining required DLLs
author: andhesky
description: Describes how to determine the list of dlls required for your game servers and how to compare that list to the set of dlls in PlayFab MPS.  
ms.author: andhesky
ms.date: 03/12/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, debugging, integration, thunderhead, playfab game server sdk
ms.localizationpriority: medium
---

# Determining required DLLs that need to be included in the asset package
In order to properly run your game server, all dependent DLLs must be present in the container. When using Linux containers, you can build dependent DLLs into your container image or include them in the asset zip file. When using Windows, PlayFab includes many commonly used DLLs in the container image. Any additional DLLs must be included in your asset zip file. This article walks through the steps to determine the list of DLLs required on Windows then allows you to compare that list against the DLLs that are included in the managed container image.

## Determine required DLLs
1. Download [ListDlls](https://docs.microsoft.com/en-us/sysinternals/downloads/listdlls) from sysinternals.
1. Run the game server exe that you wish to containerize on your local machine. This can be done using the [local debug steps](.\locally-debugging-game-servers-and-integration-with-playfab.md) in **process mode** or as a standalone process without using the mock agent.
1. Run listdlls exe pointing at your running game server. Example: `listdlls ServerLoadSimulator.exe`
1. The list of DLLs that are not in your exe folder are the system DLLs required by your game server. The next step is to determine which are included in the container.

![listdlls-output](media\listdlls-output.png)

## Compare required DLLs with those included in container
1. Download the PlayFab multiplayer container image (setup.ps1 script referenced in [local debug steps](locally-debugging-game-servers-and-integration-with-playfab.md) with do this for you). Alternatively, allocate a new thunderhead instance and RDP.
1. Start a command line session in a new docker container by running the command `docker run -it mcr.microsoft.com/playfab/multiplayer:wsc-10.0.17134.950 cmd` in an administrator command window. Replace "wsc-10.0.17134.285" with the tag of the docker image you downloaded in step 1. If you are not sure of the correct tag to use, the list of downloaded images can be queried by running `docker images`.

![docker images output](media\docker-images.png)

1. While running within the container, you can navigate via the command line to find which DLLs are present. Look for the required system DLLs discovered in the previous section. Any that are missing need to be included in the asset zip.
1. Type `exit` to end the cmd process which will cause the container to exit.
