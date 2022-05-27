---
title: PlayFab Online Subsystem (OSS)
description: Overview of the PlayFab Online Subsystem for Unreal Engine 4
author: PushpadantK
ms.author: pkacha
ms.date: 11/29/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, middleware
---

# Overview

The PlayFab Online Subsystem (PF OSS) enables you to make use of Multiplayer features like Lobby, Matchmaking, Party and Azure Cognitive Services in your Unreal Engine 4 (UE4) game. These features include cross-talk, cross-play, and accessibility features like real-time text chat translation and voice transcription services. It is currently designed for use when developing PC, Xbox, Steam and Nintendo Switch games. This subsystem layer works seamlessly on top of the existing Epic provided base Online Subsystem (OSS) GDK. PlayFab OSS compliments the base OSS by adding support for PlayFab Lobby, Matchmaking, Party networking and Voice over Internet Protocol (VOIP).

PlayFab OSS works alongside the PlayFab SDK marketplace plugin, which provides other PlayFab functionalities such as economy, leaderboards, and more. For more information, see [PlayFab SDK on the UE4 Marketplace (external site)](https://www.unrealengine.com/marketplace/product/playfab-sdk).

## What is included in the Online Subsystem?

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
- Support for cross-play & cross-talk across the above platforms
- Azure Cognitive Services
    - Real-time text chat translation
    - Real-time voice chat transcription
    - Real-time voice chat transcription translation
    - Text-to-speech synthesis 

## Which versions of Unreal Engine are supported?

We officially support 4.27 and 4.26, however 4.27 is the recommended version. Crossplay between different platforms does not work on 4.26, but it does on 4.27. If you are on an earlier version of Unreal Engine 4, the OSS can be backported with minimal work. Refer to the [Using older versions of Unreal Engine 4](party-unreal-engine-using-older-versions.md) page for more details.

**NOTE:** If you are using a version of UE4 earlier than 4.25plus, you will have to rename all references to GDK to Anvil using find & replace all.

## Which versions of the Microsoft Game Development Kit (GDK) are supported?

- **PC**
  - Recommended: June 2021 GDK (2021.06)
  - Minimum: November 2020 GDK (2020.11)
    - When utilizing a GDK version earlier than 2020.11 on PC, reach out to your Microsoft Representative for further guidance.
- **Xbox GDK:**
  - Recommended: June 2021 GDK (2021.06)
  - Minimum: June 2021 GDK (2021.06)

XDK is supported on older version(1.07 and earlier) of the OSS, refer [Using older version](party-unreal-engine-using-older-versions.md) for further details.

## Which version of the Nintendo Switch SDKs are supported?

- Recommended: Refer to the UEBuild.cs file in the UnrealBuildTool folder for the Switch.

## Pricing

**VOIP and Game Networking functionality is free for users signed in with an Xbox Live account, regardless of platform.**

Cognitive services and other services may have a cost associated with them. For details, see [Billing for PlayFab Party](pricing.md) or reach out to your Microsoft Representative.
