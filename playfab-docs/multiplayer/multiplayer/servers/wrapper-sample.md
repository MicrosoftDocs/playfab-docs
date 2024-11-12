---
title: Wrapper sample
author: joannaleecy
description: Wrapper sample.
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab. multiplayer, servers
ms.localizationpriority: medium
---

# Wrapper sample

The Wrapper sample, also known as wrappingGsdk, wraps an existing game so it can be used in the deployment of builds for game servers that use **Windows OS** and **Linux OS**.

Using the wrapper application, you would also be able to use your game server build on PlayFab Multiplayer Servers.

> [!Important]
> A wrapper is a workaround by processing the standard output and error streams to call GSDK methods and it's not meant for production use.

## Sample content

This sample consists of two .NET Core console applications.

* Wrapper&mdash;integrates the latest NuGet package for the PlayFab Game Server SDK (GSDK) with your game server. This wrapper application is **not meant for production usage**
* Fakegame&mdash;a basic game server that has no knowledge of GSDK. It is like a typical game server that you would have prior to using PlayFab Multiplayer Servers. It starts the ASP.NET Core Web Server Kestrel that listens to TCP port 80. It's meant to simulate a game server that has absolutely zero knowledge of GSDK. You can use it if you don't have a game server of your own. It has two GET routes we can use, /hello for getting a simple response and /hello/terminate that can terminate the server.

## Requirements

* [.NET Core 3.1 x64 SDK](https://dotnet.microsoft.com/download)

> [!Note]
> In order to use and view the PlayFab Multiplayer Servers, you need to enable the feature from Game Manager. For instructions, see [Enable the PlayFab Server feature](enable-playfab-multiplayer-servers.md).

## Walkthrough
For a live walkthrough of building this sample, check out our presentation from Microsoft Game Dev 2021 (starts at about 2.52):

> [!VIDEO https://www.youtube.com/embed/kj2TcMlvWgk]


## Acquire and build Wrapper executable

* Get the [GSDK wrapper sample](https://github.com/PlayFab/MpsSamples/tree/master/wrappingGsdk) using standard Git methods or downloading this as a zip file
* Open Command Prompt, and use the cd command to change directory path to the wrapper.csproj file location. Example: __cd C:/ReplaceWithYourFilePath/wrappingGsdk/wrapper__
* Then run the following .NET Core CLI command:
```
dotnet publish --self-contained -r win-x64 /p:PublishSingleFile=true /p:PublishTrimmed=true
```

When the wrapper build is successful, the executable is published in the ..\wrappingGsdk\wrapper\bin\Debug\netcoreapp3.1\win-x64\publish folder, as shown in the image below.

![Publish location of the wrapper executable](media/create-your-first-server/wrapper-exe-location.png)

## Create a game server asset

There are two ways to create a game server asset.

### Use Fakegame game server with the wrapper

Use the build.ps1 to build and package both projects (wrapper and fakegame). This script creates a drop folder with a .zip file containing the required files.

* Open PowerShell
* Use the cd command to change directory path to the build.ps1 script location. Example: cd C:/ReplaceWithYourFilePath/wrappingGsdk/
* Run __\build.ps1__
* After the script runs successfully, go to ..\wrappingGsdk\drop\ folder. You'll find a __gameassets.zip__ file containing the fake game server build, wrapper executable (built in the earlier step), and other required files is created.

### Use your own game server files with the wrapper

To use your game project in the evaluation, place the wrapper and your game server executable in the same folder.

* Follow the instructions at [Build the wrapper executable](#acquire-and-build-wrapper-executable)
* Go to the wrapper publish location at ..\wrappingGsdk\wrapper\bin\Debug\netcoreapp3.1\win-x64\publish
* In another window, go to your game server build and files needed to run your game server build. If you're unsure what files are needed, see [Determining DLL files needed](determining-required-dlls.md)
* Copy the gamer server build and all required files into the wrapper publish location
* Select all the files in the wrapper publish location
* With all the files selected, right-click and then select __Send to__ > __Compressed (zip) files to zip__. Don't select the wrapper publish folder and add to zip. This would cause incorrect mapping.

> [!Tip]
> To cross-check, follow the instructions at [Use Fakegame game server with the wrapper](#use-fakegame-game-server-with-the-wrapper) to build the gameassets.zip and use it as a reference.

## Create and upload Linux container image (For Linux servers only)

To create a Linux container image, you would need a Dockerfile. A Dockerfile is a text file with no extension and contains all commands needed to build a given container image. In this sample, this file is already created for you. All you have to do is to build the container image and run it.

If you wish to use your Windows development device, you would need to install Windows Subsystem for Linux (WSL). Instructions are provided below. For more information, see [Windows and Linux container image differences](deploying-linux-based-builds.md#windows-and-linux-container-image-differences).

1. [Set up your Windows development device](deploying-linux-based-builds.md#set-up-your-windows-development-device) (optional)
2. [Get your PlayFab container registry sign-in credentials](deploying-linux-based-builds.md#get-your-playfab-container-registry-sign-in-credentials)
3. Use existing/create your own Dockerfile
    This step is different depending if you're using FakeGame or your own game server.
    * If you're using FakeGame, check that you have the [Dockerfile](https://github.com/PlayFab/MpsSamples/blob/master/wrappingGsdk/Dockerfile)
    * If you're using your game or need to create a Dockerfile, see [Create your Dockerfile](deploying-linux-based-builds.md#create-a-dockerfile). You can use the [Dockerfile](https://github.com/PlayFab/MpsSamples/blob/master/wrappingGsdk/Dockerfile) for FakeGame as a starting point.
4. Open your Linux terminal with Docker installed, like Ubuntu. Replace the values for the TAG and the ACR variables with your values. Then run the commands below.

```docker
TAG="0.1"
ACR="customer5555555.azurecr.io"
docker login ${ACR}
```
>[!TIP]
>To check that ACR and TAG variables are properly defined, run __echo $ACR__ and __echo $TAG__.

5. Enter your username and password obtained from the earlier step.
6. Build and upload the Linux container image. 

Run the commands below to build and upload the Dockerfile. There's a "." at the end of __docker build__ command. You have to be in the same folder/directory as the Dockerfile. For details, see [Build and upload Linux container image](deploying-linux-based-builds.md#build-and-upload-linux-container-image). 

```docker
docker build -t ${ACR}/wrapper:${TAG} .
docker push ${ACR}/wrapper:${TAG}
```

## Deploy a build using Game Manager or API

The deploy build process is similar for both Windows and Linux game servers.

### Deploy Windows game servers

The steps are similar to the Windows Runner C# sample. Follow these steps with differences listed below.

* [Use Game Manager to deploy and configure servers](quickstart-for-multiplayer-servers-game-manager.md)
* [Use PowerShell/API to deploy and configure servers](quickstart-for-multiplayer-servers-api-powershell.md)

If you prefer test this locally, see [Locally debugging game servers and integration with PlayFab](locally-debugging-game-servers-and-integration-with-playfab.md).

**Settings specific to this sample**

* Start command:
    * Use __C:\Assets\wrapper.exe -g C:\Assets\fakegame.exe arg1 arg2__
    * Replace fakegame.exe with the name of your game server executable, if you're using your game server build
* Network configuration: Name: **gameport**, Port: **80**, Protocol: **TCP**
* Assets: When using FakeGame, upload __gameassets.zip__ as an asset.

### Deploy Linux game servers

Follow the general steps below to deploy.
* [Use Game Manager to deploy and configure servers](deploy-using-game-manager.md)
* [Use PowerShell/API to deploy and configure servers](deploy-using-powershell-api.md)

**Settings specific to this sample**

* Select the container you uploaded
* Network configuration: Name: **gameport**, Port: **80**, Protocol: **TCP**
* No need to upload assets and set __Start Command__

> [!Note]
> During the allocation when using RequestMultiplayerServer API, the port you connect to will be different than 80. This is because the PlayFab Multiplayer Server service will create a mapping between the Azure Load Balancer (that exposes your ports to the Public internet) to the game servers running on the Azure Virtual Machines.

## Running the wrapper using the LocalMultiplayerAgent

Using LocalMultiplayerAgent is highly recommended if you want to test GSDK integration on your custom game servers.

If you're using LocalMultiplayerAgent with Windows Containers, you need to properly configure MultiplayerSettings.json file. You can find an example below, pay special attention to the values of LocalFilePath and StartGameCommand. Don't forget to replace fakegame.exe with the name of your game server executable.

```json
"AssetDetails": [
    {
        "MountPath": "C:\\Assets",
        "SasTokens": null,
        "LocalFilePath": "C:\\projects\\gsdkSamples\\wrappingGsdk\\drop\\gameassets.zip"
    }
],
"StartGameCommand": "C:\\Assets\\wrapper.exe -g C:\\Assets\\fakegame.exe",

// if you are using fakegameserver you should also configure port mapping for port 80
"PortMappingsList": [
            [
                {
                    "NodePort": 56100,
                    "GamePort": {
                        "Name": "gameport",
                        "Number": 80,
                        "Protocol": "TCP"
                    }
                }
            ]
        ]
```

You're now ready to test with LocalMultiplayerAgent. If you have configured it correctly, as soon as LocalMultiplayerAgent launches your game server, you can connect to it via curl at **http://localhost:56100/Hello**.

## How to connect to a Game Server on MPS

To establish a connection with a game server on MPS, it is essential to determine the appropriate port number. This requirement arises from the configuration where multiple virtual machines, each possibly running numerous game server instances, are managed behind a load balancer. In such a setup, a single public IP port might correspond to different ports on these virtual machines, each associated with a distinct game server instance.

### Use Game Manager

You can use the Game Manager UI to allocate a game server and establish a connection to it.
1. Log in to Game Manager
1. Go to the Multiplayer => Servers page, select your build
1. Go to the Servers page, and click the "Request server" button.
1. On the next page, Take note of the public **IPv4 address** and the **Port**.
1. Use curl to connect at **http://[IPV4Address]:[Ports->Num]/Hello**."

### Use MPS Allocator sample

Here's how you can use the [MPS Allocator Sample](mps-allocator-sample.md) to allocate a game server, and establish a connection to it.
1. Compile and execute the MPS Allocator sample.
1. Apply the "ListBuildSummaries" command to view the available builds and their corresponding build IDs.
1. Invoke "RequestMultiplayerServer" to initiate a request for a game server instance.
1. Input the selected build ID into the "ListMultiplayerServers" command to generate a list of available servers.
1. Choose an active game server instance and then employ "GetMultiplayerServerDetails" with the build and session IDs obtained from the previous steps.
1. Take note of the **IPV4Address** and **Ports->Num** displayed in the response.
1. Use curl to connect at **http://[IPV4Address]:[Ports->Num]/Hello**.

## See also

* [Create your first server](create-your-first-server.md)
* [Resources and samples](server-samples-resources.md)
* [PlayFab Multiplayer Server SDKs](server-sdks.md)
* [API Reference](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)
