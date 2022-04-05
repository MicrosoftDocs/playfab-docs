---
title: PlayFab Online Subsystem (OSS) Quickstart
description: Guidance on how to use PlayFab Party in your Unreal Engine 4 Project.
author: PushpadantK
ms.author: pkacha
ms.date: 11/29/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, middleware
---

# QuickStart: PlayFab Online Subsystem (OSS)

This quickstart guide helps you set up and use Multiplayer features (Lobby, Matchmaking and Party) for Xbox and PC games built using Unreal Engine 4 game engine. For the full list of supported platforms and versions in UE4, see [Supported platforms](party-unreal-engine-oss-overview.md).

After following the relevant steps below for your target platforms, you will be ready to start using the OSS. Authentication, networking, VOIP, grouping into lobbies, and matchmaking will be handled on your behalf with no other changes required.

## Download and install PlayFab Online Subsystem
Go to [UE OSS PlayFab](https://dev.azure.com/PlayFabPrivate/GDK/_git/PlayFabOSSUnrealGDK) to download or clone PlayFab Online SubSystem source. If you do not have access to the site, see [Request Access page](request-access-for-sdks-samples.md).

## What you need
* **PlayFab Title ID:** If you do not have a Title ID configured for PlayFab Party, see [Enabling PlayFab Party](enable-party.md).
* **Specific platform PlayFab Multiplayer and Party libraries:** All required library files are provided with the source in [Download and install PlayFab Online Subsystem](#download-and-install-playfab-online-subsystem), however if you need an updated Party library files then see,  [Obtaining PlayFab Party libraries](party-unreal-engine-oss-obtaining-playfab-party-libraries.md).

## Initial setup
- Copy the **OnlineSubsystemPlayFab** folder and its contents from to your UE4 directory under **Engine\Plugins\Online**
- Apply the following changes to the Plugins section of your .uproject file, this will add the OnlineSubsystemPlayFab to your plugin list.
    - You may remove any platforms which you are not shipping on
```
{
	"Name": "OnlineSubsystemPlayFab",
	"Enabled": true,
	"WhitelistPlatforms": [
		"XboxOneGDK",
		"WinGDK",
		"XSX",
		"XboxOne"
	],
	"SupportedTargetPlatforms": [
		"XboxOneGDK",
		"WinGDK",
		"XSX",
		"XboxOne"
	]
}
```

Now you have successfully completed the initial setup. If you are developing games using GDK, see [Next steps for GDK](#next-steps-for-gdk).

## Next steps for GDK
- Apply the changes below to the Game (not Engine) INI files for each platform you are targeting.
    - **Xbox Series X GDK:** XSXEngine.ini
    - **PC GDK:** WinGDKEngine.ini
    - **Xbox One GDK:** XboxOneGDKEngine.ini
- Replace the INI sections if they already exist (e.g. Engine.GameEngine)
- Ensure you replace all the *\<REPLACE ME>* fields with your data.
```
[OnlineSubsystem]
DefaultPlatformService=PlayFab
NativePlatformService=GDK

[OnlineSubsystemPlayFab]
bEnabled=true
PlayFabTitleID=<REPLACE ME with your PlayFab title ID>
MaxDeviceCount=<REPLACE ME with your max player count (note: split screen is still 1 device). In the example of an 8 player game, this would be 8.>
MaxDevicesPerUserCount=<REPLACE ME with your max player count per box (note: split screen is still 1 device) In the example of an 8 player game, this would be 1.>	
MaxEndpointsPerDeviceCount=<REPLACE ME with your max player count per box (note: split screen is still 1 device)  In the example of an 8 player game, this would be 1.>
MaxUserCount=<REPLACE ME with your max player count (note: split screen is still 1 device)  In the example of an 8 player game, this would be 8.>		
MaxUsersPerDeviceCount=<REPLACE ME with your max player count per box (note: split screen is still 1 device)  In the example of an 8 player game, this would be 1.>

Sandbox=<Optional, REPLACE ME with the sandbox Id used for the title under development >

[/Script/OnlineSubsystemPlayFab.PlayFabNetDriver]
NetConnectionClassName="OnlineSubsystemPlayFab.PlayFabNetConnection"
ReplicationDriverClassName="<REPLACE ME with your existing replication driver class name>"
ConnectionTimeout=15.0
InitialConnectTimeout=30.0

[/Script/Engine.GameEngine]
!NetDriverDefinitions=ClearArray
+NetDriverDefinitions=(DefName="GameNetDriver",DriverClassName="OnlineSubsystemPlayFab.PlayFabNetDriver",DriverClassNameFallback="OnlineSubsystemUtils.IpNetDriver")
```

This completes the setup of OSS required to be used in your game.


