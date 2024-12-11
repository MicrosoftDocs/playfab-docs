---
title: PlayFab Online Subsystem (OSS)
description: Overview of the PlayFab Online Subsystem for Unreal Engine
author: PushpadantK
ms.author: pkacha
ms.date: 11/29/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, unreal engine 5, ue4, ue5, middleware
---

# Overview

The PlayFab Online Subsystem (PF OSS) enables you to make use of Multiplayer features like Lobby, Matchmaking, Party and Azure Cognitive Services in your Unreal Engine 4 (UE4) or Unreal Engine 5 (UE5) game. These features include cross-talk, cross-play, and accessibility features like real-time text chat translation and voice transcription services. It's currently designed for use when developing PC, Xbox, Steam, Nintendo Switch, PlayStation®5 and PlayStation®4 games. This subsystem layer works seamlessly on top of the existing Epic provided native Online Subsystem (OSS). PlayFab OSS complements the native OSS by adding support for PlayFab Lobby, Matchmaking, Party networking and Voice over Internet Protocol (VOIP).

PlayFab OSS works alongside the PlayFab SDK marketplace plugin, which provides other PlayFab functionalities such as economy, leaderboards, and more. For more information, see [PlayFab SDK on the UE Marketplace (external site)](https://www.unrealengine.com/marketplace/product/playfab-sdk).

|    | PlayFab Online Subsystem | PlayFab SDK Marketplace Plugin    |
|--------------|-------------|-------------|
| Source  | [GitHub public repository](https://github.com/PlayFab/PlayFabMultiplayerUnreal) |  [PlayFab SDK on the UE Marketplace (external site)](https://www.unrealengine.com/marketplace/product/playfab-sdk)  |
| Top Features | Lobby, Matchmaking, and Party | Economy, Leaderboards, Data & Analytics |

## What's included in the Online Subsystem?

- Create, join and search lobbies
- Quick matchmaking
- Invite friends to game lobby
- Game networking
- VOIP
- Support for the following platforms:
  - Xbox Series X GDK
  - PC GDK
  - Xbox One GDK
  - PC Steam
  - Nintendo Switch
  - PS5™ and PS4™
- Support for cross-play & cross-talk across the above platforms
- Azure Cognitive Services
  - Real-time text chat translation
  - Real-time voice chat transcription
  - Real-time voice chat transcription translation
  - Text-to-speech synthesis

## Which versions of Unreal Engine are supported?

| UE version   | GDK PC      | GDK Xbox    | Steam       | PS4         | PS5         | Switch      |
|--------------|-------------|-------------|-------------|-------------|-------------|-------------|
| 4.27 Plus    | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  |
| 5.0          | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  |
| 5.1          | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  |
| 5.2          | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  |
| 5.3          | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  | Supported*  |
| 5.4          | Supported   | Supported   | Supported   | Supported   | Supported   | Supported   |


*For users on previous versions of Unreal Engine (UE4.27, 5.0, 5.1, 5.2, and 5.3) who wish to use PlayFab Online Subsystem, here are two options:
- Upgrade your local Unreal Engine version to 5.4.
- Pull the latest release and backport it to your game.
For UE4, 4.27 is the recommended version since crossplay between different platforms doesn't work on 4.26, but it does on 4.27. If you're on an earlier version of Unreal Engine 4, the OSS can be backported with minimal work. See [Using older versions of Unreal Engine 4](party-unreal-engine-using-older-versions.md) for more details.

>[!NOTE]
> If you're using a version of UE4 earlier than 4.25plus, you have to rename all references to GDK to Anvil using find and replace all.

If you have any questions during backporting on UE4.27, 5.0, 5.1, 5.2 and 5.3, feel free to open a [GitHub issue](https://github.com/PlayFab/PlayFabMultiplayerUnreal/issues/new) or open a [support ticket](https://playfab.com/contact/).

## Which versions of the Microsoft Game Development Kit (GDK) are supported?

Refer to Unreal Engine’s Developer’s documentation at [GDK SDK Update Paths](https://udn.unrealengine.com/s/article/GDK-SDK-Updates-Path) for the most updated information.

If you're using XDK, note that it is supported on an older version(1.07 and earlier) of the OSS. For details, see [Using older versions](party-unreal-engine-using-older-versions.md).

>[!NOTE]
> The WinGDK version of UE5.3 is known to have an issue related to HTTP requests. Epic Games has recognized this problem and addressed it in version 5.4. To work around this issue in UE5.3, launch your game using `-UseWinHttpGDK` command-line argument to switch to WinHTTP instead of xCurl. For more information, see Unreal Engine forum post about [5.3 WinGDK HTTP running issue with xCurl](https://udn.unrealengine.com/s/question/0D54z00009l9fK0CAI/53-wingdk-http-module-wont-compile-with-xcurl).

## Which version of the Nintendo Switch SDKs are supported?

The supported Nintendo Switch SDK versions can be found at [Switch SDK Updates Path](https://udn.unrealengine.com/s/article/Switch-SDK-Updates-Path) or in the corresponding file:

- UE4: \Engine\Platforms\Switch\Source\Programs\UnrealBuildTool\UEBuildSwitch.cs
- UE5.0: \Engine\Platforms\Switch\Source\Programs\UnrealBuildTool\SwitchPlatformSDK.cs
- UE5.1, UE5.2 and UE5.3: \Engine\Platforms\Switch\Source\Programs\UnrealBuildTool\SwitchPlatformSDK.Versions.cs
- UE5.4: \Engine\Platforms\Switch\Config\Switch_SDK.json
      
## Which version of the PS5™ and PS4™ SDKs are supported?

The supported Sony PlayStation SDK versions can be found at [PS4 SDK Compatibility](https://udn.unrealengine.com/s/article/PS4-SDK-Compatibility), [PS5 SDK Compatibility](https://udn.unrealengine.com/s/article/PS5-SDK-Compatibility), or in the corresponding file:
- UE4: \Engine\Platforms\[PS4|PS5]\Source\Programs\UnrealBuildTool\UEBuild[PS4|PS5].cs
- UE5.0: \Engine\Platforms\[PS4|PS5]\Source\Programs\UnrealBuildTool\[PS4|PS5]PlatformSDK.cs
- UE5.1, UE5.2 and UE5.3: \Engine\Platforms\[PS4|PS5]\Source\Programs\UnrealBuildTool\[PS4|PS5]PlatformSDK.Versions.cs
- UE5.4: \Engine\Platforms\[PS4|PS5]\Config\[PS4|PS5]_SDK.json
      
>[!NOTE]
> In order to access Unreal’s documentation and UDN forum links above, you must be a registered Unreal Developer and tented for the specific platform.

## Pricing

For pricing details, see [Billing for PlayFab Party](../../pricing/meters/meters.md#party).

"PlayStation" is a registered trademark or trademark of Sony Interactive Entertainment Inc.
"PS4" is a registered trademark or trademark of Sony Interactive Entertainment Inc.
"PS5" is a registered trademark or trademark of Sony Interactive Entertainment Inc.
