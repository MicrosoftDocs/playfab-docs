---
title: Debug Process-based game servers using LocalMultiplayerAgent
author: emmayspark
description: How to run a game server using LocalMultiplayerAgent in Process mode
ms.author: emmapark
ms.date: 03/01/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, multiplayerServer, localMultiplayerAgent, MPSAgent, GSDK, MPS Debugging tool
ms.localizationpriority: medium
---

# How to run a game server using LocalMultiplayerAgent in Process mode

This tutorial describes how to:
- Create a Build using the Wrapper sample
- Configure MultiplayerSettings.json
- Run LocalMultiplayerAgent
- Test your game connection

## Create a Game Build

To test your game servers using LocalMultiplayerAgent(LMA), your need to create a game build and save it as archive format. 
To make it easier for you, we provide the Wrapper sample with an instruction and PowerShell script. 

Next, follow the step "[Wrapping an existing game server using the wrapper app](https://github.com/PlayFab/MpsSamples/tree/main/wrappingGsdk#wrapping-an-existing-game-server-using-the-wrapper-app)" to get your game server ready for this tutorial.

## Configure MultiplayerSettings.json

Navigate to the folder where you extracted the LMA toolset and open the MultiplayerSettings.json file. This file is a build configuration mock file that simulates the build on MPS.

You can populate json using [LMA MultiplayerSettings.json Generator](https://github.com/PlayFab/MpsAgent/tree/main/LocalMultiplayerAgent/SettingsJsonGenerator).
The Generator is a simple web page that creates json based on your options. You can find the Generator under extracted folder of LMA.  
  
Here's the example of MultiplayerSettings.json for Wrapper sample to run LMA in Process mode.

```json
{
  "RunContainer": false, // Set RunContainer to false if you are running LMA in Process mode.
  "OutputFolder": "C:\\output\\WindowProcess", // Path where config files and logs will be generated from LMA at each run
  "NumHeartBeatsForActivateResponse": 10, // default value
  "NumHeartBeatsForTerminateResponse": 60, // default value
  //the server will run in stand-by mode for 10 heartbeats and stay in active state for 35 heartbeats.
  "TitleId": "59F84", // default value
  "BuildId": "8624d52e-87a1-4a12-b7f6-b92720ef8919", // default value
  "Region": "EastUs", // default value
  "AgentListeningPort": 56001, // default value
  "AssetDetails": [
    {
      "MountPath": "",  // Mount Path is only required for Container mode. leave it as blank.
      "SasTokens": null,
      "LocalFilePath": "D:\\gameassets.zip" // where your game server is located as an archive format.
    }
  ],
  "ProcessStartParameters": {
    "StartGameCommand": "wrapper.exe -g fakegame.exe arg1 arg2" 
    // shell command to run Wrapper. Command will be executed where game asset is extracted.
    // Make sure the StartGameCommand provided above is an example of the Wrapper sample. 
  },
  "PortMappingsList": [
    [
      {
        "NodePort": 56100, // default value
        "GamePort": {
          "Name": "game_port",
           // Port name is already defined in the Wrapper sample. Wrapper will grab the port information using game_port via GSDK while it's running.
          "Protocol": "TCP"
        }
      }
    ]
  ],
}

```

Make sure to update the following fields correctly in the MultiplayerSettings.json to run LMA in Process mode.

- `LocalFilePath` - Full Local Path (on your workstation) to the game server asset zip file created earlier, for example: D:\\MyAmazingGame\\asset.zip (note that backslashes need to be escaped for JSON formatting).

- `StartGameCommand` - The StartGameCommand path for a process is a relative path. The working directory will be where your game asset is extracted.

- `PortMappingsList` - These are the ports that are available to your game while running. 
  - `NodePort` is the port that is opened on your workstation
  - `GamePort.Number` isn't required for Process mode. Port number will be bound to Node Port via GSDK when your game server is running. In the real scenario, MPS will bind the port dynamically for each Process-based game session. 
  - Set the `GamePort.Name` to the same value as defined in your game server. You can check the GSDK config at runtime for the value with the key GamePort.Name. If you're using the Wrapper Sample, port name is already defined to "game_port", so you should set the same value here.

  - `GamePort.Protocol` - Specify protocol type: TCP or UDP
 
- `OutputFolder` - Path to a drive or folder where the outputs and config files are generated. Ensure that there's sufficient space available since the game server will be extracted under this path. If not specified, the agent folder is used.

- `AgentListeningPort` - This is the port for the LMA to communicate with the game server. Any open port will work, 56001 is a default value. If you have another process binding to 56001, you must change this value or kill the other process on port 56001.

- `ResourceLimits` - not required for Process mode.

- `MountPath` - not required for Process mode.

- `SessionCookie` (optional) - Any session cookie that is passed to your game server as part of the RequestMultiplayerServer API call. In the real scenario on MPS, after the connection is established, server will notify the client to load corresponding resources from SessionCookie.


## Run LocalMultiplayerAgent

Now you're ready to run LocalMultiplayerAgent.

- In a PowerShell window :  
Navigate to directory under LMA that contains LocalMultiplayerAgent.exe.

- Run `LocalMultiplayerAgent.exe`. 
At this point, LMA sets up the http listener, unzips the game asset, and starts the game server in a separate process. 

  > If you are running your game server as a Process, the Windows Firewall may pop-up and ask if you want to allow traffic to the NodePort you specified. If you want to avoid that, you can either run the LocalMultiplayerAgent in admin mode or enable the port in the firewall.

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

If you're using Wrapper sample, You can test a GET request by entering the address http://127.0.0.1:56100/Hello into your browser. 
For more details, check out the Wrapper sample. 

You can also update the values of **NumHeartBeatsForActivateResponse** and **NumHeartBeatsForTerminateResponse** in MultiplayerSettings.json to adjust the duration of standing-by/active state.
