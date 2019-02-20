---
title: Custom Game Servers
author: v-thopra
description: Tutorial about the self-management of custom game servers.
ms.author: v-thopra
ms.date: 10/25/2018
ms.topic: article
ms.prod: playfab
keywords: playfab. multiplayer, servers
ms.localizationpriority: medium
---

# Custom game servers

## Self-management of custom game servers

While the PlayFab service has always offered the ability to have custom game servers, which are operated and managed by our team on behalf of game titles, the process of uploading and configuring server builds has been largely manual up to now. 

This update provides developers with the ability to manage builds *directly*, making the process of testing game servers simple and convenient.

### General information

First, it's important to bear in mind that the **AWS** instances created by default for testing are relatively low-power (**CPU/Memory**), as the expectation is that these will be used for basic testing purposes.

In addition, developers must *disable* their server instances when they are *not* in use, as CPU time available for testing is limited (more info on these limits will be provided in our pricing and policy documentation).

> [!NOTE]
> If higher-end server instances are needed for testing - or if you need additional server test time - please post on our [Support Forum](https://community.playfab.com/).

It is also worth noting that the design of server hosting originates from the need for titles to have multiplayer gameplay servers. This means that an enabled build will *always* have at least *one* server available, so that a player attempting to join a session does not have to wait on server spin-up time.

That is not to say that this cannot be used for non-multiplayer hosted logic, as that is also supported. However, if your game needs are limited to stateless server-side logic, please be aware that we *also* have the ability to host **JavaScript** logic in the PlayFab service (**CloudScript**).

### Getting started

To get started, you will need to ensure that your server build is compatible with **Windows Server 2012 R2**, and that the server utilizes the **API** calls needed to inform the PlayFab Matchmaker of when players join and leave - **[RedeemMatchmakerTicket](xref:titleid.playfabapi.com.server.matchmaking.redeemmatchmakerticket)** and **[NotifyMatchmakerPlayerLeft](xref:titleid.playfabapi.com.server.matchmaking.notifymatchmakerplayerleft)**.

Since the PlayFab Matchmaker is used as part of server discovery, it's important to make sure the server is providing the PlayFab service with up-to-date information on the users in a given session.

### Command Line parameters

In designing your server, the following parameters will be available as part of your command line input:

- **game_id** - a unique numeric identifier for the server instance being created (usually referred to as the **LobbyId** in **API** calls).
- **game_build_version** - a string specifying the build version (the same string you specified for the **Build ID** in PlayFab).
- **game_mode** - a string value for the specific game mode being started – defined in **ModifyMatchmakerGameModes**.
- **server_host_domain** - a string value of the URI of the **AWS** host (the **IP Address**).
- **server_host_port** - a numeric value of the port for communication with this game instance.
- **server_host_region** - a string value of the region in which this instance is operating.
- **playfab_api_endpoint** - a string value of the base URI for the endpoint that this instance must use for any **API** calls to the PlayFab service – as described in the Web **API** documentation.
- **title_secret_key** - a string value of the title secret key that the server must use for PlayFab **API** calls, which use the secret key for authentication.
- **custom_data** - a string value containing any custom data specified by the developer.
- **log_file_path** - a string value for the directory where the server log file must be written, so that it can be collected by the PlayFab service upon completion of the instance.
- **output_files_directory_path** - a string value for the directory where any other output files must be written, so that they can be collected by the PlayFab service upon completion of the instance.

You'll have the opportunity to update the command line for your build once you have uploaded it into the PlayFab service. By default, the command line should be like the example shown below.

```azurecli
-game_id=<game_id>
-game_build_version=<game_build_version>
-game_mode=<game_mode>
-server_host_domain=<server_host_domain>
-server_host_port=<server_host_port>
-server_host_region=<server_host_region>
-playfab_api_endpoint=<playfab_api_endpoint>
-title_secret_key=<title_secret_key>
-custom_data=<custom_data>
-log_file_path=<log_file_path>
-output_files_directory_path=<output_files_directory_path>
-batchmode
```

> [!NOTE]
> It is important to be aware that while these parameters can be named *whatever you prefer*, the values are all generated by the PlayFab Matchmaker, and should *not* be changed. For example, if the log file is not written to the directory specified by <log_file_path> (and note that the angle brackets are required in the command line configuration), it will not be collected when the server instance shuts down.

In addition, **Unreal** developers should note that the **Unreal** engine expects the log file to be passed in with the **ABSLOG** parameter. So, for **Unreal** server builds, please change:

`-log_file_path=<log_file_path>`

to

 `-ABSLOG=<log_file_path>`.

Once your build is ready, it needs to be packaged as a zip file. As with the command line parameters, you will have the opportunity to specify the build path and executable name in the build settings. By default, this is **gameserver.exe** (an executable by this name, at the root of the structure in the zip).

This is the executable which will be called to start the server instance. It will be monitored throughout the lifetime of the instance, to ensure accurate tracking of available servers.

It is *also important* to make certain that your server build exits once the last player leaves the session, for two reasons:

1. First, the game server hosting service in PlayFab does not terminate game server instances explicitly.
2. Second, the log file(s), as well as any other output files specified, are collected in **S3** by our game server hosting service only when the instance ends.

Once ready, the complete zip file can then be uploaded in the PlayFab Game Manager in the **Servers**->**Builds** tab, or uploaded to the URL you get back from a call to [GetServerBuildUploadUrl](xref:titleid.playfabapi.com.admin.customservermanagement.getserverbuilduploadurl). 

> [!NOTE]
> If you are using the URL to upload the build, the **Content-Type** of the upload should be **application/x-zip-compressed**.
If you upload your build via the URL (as part of an automated build process, for example), you'll need to next call [AddServerBuild](xref:titleid.playfabapi.com.admin.customservermanagement.addserverbuild), in order to complete the basic setup for it, and make it available in the Game Manager. In addition to the command line and executable path, the values you can set are (using the **API** call property names).

### API property names

- **ActiveRegions** – The regions in which this server should run (ex: **USCentral**, **EUWest**).
- **Comment** – Any comments you want to tag onto the build (to show up in the Game Manager).
- **MaxGamesPerHost** – The maximum number of instances of the game server which can be active on one virtual machine (or hardware) instance.

At this point, the build package is validated by the PlayFab service. This can take upwards of a minute, though it's normally complete within a few seconds.

The status of the build can be checked in **Servers**->**Builds** in the **Game Manager**, or using the [GetServerBuildInfo](xref:titleid.playfabapi.com.admin.customservermanagement.getserverbuildinfo) API call.

Once the status of the build is **Available**, you can adjust the settings for it in the **Game Manager** in **Servers**->**Builds**, or with a call to [ModifyServerBuild](xref:titleid.playfabapi.com.admin.customservermanagement.modifyserverbuild).

> [!NOTE]
> When a server is marked as *active* in a Region, there is a short delay (up to a few minutes), as the first instance is configured and installed in that Region. During this time, **Status** can be checked in the **Servers**->**Game Servers** section of the **Game Manager**. Again, please be aware that *server time is limited*, so be sure to deactivate your test servers when they are *not* actively in use.

That completes the server definition.

One more *required* step is that the game modes be defined for the server so that the matchmaker can put players into appropriate game sessions.

At least *one* game mode must be defined for each server build. This is done using the [ModifyMatchmakerGameModes](xref:titleid.playfabapi.com.admin.matchmaking.modifymatchmakergamemodes) API call.

As part of that call, each game mode defined has a minimum and maximum number of players. Servers which are general purpose (non-multiplayer) should set the minimum to **1**, while the maximum should be based upon the expected load the server instance can support.

Thorough testing should be done to compute a reasonable value for this. A best practice is that servers should *not* be pushed to 100% of their theoretical load, so that unanticipated spikes do not cause issues. The PlayFab developer relations team can help to advise on this, if needed.

With those steps complete, you are now ready to launch your own game server instances, using the [StartGame](xref:titleid.playfabapi.com.client.matchmaking.startgame) API call.

To first check to see if there are any active instances the player can join, you can call [Matchmake](xref:titleid.playfabapi.com.client.matchmaking.matchmake), which will return all the connection information needed for the client to join the instance, including a server authorization ticket which the server instance needs to use with the [RedeemMatchmakerTicket](xref:titleid.playfabapi.com.server.matchmaking.redeemmatchmakerticket) call, to validate with the PlayFab service that the user should be allowed to join.

That completes the server definition. One more step which is required is that the game modes be defined for the server, so that the matchmaker can put players into appropriate game sessions. At least one game mode must be defined for each server build. This is done using the [ModifyMatchmakerGameModes](xref:titleid.playfabapi.com.admin.matchmaking.modifymatchmakergamemodes) API call.

As part of that call, each game mode defined has a minimum and maximum number of players. Servers which are general-purpose (non multiplayer) should set the minimum to **1**, while the maximum should be based upon the expected load the server instance can support.

Thorough testing should be done to compute a reasonable value for this. A best practice is that servers should not be pushed to 100% of their theoretical load, so that unanticipated spikes do not cause issues. The PlayFab developer relations team can help to advise on this, if needed.

If you are using your own Matchmaker, the **ExternalMatchmakerEventEndpoint** property should be set in the call to [StartGame](xref:titleid.playfabapi.com.client.matchmaking.startgame), to that the PlayFab service can post events to your Matchmaker.

Please see the documentation for [StartGame](xref:titleid.playfabapi.com.client.matchmaking.startgame) for more information on these events.
