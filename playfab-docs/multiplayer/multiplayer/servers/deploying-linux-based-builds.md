---
title: Create and deploy Linux container images
author: joannaleecy
description: Create and deploy Linux container images.
ms.author: joanlee
ms.date: 04/01/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, thunderhead, linux
ms.localizationpriority: medium
---

# Create and deploy Linux container images

This article outlines specific steps to help you create and deploy Linux container images.

As described in [Create VMs](deploying-playfab-multiplayer-server-builds.md), you configure VMs to be automatically spun up as game servers globally according to your budget and demand when using our service. In order to do so, you don't explicitly create VMs but define parameters that determine how they get created on your behalf. This process is called deploying or creating a build.

PlayFab Multiplayer Servers can deploy both Linux-based and Windows-based game servers. The way builds are deployed for Linux containers are similar to Windows containers with a few important differences. To learn more, see [Windows and Linux container image differences](#windows-and-linux-container-image-differences). If you want to use PowerShell/API to manage Linux containers, see [Manage Linux container images using APIs](#manage-linux-container-images-using-apis).

When using Linux-based game servers, instead of using a managed container image, you have to create and upload your container image to a container registry. To make it easy for you to upload containers, your account comes with an Azure container registry.

## Required knowledge

* [Docker containers](/training/modules/intro-to-docker-containers/)

## Set up your Windows development device

This step is needed only if you want to use Windows development device to create Linux container images. Alternatively, you can use Linux OS devices, VMs, or dual-OS systems with Docker installed.

[Windows Subsystem for Linux (WSL)](/windows/wsl/) enables you to use your development device in the familiar Windows environment to author and manage Linux container images. Using WSL means that you wouldn't need an overhead of a traditional Linux virtual machine or dual-boot setup.

1. [Install WSL 2](/windows/wsl/). Make sure that you've restarted your machine and are using WSL 2. You also need to have successfully installed the Linux kernel update package.
2. [Install a Linux distribution that uses WSL](/windows/wsl/install#step-6---install-your-linux-distribution-of-choice). Although our VMs use Ubuntu, you can select any distribution you want for your container image. Consider using [Ubuntu 20.04 LTS](https://www.microsoft.com/store/apps/9n6svws3rx71) or later versions.
3. [Install Docker Desktop for Windows with WSL 2](/windows/wsl/tutorials/wsl-containers). For direct download link, go to [Docker Desktop for Windows (external)](https://hub.docker.com/editions/community/docker-ce-desktop-windows/).

**Verify WSL 2 set up**

* Open PowerShell
* Run __wsl -l -v__ to check that both docker-desktop and ubuntu applications are running WSL 2 (version 2)

**Verify Docker set up properly for WSL**

* Open WSL terminal
* Run __docker version__ to confirm that Docker is installed and OS used is Linux

> [!Tip]
> For developing and debugging Linux C++ applications, use [WSL in Visual Studio 2019](/cpp/linux/).

## Get your PlayFab container registry sign-in credentials

The Azure container registry account is associated with your PlayFab account. Only you have access to the containers uploaded there. This Azure container registry is free of charge.

* In Game Manager, select your game title, then __Multiplayer__ > __Servers__. Next, select __New build__  on the right to open the build creation page.
* Select __Linux__ as the virtual machine operating system. 
* Take note of the sign-in credentials&mdash;name, password, and customer5555555.azurecr.io, as this information is needed later

![New build with Linux platform selected](media/create-your-first-server/server-new-build-container-linux.png)

If you wish to use PowerShell/API, call the [GetContainerRegistryCredentials](/rest/api/playfab/multiplayer/multiplayerserver/getcontainerregistrycredentials) API to retrieve a container registry address, user name, and password.

## Create and push Linux container images to Azure Container Registry

These steps help you create and push your custom Linux container image.

#### Integrate your game server application with GSDK

Similar to using Windows servers, you have to integrate your game server code with the PlayFab Multiplayer Server SDK (GSDK). This can be part of your container image.

For instructions, see [Author a game server build](author-a-game-server-build.md) and [Integrating your title with PlayFab Game Server SDK (GSDK)](integrating-game-servers-with-gsdk.md).

#### Create a Dockerfile

A Dockerfile is a text file with no extension and contains all commands needed to build a given container image.

1. Open __Notepad__ or any suitable editor
2. Add specific commands needed to run and build a container. For an example of this file, see the [DockerFile](https://github.com/PlayFab/MpsSamples/blob/master/wrappingGsdk/Dockerfile) provided in [Wrapper sample](wrapper-sample.md). For more information on how to create this file, see [Dockerfile format (external)](https://docs.docker.com/engine/reference/builder/#format) and [Best practices when creating Dockerfile (external)](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
3. Save file as a Dockerfile, ideally in an empty folder/directory. You should add other files that are needed to build the container image into this folder.

  Saving instructions when using __Notepad__:
  * Select __File__> __Save as...__ to open up the save options
  * Go to the folder you want to save the file in
  * Under __File name:__, use __"Dockerfile"__, including the quotes.
  * For __Save as type:__, select __All Files__
  * Select __UTF-8__ encoding
  * Select __Save__

#### Build and upload Linux container image

1. Open your Linux terminal, making sure that you have installed Docker.
2. Run the following Docker commands using the sign-in credentials obtained from the earlier step. Then follow the instructions on screen to enter your username and password.

```docker
docker login customer5555555.azurecr.io
```
[docker sign in](https://docs.docker.com/engine/reference/commandline/login/) logs you into the Azure container registry as shown in Game Manager.

```docker
username: customer5555555
password: HRDFOdIebJkvBAS+usa55555555
```
3. Build the container image

Run the command below to build the container image using the Dockerfile in the folder/directory you are in. Note that there's a "." at the end of __docker build__ command.

The __-t__ flag specifies the name:tag information for your new container image. They'll be used if the build succeeds. If there are build errors, you have to fix them before moving on to the next step.

In the example below, the repository name is __customer5555555.azurecr.io/pvp_gameserver__ and tag is __v1__. For more information, see [docker build command reference (external link)](https://docs.docker.com/engine/reference/commandline/build/) and [Building Dockerfile (external link)](https://docs.docker.com/engine/reference/builder/).

When using WSL, the Windows C: drive is mounted at /mnt/c.
* Then run __cd /mnt/c/path/to/your/Dockerfile__ to switch to the path where your Dockerfile is.
For more information, see [Accessing C drive](/windows/wsl/faq#how-do-i-access-my-c--drive-).

```docker
docker build -t customer5555555.azurecr.io/pvp_gameserver:v1 .
```

>[!TIP]
> When using Linux, run __pwd__ to find out which directory you are currently at.

4. Upload the container image

Run the below commands to push the image to your Azure PlayFab Container registry. Select a meaningful and helpful name:tag combination for your uploaded container image. Then use [docker push](https://docs.docker.com/engine/reference/commandline/push/) or another container registry client, to upload your container to the Azure PlayFab operated registry.

```docker
docker tag hello-world customer5555555.azurecr.io/pvp_gameserver:v1
docker push customer5555555.azurecr.io/pvp_gameserver:v1
```

## Check that your container is uploaded

After the container is uploaded, go back to the __New Build__ page in Game Manager and select __Refresh Images__. You would be able to see the image in the list and select it. Alternatively, you can use the [ListContainerImages](/rest/api/playfab/multiplayer/multiplayerserver/listcontainerimages) API call to list your uploaded container images.
 
Now you're ready to deploy servers. For instructions, see [PlayFab portal&mdash;Game Manager](deploy-using-game-manager.md) and [Using PowerShell/API](deploy-using-powershell-api.md).

## Windows and Linux container image differences

For many developers, using Windows managed container is the preferred simple and default choice. However, Linux container images deployed on virtual machines enjoy a cheaper hourly rate.

> [!Note]
> You are able to fully customize your game servers whether you are using Windows or Linux container images. When using Windows servers, you customize the managed container image by uploading assets. 

The table below lists some differences when creating and using them.

| Developer options| Windows                 | Linux         |
|------------------|-------------------------|---------------|
| Development device OS | Windows OS | [Windows Subsystem for Linux (WSL)](#set-up-your-windows-development-device) or Linux OS (using dual-OS or VMs)|
| Container image | Straightforward deployment using our managed container image. You can still customize the container by uploading additional files as assets. | Additional work is needed because you have to create your own custom container image that gives you complete control. |

## Manage Linux container images using APIs

You can use APIs to manage Linux container images. For the rest of build lifecycle (viewing usage, updating regions and standingBy configurations, deletion), manage them using Game Manager.

* [GetContainerRegistryCredentials](/rest/api/playfab/multiplayer/multiplayer-server/get-container-registry-credentials): Retrieve a container registry address, user name, and password
* [ListContainerImages](/rest/api/playfab/multiplayer/multiplayer-server/list-container-images) and [ListContainerImageTags](/rest/api/playfab/multiplayer/multiplayer-server/list-container-image-tags): Ensure your new image and tag are listed (sometimes it might take a couple of minutes for image to be fully registered in the system)
* [CreateBuildWithCustomContainer](/rest/api/playfab/multiplayer/multiplayer-server/create-build-with-custom-container): Create a build with a custom container. Specify the tagged image you uploaded earlier. Ensure the following properties are set on the request:
  * **ContainerImageReference** - The image name and tag that was uploaded earlier (and is visible in ListContainerImages and ListContainerImageTags above).
  * **ContainerFlavor** - "CustomLinux"
  * **ContainerRunCommand** (Optional) - In case your container doesn't have a default command that it runs, this can be used to provide the command to run, along with any arguments.

## See also

* [Intro to docker containers](/training/modules/intro-to-docker-containers/)
* [Create your first server](create-your-first-server.md)
* [Resources and samples](server-samples-resources.md)
* [PlayFab Multiplayer Server SDKs](server-sdks.md)
* [API Reference](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)
