---
title: PlayFab OnlineSubsystem for Unreal Engine 4 and 5 Release Notes
author: PushpadantK
description: Release notes for PlayFab OnlineSubsystem for Unreal Engine 4 and 5
ms.author: pkacha
ms.date: 11/28/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, party, unreal, release notes, multiplayer, networking
ms.localizationpriority: medium
---

# PlayFab Unreal Engine OnlineSubsystem Release Notes

Refer to [QuickStart: PlayFab Online Subsystem (OSS)](party-unreal-engine-oss-quickstart.md) for download and install instructions.

## 2.3.4
- Supported the release of UE5.4.

Updated the following libraries:
- Updated the Multiplayer SDK C++ library to version 1.7.2 for both Windows and GDK.
- Updated the Party SDK C++ library to version 1.9.5 for both Windows and GDK.

Feature fixes:
- Fixed the failure to create or join a session when the player name includes emojis or special types of characters.
- Fixed the failure to update lobby access policy.
- Fixed a potential crash caused by `GetBytes()` and `GetSize()`.
- Added missing pass through functions and interfaces for native OSS.
- [Steam] Fixed the game crash when launching a Steam game without first launching Steam application.
- [Steam] Replaced `GetAuthSessionTicket()` with `GetAuthTicketForWebApi()` for Steam 1.57 SDK.

Known issue:
- When using the PlayFab Online Subsystem in UE5.4 GDK, you may encounter the following runtime error: `Runtime dependency Party.dll is configured to be staged from C:\Program Files (x86)\Microsoft GDK\<version>\Party.dll and \Engine\Plugins\Online\OnlineSubsystemPlayFab\Platforms\GDK\Redist\Party.dll`.
  To resolve this issue, refer to [QuickStart: PlayFab Online Subsystem (OSS)](party-unreal-engine-oss-quickstart.md#unreal-engine-installed-builds).
- `NumPrivateConnections` of FOnlineSessionSettings isn't supported because PlayFab service doesn't track private connections.

## 2.3.3
Feature Updates:
- Added support for dedicated server scenarios. For more information on setting up dedicated servers for your game, see the [Dedicated Server Setup Guide](party-unreal-engine-oss-dedicated-servers.md).
- Added better integration with the [PlayFab SDK Unreal Engine (UE) Marketplace Plugin](https://www.unrealengine.com/marketplace/product/playfab-sdk). For more information on integrating the PlayFab Plugin, see the [PlayFab SDK UE Marketplace Plugin Integration Guide](party-unreal-engine-oss-playfab-plugin-integration.md).
- Introduced a new configuration boolean, `bForceAutoLogin`.
    - Previously on Win64 and PlayStation platforms, the default behavior was to always attempt to call `AutoLogin()` for the primary local user.
    - This new configuration boolean allows `AutoLogin()` to be disabled for Win64 and PlayStation platforms if you wish to call `Login()` elsewhere.
    - The default behavior remains the same with `bForceAutoLogin` set to `true`. You can configure `bForceAutoLogin` in your `<Windows|PS4|PS5>Engine.ini` file under the `OnlineSubsystemPlayFab` section.
        ```ini
        [OnlineSubsystemPlayFab]
        bForceAutoLogin=<true|false>
        ```
    - Login behavior for all other platforms remains unchanged.

## 2.3.2
Updated the following libraries:
- Updated the Multiplayer SDK C++ library to version 1.6.5 for both Windows and GDK.
- Updated the Party SDK C++ library to version 1.8.9 for both Windows and GDK.

## 2.3.1
- Supported UE5.3 and previous UE versions (UE4.27+, UE5.0, UE5.1, and UE5.2. Refer to [QuickStart: Which versions of Unreal Engine are supported](party-unreal-engine-oss-overview.md#which-versions-of-unreal-engine-are-supported)).

Known issue:
- The WinGDK version of UE5.3 is known to have an issue related to HTTP requests. Epic Games has recognized this problem and addressed it in version 5.4. To work around this issue in UE5.3, launch your game using `-UseWinHttpGDK` command-line argument to switch to WinHTTP instead of xCurl. For more information, see Unreal Engine forum post about [5.3 WinGDK HTTP running issue with xCurl](https://udn.unrealengine.com/s/question/0D54z00009l9fK0CAI/53-wingdk-http-module-wont-compile-with-xcurl).

## 2.3.0
- Supported UE5.2 and previous UE versions (UE4.27+, UE5.0, and UE5.1. Refer to [QuickStart: Which versions of Unreal Engine are supported](party-unreal-engine-oss-overview.md#which-versions-of-unreal-engine-are-supported)).

Feature fixes:
- Implemented `FOnlineSessionPlayFab::SendSessionInviteToFriends` and `FOnlineExternalUIPlayFab::ShowInviteUI` for GDK, Steam, and PlayStation with native platform invites
- Fixed the display of player platform ID
- Fixed failure to update member properties and lobby search keys
- Fixed failure to play new game after suspend and resume on the Xbox platform
- Fixed microphone audio issue on GDK
- Fixed the modification on `bIsDedicated` in `OnlineSessionInterfacePlayFab`

Compile fixes:
- Deprecated XboxOne and replaced it with XB1 for Unreal Engine 5.2
- Resolved build warnings, non-unity build errors, compilation issues when users lack access to Unreal Engine across all platforms

Known issue:
- To invite a Steam or PlayStation player, the host must be on the same platform.

## 2.0.0
- UE4 engine OSS PlayFab is updated to use Multiplayer features offered by Azure PlayFab such as Lobby, Matchmaking along with PlayFab Party.
This update replaces the Xbox provided MPSD with Azure PlayFab Lobby and XBL Smart match with Azure Matchmaking service.
- XDK is no longer supported for this version of the OSS.

## 1.0.7
- UE4 Engine version 4.26 is the recommended version to use with this version of OnlineSubsystemPlayfab.
### Notes:
- Rename OnlineSubsystemPlayFabParty to OnlineSubsystemPlayfab.