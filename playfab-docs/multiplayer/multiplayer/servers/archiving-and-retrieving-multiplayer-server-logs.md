---
title: Archiving and retrieving multiplayer server logs
author: joannaleecy
description: Describes how to archive and retrieve multiplayer server logs.
ms.author: joanlee
ms.date: 01/17/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, thunderhead, azure, gsdk
ms.localizationpriority: medium
---

# Archiving and retrieving multiplayer server logs

In several scenarios, you may want to keep logs or other arbitrary file content from your game servers for later analysis. 

There are two ways you can gather your logs either through the Game Server SDK or Game Manager. The SDK provides an API that allows you to write to a log file or access a logging directory.

See [Integrating game servers with the PlayFab game server SDK (GSDK)](integrating-game-servers-with-gsdk.md) to learn more about these logging mechanisms. To programmatically gather your logs, use the [ListArchivedMultiplayerServers](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.listarchivedmultiplayerservers) method. The result will give you the information for the servers, next you'll need to call [GetMultiplayerServerLogs](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.getmultiplayerserverlogs) method with the Server ID as the input. 


**Archived Servers** is the vehicle for retrieving these logs after the game server has terminated. These logs are kept for 28 days after the termination of your game server.


To do this using Game Manager first, go to the **Builds** page in the **Multiplayer tab**, and select the build that is associated to the server you're looking for. 

![PlayFab Multiplayer Server build overview](media/build-overview.png)

Next, select the **Servers tab** located at the top and you'll see a list of VM's and servers, select the **Archived servers** link at the bottom 

![PlayFab Multiplayer Servers View Archive](media/build-server-archivedlink.png)

Use the **Search bar** at the top of the page and use either the **Host ID or VM ID** to download logs for a specific server. 

![Multiplayer - Servers - Search logs](media/build-server-archived.png)