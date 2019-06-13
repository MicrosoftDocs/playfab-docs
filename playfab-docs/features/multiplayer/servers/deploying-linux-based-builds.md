---
title: Deploying Linux based builds
author: v-thopra
description: How to create and manage linux based multiplayer server builds.
ms.author: v-thopra
ms.date: 05/03/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, linux
ms.localizationpriority: medium
---

# Deploying Linux based builds

PlayFab Multiplayer Servers can deploy Linux-based game servers. While Windows managed container configurations are a simple and default choice for many game developers, Linux servers are deployed on virtual machines running Ubuntu and enjoy a cheaper hourly rate.

Linux-based multiplayer server builds are deployed and managed very similarly to Windows builds. But there are a few important differences between PlayFab's Windows and Linux options:

1. Linux multiplayer servers integrate with the same Game Server SDK, but currently we do not have a mock agent for local debugging as we do for Windows.
2. Linux servers are uploaded as containers which PlayFab deploys without modification, unlike Windows servers which are uploaded as zip files and deployed using a PlayFab managed container image. You can still upload zip/tar/tar.gz files and associate them with server builds if you do not want to bundle everything into a container.
3. We do not currently have a graphical user experience for creating Linux builds in Game Manager (but the rest of the operations such as viewing usage, updating regions and standingBy configurations are supported).

## Creating a Linux build

With Linux servers, you have complete control over the container image. PlayFab operates a container registry for each PlayFab Multiplayer Server customer, to make it easy to upload containers and scale them as multiplayer server builds. The steps shown below, provide an overview of how to use PlayFab APIs to create a Linux-based server build:

1. Integrate your Linux application with the [PlayFab Game Server SDK (GSDK)](integrating-game-servers-with-gsdk.md).
2. Call the [GetContainerRegistryCredentials](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.getcontainerregistrycredentials) API to retrieve a container registry address, user name, and password.
3. Use [docker push](https://docs.docker.com/engine/reference/commandline/push/), or another container registry client, to upload your container to the PlayFab operated registry. Use a meaningful and helpful tag, as the tag is used to link multiplayer server builds to uploaded container images.
4. Use [ListContainerImages](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.listcontainerimages) and [ListContainerImageTags](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.listcontainerimagetags) to ensure your new image and tag are listed (sometimes it might take a couple of minutes for image to be fully registered in the system).
5. Call the [CreateBuildWithCustomContainer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.createbuildwithcustomcontainer) API to create a build with a custom container. Specify the tagged image you uploaded earlier. Ensure the following properties are set on the request:
   - `ContainerRepositoryName` - The name of the container repository.
   - `ContainerTag` -  The tag that was uploaded earlier (and is visible in the response for `ListContainerImageTags` above).
   - `ContainerFlavor` - "CustomLinux"
   - `ContainerRunCommand` (Optional) - In case your container doesn't have a default command that it runs, this can be used to provide the command to run, along with any arguments.
6. The rest of the build lifecycle (viewing usage, updating regions and standingBy numbers, deletion) can be managed using the Game Manager.