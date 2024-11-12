---
title: Using older versions of Unreal Engine 4
description: How to use older versions of Unreal Engine 4
author: PFarqMS
ms.author: phifarq
ms.date: 08/17/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, middleware
---

# Using older versions of Unreal Engine 4

While not officially supported by the PlayFab Online Subsystem (OSS), it is entirely possible to use it on older versions of Unreal Engine 4. Core networking functionality will migrate back to earlier versions of Unreal Engine 4 with minor tweaks to interface function names & signatures, with certain instances renamed or removed to match older versions of the Unreal Engine 4 OSS interface.

## XDK support on version 1.07 and earlier

- Apply the changes below to the Game (not Engine) INI file 'XboxOneEngine.ini'
- Replace the INI sections if they already exist (e.g. Engine.GameEngine)
- Ensure you replace all the *\<REPLACE ME>* fields with your data.
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

[/Script/OnlineSubsystemPlayFab.PlayFabNetDriver]
NetConnectionClassName="OnlineSubsystemPlayFab.PlayFabNetConnection"
ReplicationDriverClassName="<REPLACE ME with your existing replication driver class name>"
ConnectionTimeout=15.0
InitialConnectTimeout=30.0

[/Script/Engine.GameEngine]
!NetDriverDefinitions=ClearArray
+NetDriverDefinitions=(DefName="GameNetDriver",DriverClassName="OnlineSubsystemPlayFab.PlayFabNetDriver",DriverClassNameFallback="OnlineSubsystemUtils.IpNetDriver")
```

## Enabling cross-generational play between XDK and GDK

The default game implementation in Unreal Engine 4 validates that an incoming remote Net ID is of the same subsystem type as the local instance, as such cross-play between XDK and GDK will have different types and requires you to make one of the following changes:
- Override the function within your GameMode and implement a PreLogin function which doesn’t require this check or pass a nullptr to the base function for NetID, skipping the check.
    - You may have already this class overridden
    - Edit the base function AGameMode::PreLogin to remove the OSS type check (**bUniqueIdCheckOk**)