---
title: Debug Container-based game servers using LocalMultiplayerAgent
author: emmayspark
description: How to run a game server using LocalMultiplayerAgent in Container mode
ms.author: emmapark
ms.date: 03/01/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, multiplayerServer, localMultiplayerAgent, MPSAgent, GSDK, MPS Debugging tool
ms.localizationpriority: medium
---

# How to run a game server using LocalMultiplayerAgent in Container mode

This tutorial describes how to:
- Create a [Linux/Windows] Container Build using the Wrapper Sample
- Configure MultiplayerSettings.json
- Docker setup
- Run LocalMultiplayerAgent
- Test your game connection

## Create a [Linux/Windows] Container Build

If you're unfamiliar with container, see [Introduction to Container and Docker](/dotnet/architecture/microservices/container-docker-introduction/).

We'll learn how to package an existing sample as a Windows or Linux container. You'll need to configure different settings for different platforms (Windows/Linux based Container). Here we'll use the Wrapper sample and go over the details.

### Linux Container Build

You can run the wrapper and fakegame executable on a Linux Build, using Linux containers. In this case, you need to create a Linux build.
To learn how to create Wrapper Linux build, see [how to create a Linux container image](../wrapper-sample.md#create-and-upload-linux-container-image-for-linux-servers-only)

### Windows Container Build

LMA will create a Windows Container Build for you. You just need to configure the settings correctly (Check out later how to configure settings for Windows Container)

## Configure MultiplayerSettings.json

Navigate to the folder where you extracted the LMA toolset and open the MultiplayerSettings.json file. This file is a build configuration mock file that simulates the build on MPS.

You can also populate a json using [LMA MultiplayerSettings.json Generator](https://github.com/PlayFab/MpsAgent/tree/main/LocalMultiplayerAgent/SettingsJsonGenerator). The Generator is a simple web page that creates a json based on your options. You can find the Generator under LocalMultiplayerAgent/SettingsJsonGenerator.  

Here's the example of MultiplayerSettings.Json to run the Wrapper sample as `Linux Container`.

```json
{
    "RunContainer": true, // Set RunContainer to true if you are running LMA in Container mode.
    "OutputFolder": "C:\\output\\LMAContainer", // Path where config files and logs will be generated from LMA at each run
    "NumHeartBeatsForActivateResponse": 10,
    "NumHeartBeatsForTerminateResponse": 60,
    "TitleId": "", // default value
    "BuildId": "00000000-0000-0000-0000-000000000000", // default value
    "Region": "59F84", // default value
    "AgentListeningPort": 56001, // default value
    "ContainerStartParameters": {
        /// replace ImageDetails fields to your own images saved on ACR.
        "ImageDetails": {
            "Registry": "mydockerregistry.io",
            "ImageName": "wrapper",
            "ImageTag": "0.1",
            "Username": "",
            "Password": ""
        }
    },
    "PortMappingsList": [
        [
            {
                "NodePort": 56100,
                "GamePort": {
                    "Name": "game_port", 
                    // The same value of GamePort Name should be also defined in the Wrapper so Wrapper can get a port information while it's running.
                    "Number": 80,
                    "Protocol": "TCP"
                }
            }
        ]
    ],
}
```

For `Windows Container`, you don't need to build your container. LMA will package your game server as Windows Container. You just need to specify the Windows container base image in `ImageDetails` field and set `LocalFilePath` to where your game asset is located on your work station.

```json
"AssetDetails": [
    {
      "MountPath": "C:\\Assets",  
      // Mount Path should be "C:\\Assets" for Windows Container. 
      "LocalFilePath": "D:\\gameassets.zip" 
      // where your game server is located as an archive format.
    }
  ]

 "ContainerStartParameters": {
    "StartGameCommand": "C:\\Assets\\wrapper.exe -g C:\\Assets\\fakegame.exe arg1 arg2", 
    // Your game assets will be extracted under C:\\Assets (default mount path for Windows Container) and LMA will run your game server with StartGameCommand argument. 
     // Make sure the StartGameCommand provided above is an example of the Wrapper sample. 
    "ImageDetails": {
      "Registry": "mcr.microsoft.com",
      "ImageName": "playfab/multiplayer",
      "ImageTag": "wsc-10.0.17763.973.1",
      "Username": "", 
      "Password": ""
      // username and password are not required to use MCR image.
    }
    // LMA will package an existing game sample (path defined in LocalFilePath) as a Windows container.
 }

```

Make sure to update the following fields correctly in the MultiplayerSettings.json to run LMA in Container mode.

- `LocalFilePath` - Full Local Path (on your workstation) to the game server asset zip file created earlier, for example: D:\\gameassets.zip (note that backslashes need to be escaped for JSON formatting). This field is required for Windows Container as LMA needs to locate your game asset and then package it into a container. 

- `PortMappingsList` - These are the ports that are available to your game while running. 
  - `NodePort` is the port that is opened on your workstation and will be mapped to the GamePort.
  - `GamePort.Number` is the port that your game server needs to bind to when running in a container. For example, here we set port number as 80 which fakegame.exe will be listening to.
  - Set the `GamePort.Name` to the same value as defined in your game server. You can check the GSDK config at runtime for the value with the key GamePort.Name.
  - `GamePort.Protocol` - Specify protocol type: TCP or UDP
  
  Update the GamePort section to match the protocol and port at which your game server is listening for clients. You can add multiple ports.

- `ForcePullFromAcrOnLinuxContainersOnWindows` - Set true when you want to pull Linux Container Image from Docker Registry and avoid pulling from the local registry. In most cases, you'd want this set to false.

- `ContainerStartParameters.ImageDetails` - Your game server image can be published on a container registry or can be locally built. If you want to pull Linux Container image from Docker Registry (For example, Azure Registry), you need to set value for username and password and set `ForcePullFromAcrOnLinuxContainersOnWindows` as true. For Windows Container, username and password aren't required.

- `OutputFolder` - Path to a drive or folder where the outputs and config files are generated. Ensure that there's sufficient space available since the game server will be extracted under this path. If not specified, the agent folder is used.

- `AgentListeningPort` - This is the port for the LMA to communicate with the game server. Any open port will work, 56001 is a default value. If you have another process binding to 56001, you must change this value or kill the other process on port 56001.

- `ResourceLimits` (optional) - If specified, docker limits CPU/memory usage. Warning: If your server goes over the allowed memory, it's killed. ResourceLimits can only be specified in container mode.

- `SessionCookie` (optional) - Any session cookie that is passed to your game server as part of the RequestMultiplayerServer API call. In the real scenario on MPS, after the connection is established, server will notify the client to load corresponding resources from SessionCookie.

## Docker set up 

Run PowerShell scripts to set up the docker networks called "PlayFab" and add firewall rules to communicate with LocalMultiplayerAgent.

- For Linux Container, Run `SetupLinuxContainersOnWindows.ps1`.  
  For Windows Container, Run `Setup.ps1`. It will pull down the PlayFab docker image from Microsoft/PlayFab-Multiplayer.   
  Note that the first time the script runs, it can take a few minutes to download the container image. 
    > To run this setup successfully, you may have to configure the firewall of any 3rd party antivirus program that you have installed.  

To learn how target the correct docker daemon between Windows and Linux containers, see [How to switch Docker to use Windows/Linux Container](https://docs.docker.com/desktop/windows/#switch-between-windows-and-linux-containers)

## Run LocalMultiplayerAgent

- In a PowerShell window :  
Navigate to directory under LMA that contains LocalMultiplayerAgent.exe.

- Run `LocalMultiplayerAgent.exe` for Windows Container.  
  Run `LocalMultiplayerAgent.exe -lcow` for Linux Container.  
  (lcow stands for Linux Containers On Windows)

  At this point, LMA sets up the http listener and run a container. 
  You can run `docker ps` command to see running containers on your machine.

LMA will wait for heartbeats from the GSDK integrated with your game server.
If the GSDK is integrated correctly, LMA prints the outputs as following order:

1. `CurrentGameState - Initializing`   
(This may not show up if your game server directly calls GSDK::ReadyForPlayers and doesn't call GSDK::Start)  
2. `CurrentGameState - StandingBy`  
3. `CurrentGameState - Active`  
4. `CurrentGameState - Terminating`

To learn more about states of a game server, see [What is Game Server Lifecycle of PlayFab Multiplayer Server](../multiplayer-game-server-lifecycle.md).

If the shutdown callbacks are set up correctly, your game server exits soon after the state is set to terminating. 
It's important to verify that the game server exits to avoid ungraceful shutdowns on the PlayFab platform.

The LMA should also terminate along with the game.

## Test connection to your game

Once LMA prints **CurrentGameState - Active**, you can connect to your game server using IP address 127.0.0.1 and port NodePort on which your game server is listening.

If you're using Wrapper sample, you can test a GET request by entering the address http://127.0.0.1:56100/Hello into your browser. 
For more details, check out the Wrapper sample. 

You can also update the values of **NumHeartBeatsForActivateResponse** and **NumHeartBeatsForTerminateResponse** in MultiplayerSettings.json to adjust the duration of standing-by/active state.

### Troubleshooting

- In container mode, if your game server exits immediately with an error similar to "Container ... exited with exit code 1", but it works fine in process mode, make sure that you've included all required [system DLLs](../determining-required-dlls.md) in your asset package.
- All logs are located under `OutputFolder` that is specified in the *MultiplayerSettings.json* file. **LocalMultiplayerAgent** creates a new folder each time it's started, with the timestamp as folder name. All game server logs emitted via GSDK are located within the GameLogs folder.  
If the game server is running in a container, there might be an additional level of directory hierarchy to shift through.
- The GSDK writes debug logs to the GameLogs folder under the `OutputFolder`. 
These logs are located within the GameLogs folder along with the logs output by the game server.
- Ensure firewalls (windows and other anti-virus) are configured to allow the traffic over the ports.
- If you get an error similar to: `Docker API responded with status code=InternalServerError, response={"message":"failed to create endpoint <container_name> on network playfab: hnsCall failed in Win32: The specified port already exists". It is likely there is already a container running on the specified port.` This can happen if **LocalMultiplayerAgent** exits prematurely. Use the command `docker ps` to find the container that is running, and then delete it using `docker kill <container_name>`.
- If you get an error that contains `Failed to find network 'playfab'`. Try rerunning *Setup.ps1*

### Known Limitations

1. Containers might not terminate at the end of the debugging. If this occurs, run the following PowerShell commands as Administrator. These commands stop and remove all containers, including those weren't started by **LocalMultiplayerAgent**.

```powershell
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)  
```
