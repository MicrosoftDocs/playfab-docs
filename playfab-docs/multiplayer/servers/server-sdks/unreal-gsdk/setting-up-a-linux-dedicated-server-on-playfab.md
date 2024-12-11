---
title: Deploy Linux Unreal Server to MPS Cloud
author: joannaleecy
description: Build and Deploy a Linux server to the MPS Cloud
ms.author: joanlee
ms.date: 12/08/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, gsdk, unreal, cloud, linux
ms.localizationpriority: medium
---

# Set up a Linux Dedicated Server on PlayFab

The purpose of this guide is to describe all the steps needed to build and verify a Linux dedicated server. The following steps are specific to Unreal Engine 5 (both early access and official release). The same set of steps have been tested and apply also to UE 4.26 and UE 4.27, with some minor differences related to the location of the packaging option on the Unreal Engine UI, which is different in UE 4.27 and UE5 early access.

More Linux deployment information can be found [here](https://github.com/PlayFab/MpsAgent/blob/main/LocalMultiplayerAgent/MultiplayerSettingsLinuxContainersOnWindowsSample.json)

## Requirements
* Install [Unreal Linux prerequisites](https://docs.unrealengine.com/SharingAndReleasing/Linux/GettingStarted/)
* Install [Docker for Windows](https://docs.docker.com/desktop/windows/install/)

## Instructions

* From **Unreal Linux prerequisites**, download the toolchain for your installed Unreal Engine and run the executable. Note, like many parts of these guides, these steps will work only if your Unreal Engine built from source.
    * After the installation is complete, examine your Windows environment variables and confirm the following system variable exists: **LINUX_MULTIARCH_ROOT**.
* In your Unreal Engine source directory:
    * Rerun: ```Setup.bat```
    * Rerun: ```GenerateProjectFiles.bat```
* Return to your own project:
    * Right-click your ```{ProjectName}.uproject``` file, and **Generate Visual Studio project files**
    * Open the {ProjectName}.sln file in Visual Studio
    * Set the configuration to **Development Editor**
    * Build and run the Unreal Editor
* At this point, you should be able to package your project for Linux server in a directory of your choice.
    * For Unreal Engine 5, in the Editor, click packaging on the top right of the screen and the Linux option should now be available to be selected. For UE 4.26 and UE 4.27, the packaging option lies under the file tab.
    * Confirm your configurations for Server & Shipping, select __Linux__ to build, and then select the output directory.

## Create Docker image of the Linux server

In this section, we'll set up a Docker image that contains your Linux Server

* Now that you have created a Linux server, navigate to that directory (Windows Explorer, or terminal of your choice)
* Create a new file named: ```Dockerfile```
* Edit the file with your editor of choice (notepad, vim, emacs etc.)
* Copy - paste the content presented below. Make sure to replace [YourProjectNameServer].sh with the name of your own linux server executable (in the same directory)

```Docker
FROM ubuntu:18.04

# Unreal refuses to run as root user, so we must create a user to run as
# Docker uses root by default
RUN useradd --system ue
USER ue

EXPOSE 7777/udp

WORKDIR /server

COPY --chown=ue:ue . /server
USER root
CMD chown -R ue.ue $PF_SERVER_LOG_DIRECTORY && su ue -c ./YourGameNameServer.sh
```

NOTE: The **chown** command fixes the $PF_SERVER_LOG_DIRECTORY to be accessible by your server process, and then && chains the command to execute your server

* Using a terminal of your choice, navigate to the Linux server directory
    * Windows users typically use cmd or powershell, though bash via third party tools or WSL are also available
    * Mac and Linux users typically use bash
* Run: ```docker build -t "[imageName]:[tag]" .```, where imageName and tag are options of your choice.
    * Remember these names, you will use them again
    * Examples could be: **YourProjectNameServer** and **01** respectively
    * The **tag** element is typically used to version your server instance
    * These tags will be used in a later step
    * You can type **docker images** on the terminal to retrieve imageName and tag if you forget
* Type **docker images** on the terminal to inspect the successful creation of the docker image.
* Keep this terminal window open and set it aside as we will have more commands for it later
    * (Denoted as [Docker terminal] in later steps)

## Upload the container image on the PlayFab Azure registry

At this point, you are ready to push your docker image in the PlayFab Azure Container Registry so that it can be used to launch your build on PlayFab.

* Navigate to the [PlayFab developer portal](https://developer.playfab.com/)
* Select your title
* Select the **Multiplayer** tab on the left
* Select **New Build** on the right of the screen.
* Choose a name
* Select a VM type, for ThirdPersonMP projects **Dasv4 (2 cores)** will be sufficient
* Under Server Details, set Server Type to **Container** and Operating System to **Linux**.
* Click the **Upload to container registry** button.
* On the window that pops up:
    * Remember your [AzureUsername] from this window, used multiple times in next steps
    * Select **Copy Docker Login Command**
* Return to the {Docker terminal} window
    * Paste the Docker Login command into [Docker terminal]. This command will log you into the Azure Registry used by PlayFab.
    * type: ```docker tag [imageName]:[tag] [AzureUsername].azurecr.io/[imageName]:[tag]```
    * Type: ```docker push [AzureUsername].azurecr.io/[imageName]:[tag]```
    * Recall, AzureUsername was displayed on the PlayFab developer portal, and imageName and tag where chosen by you earlier.
* Back on the PlayFab website, under the Server Details on the New Build page, click Refresh next to Container image.
* Click the arrow button and you should be able to see and select the docker image you uploaded and the respective tag.
* In the Regions block, select a region close to you, and set both Standby and Max to 1 (just for testing)
* In the Network block, set the Port Name field to ```gameport```
    * It's mandatory to define the port that will be used to connect to your game-server
    * Unreal GSDK contains code to read this port automatically, and internally override the Unreal Server host port according to this value
    * The name of this port is required to be ```gameport```
* Select **Add Build**, and wait for your build status to become **Deployed**

## Next steps

Many users will want to test their server by [connecting a game-client](connect-to-mps-hosted-build.md).

Otherwise, you can return to the main [Unreal GSDK Plugin](index.md) guide.
