---
title: Wrapper sample
author: joannaleecy
description: Wrapper sample.
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.prod: playfab
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

* Wrapper&mdash;integrates the latest Nuget package for the PlayFab Game Server SDK (GSDK) with your game server. Note that this wrapper application is **not meant for production usage**
* Fakegame&mdash;a basic game server that has no knowledge of GSDK. It is like a typical game server that you would have prior to using PlayFab Multiplayer Servers. It starts the ASP.NET Core Web Server Kestrel that listens to TCP port 80. It's meant to simulate a game server that has absolutely zero knowledge of GSDK. You can use it if you don't have a game server of your own. It has two GET routes we can use, /hello for getting a simple response and /hello/terminate that can terminate the server.

## Requirements

* [.NET Core 3.1 x64 SDK](https://dotnet.microsoft.com/download)

> [!Note]
> In order to use and view the PlayFab Multiplayer Servers, you need to enable the feature from Game Manager. For instructions, see [Enable the PlayFab Server feature](enable-playfab-multiplayer-servers.md).

## Wrapper with Fakegame

If you don't have a game server portion for your game, you can use Fakegame. 

1. Get the [GSDK wrapper sample](https://github.com/PlayFab/MpsSamples/tree/master/wrappingGsdk) using standard Git methods or downloading this as a zip file
2. [Build Wrapper executable](#build-wrapper-executable)
3. This step is different depending on the types of servers you want to deploy. 
    * To deploy Windows game servers, see [Combine Fakegame and the above Wrapper appplication as a zip file](#combine-fakegame-and-wrapper-application).
    * To deploy Linux game servers, see [Create and upload Linux container image](#create-and-upload-linux-container-image)
4. [Deploy a build using Game Manager or API](#deploy-a-build-using-game-manager-or-api) to start creating game servers

For a live walkthrough of building this sample, check out our presentation from Microsoft Game Dev 2021 (starts at about 2.52):

> [!VIDEO https://www.youtube.com/embed/kj2TcMlvWgk]

## Wrapper with your existing game server build

1. Get the [GSDK wrapper sample](https://github.com/PlayFab/MpsSamples/tree/master/wrappingGsdk) using standard Git methods or downloading this as a zip file
2. [Build Wrapper executable](#build-wrapper-executable)
3. This step is different depending on the types of servers you want to deploy. 
    * To deploy Windows game servers, see [Add your game server files and combine them with the Wrapper application into a zip file](#add-your-game-server-files-and-combine-them-with-the-wrapper)
    * To deploy Linux game servers, see [Create and upload Linux container image](#create-and-upload-linux-container-image)
4. [Deploy a build using Game Manager or API](#deploy-a-build-using-game-manager-or-api) to start creating game servers

## Detailed steps

### Build Wrapper executable

* Open Command Prompt
* Use the cd command to change directory path to the wrapper.csproj file location. Example: __cd C:/ReplaceWithYourFilePath/wrappingGsdk/wrapper__
* Then run the following .NET Core CLI command:
```
dotnet publish --self-contained -r win-x64 /p:PublishSingleFile=true /p:PublishTrimmed=true
```

When the wrapper build is successful, the executable is published in the ..\wrappingGsdk\wrapper\bin\Debug\netcoreapp3.1\win-x64\publish folder, as shown in the image below.

![Publish location of the wrapper executable](media/create-your-first-server/wrapper-exe-location.png)

### Combine Fakegame and Wrapper application

Use the build.ps1 to build and package both projects (wrapper and fakegame). This script will create a drop folder with a .zip file containing the required files.

* Open PowerShell
* Use the cd command to change directory path to the build.ps1 script location. Example: cd C:/ReplaceWithYourFilePath/wrappingGsdk/
* Run __\build.ps1__
* After the script runs successfully, go to ..\wrappingGsdk\drop\ folder. You will find a __gameassets.zip__ file containing the fake game server build, wrapper executable (built in the earlier step), and other required files is created.

### Add your game server files and combine them with the wrapper

To use your game project in the evaluation, place the wrapper and your game server executable in the same folder.

* Follow the instructions at [Build the wrapper executable](#build-wrapper-executable)
* Go to the wrapper publish location at ..\wrappingGsdk\wrapper\bin\Debug\netcoreapp3.1\win-x64\publish
* In another window, go to your game server build and files needed to run your game server build. If you're unsure what files are needed, see [Determining DLL files needed](determining-required-dlls.md)
* Copy the gamer server build and all required files into the wrapper publish location
* Select all the files in the wrapper publish location
* With all the files selected, right-click and then select __Send to__ > __Compressed (zip) files to zip__. Do not select the wrapper publish folder and add to zip. This would cause incorrect mapping.

> [!Tip]
> To cross-check, follow the instructions at [Use fakegame project](#wrapper-with-fakegame) to build the gameassets.zip and use it as a reference.

### Create and upload Linux container image

To create a Linux container image, you would need a Dockerfile. A Dockerfile is a text file with no extension and contains all commands needed to build a given container image. In this sample, this file is already created for you. All you have to do is to build the container image and run it.

If you wish to use your Windows development device, you would need to install Windows Subsystem for Linux (WSL). Instructions are provided below. For more information, see [Windows and Linux container image differences](deploying-linux-based-builds.md#windows-and-linux-container-image-differences).

1. [Set up your Windows development device](deploying-linux-based-builds.md#set-up-your-windows-development-device) (optional)
2. [Get your PlayFab container registry login credentials](deploying-linux-based-builds.md#get-your-playfab-container-registry-login-credentials)
3. Use existing/create your own Dockerfile
    This step is different depending if you are using FakeGame or your own game server.
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

Run the commands below to build and upload the Dockerfile. Note that there is a "." at the end of __docker build__ command. You have to be in the same folder/directory as the Dockerfile. For details, see [Build and upload Linux container image](deploying-linux-based-builds.md#build-and-upload-linux-container-image). 

```docker
docker build -t ${ACR}/wrapper:${TAG} .
docker push ${ACR}/wrapper:${TAG}
```

### Deploy a build using Game Manager or API

The deploy build process is quite similar for both Windows and Linux game servers.

#### Deploy Windows game servers

The steps are similar to the Windows Runner C# sample. Follow these steps with differences listed below.

* [Use Game Manager to deploy and configure servers](quickstart-for-multiplayer-servers-game-manager.md)
* [Use PowerShell/API to deploy and configure servers](quickstart-for-multiplayer-servers-api-powershell.md)

If you prefer test this locally, see [Locally debugging game servers and integration with PlayFab](locally-debugging-game-servers-and-integration-with-playfab.md).

**Settings specific to this sample**

* Start command:
    * Use __C:\Assets\wrapper.exe -g C:\Assets\fakegame.exe arg1 arg2__
    * Replace fakegame.exe with the name of your game server executable, if you're using your game server build
* Network configuration: Use port __80__, __TCP__
* Assets: When using FakeGame, upload __gameassets.zip__ as an asset.

#### Deploy Linux game servers

Follow the general steps below to deploy.
* [Use Game Manager to deploy and configure servers](deploy-using-game-manager.md)
* [Use PowerShell/API to deploy and configure servers](deploy-using-powershell-api.md)

**Settings specific to this sample**

* Select the container you just uploaded
* Network configuration: Use port __80__, __TCP__
* No need to upload assets and set __Start Command__

> [!Note]
> During the allocation when using RequestMultiplayerServer API, the port you connect to will be different than 80. This is because the PlayFab Multiplayer Server service will create a mapping between the Azure Load Balancer (that exposes your ports to the Public internet) to the game servers running on the Azure Virtual Machines.

## Running the wrapper using the LocalMultiplayerAgent

Using LocalMultiplayerAgent is highly recommended if you want to test GSDK integration on your custom game servers.

If you are using LocalMultiplayerAgent with Windows Containers you need to properly configure MultiplayerSettings.json file. You can find an example below, pay special attention to the values of LocalFilePath and StartGameCommand. Don't forget to replace fakegame.exe with the name of your game server executable.

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
                        "Name": "game_port",
                        "Number": 80,
                        "Protocol": "TCP"
                    }
                }
            ]
        ]
```

You are now ready to test with LocalMultiplayerAgent. If you have configured it correctly, as soon as LocalMultiplayerAgent launches your game server, you can connect to it via curl at **http://localhost:56100/Hello**.

## See also

* [Create your first server](create-your-first-server.md)
* [Resources and samples](server-samples-resources.md)
* [PlayFab Multiplayer Server SDKs](server-sdks.md)
* [API Reference](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)
