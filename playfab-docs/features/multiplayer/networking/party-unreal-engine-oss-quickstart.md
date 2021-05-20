---
title: PlayFab Online Subsystem (OSS) Quickstart
description: Guidance on how to use PlayFab Party in your Unreal Engine 4 Project.
author: PFarqMS
ms.author: phifarq
ms.date: 08/17/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, middleware
---

# QuickStart: PlayFab Online Subsystem (OSS)

This quickstart guide helps you set up and use Party (authentication, networking, text chat with translation and transcription, voice chat with transcription, and more) for Xbox and PC games built using Unreal Engine 4 game engine. For the full list of supported platforms and versions in UE4, see [Supported platforms](party-unreal-engine-oss-overview.md).

After following the relevant steps below for your target platforms, you will be ready to start using the OSS and authentication, networking and VOIP will be handled on your behalf with no other changes required.

## Download and install PlayFab Online Subsystem (OSS)
Go to [Xbox Developer Downloads page](https://www.aka.ms/gdkdl) under Add-ins and download PlayFab Online SubSystem. If you do not have access to the site, reach out to your Microsoft representative.

## What you need
* **PlayFab Title ID:** If you do not have a Title ID configured for PlayFab Party, see [Enabling PlayFab Party](enable-party.md).
* **Specific platform PlayFab Party libraries:** Library files are needed to complete the set up. For more info, see [Obtaining PlayFab Party libraries](party-unreal-engine-oss-obtaining-playfab-party-libraries.md).

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

Now you have successfully completed the initial setup. If you are developing games using GDK, see [Next steps for GDK](#next-steps-for-gdk). If you developing games using XDK, see [Next steps for XDK](#next-steps-for-xdk).

## Next steps for GDK
- Apply the changes below to the Game (not Engine) INI files for each platform you are targeting.
    - **Xbox Series X GDK:** XSXEngine.ini
    - **PC GDK:** WinGDKEngine.ini
    - **Xbox One GDK:** XboxOneGDKEngine.ini
- Replace the INI sections if they already exist (e.g. Engine.GameEngine)
- Ensure you replace all the *<REPLACE ME>* fields with your data.
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

[/Script/OnlineSubsystemPlayFab.PlayFabPartyNetDriver]
NetConnectionClassName="OnlineSubsystemPlayFab.PlayFabPartyNetConnection"
ReplicationDriverClassName="<REPLACE ME with your existing replication driver class name>"
ConnectionTimeout=15.0
InitialConnectTimeout=30.0

[/Script/Engine.GameEngine]
!NetDriverDefinitions=ClearArray
+NetDriverDefinitions=(DefName="GameNetDriver",DriverClassName="OnlineSubsystemPlayFab.PlayFabPartyNetDriver",DriverClassNameFallback="OnlineSubsystemUtils.IpNetDriver")
```

If your title is not targetting the XDK, setup is complete. To complete the PlayFab OSS setup for games targeting XDK, see the next section.

## Next steps for XDK

- Apply the changes below to the Game (not Engine) INI file 'XboxOneEngine.ini'
- Replace the INI sections if they already exist (e.g. Engine.GameEngine)
- Ensure you replace all the *<REPLACE ME>* fields with your data.
```
[OnlineSubsystem]
DefaultPlatformService=PlayFab
NativePlatformService=Live

[OnlineSubsystemPlayFab]
bEnabled=true
PlayFabTitleID=<REPLACE ME with your PlayFab title ID>
MaxDeviceCount=<REPLACE ME with your max player count (note: split screen is still 1 device). In the example of an 8 player game, this would be 8.>
MaxDevicesPerUserCount=<REPLACE ME with your max player count per box (note: split screen is still 1 device) In the example of an 8 player game, this would be 1.>	
MaxEndpointsPerDeviceCount=<REPLACE ME with your max player count per box (note: split screen is still 1 device)  In the example of an 8 player game, this would be 1.>
MaxUserCount=<REPLACE ME with your max player count (note: split screen is still 1 device)  In the example of an 8 player game, this would be 8.>		
MaxUsersPerDeviceCount=<REPLACE ME with your max player count per box (note: split screen is still 1 device)  In the example of an 8 player game, this would be 1.>

[/Script/OnlineSubsystemPlayFab.PlayFabPartyNetDriver]
NetConnectionClassName="OnlineSubsystemPlayFab.PlayFabPartyNetConnection"
ReplicationDriverClassName="<REPLACE ME with your existing replication driver class name>"
ConnectionTimeout=15.0
InitialConnectTimeout=30.0

[/Script/Engine.GameEngine]
!NetDriverDefinitions=ClearArray
+NetDriverDefinitions=(DefName="GameNetDriver",DriverClassName="OnlineSubsystemPlayFab.PlayFabPartyNetDriver",DriverClassNameFallback="OnlineSubsystemUtils.IpNetDriver")
```

## Enabling cross-generational play between XDK and GDK

The default game implementation in Unreal Engine 4 validates that an incoming remote Net ID is of the same subsystem type as the local instance, as such cross-play between XDK and GDK will have different types and requires you to make one of the following changes:
- Override the function within your GameMode and implement a PreLogin function which doesn’t require this check or pass a nullptr to the base function for NetID, skipping the check.
    - You may have already this class overridden
    - Edit the base function AGameMode::PreLogin to remove the OSS type check (**bUniqueIdCheckOk**)
