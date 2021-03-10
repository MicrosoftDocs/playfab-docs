---
title: Party Online Subsystem (OSS)
description: Overview of the PlayFab Party Online Subsystem for Unreal Engine 4
author: PFarqMS
ms.author: phifarq
ms.date: 08/17/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, middleware
---

# Overview

The PlayFab Party Online Subsystem (PFP OSS) enables you to make use of Party and Azure Cognitive services in your Unreal Engine 4 (UE4) game. This includes cross-talk, cross-play, accessibility features like real-time text chat translation and voice transcription services. It is currently designed for use when developing PC and Xbox games. This subsystem layer works seamlessly on top of the existing Epic provided base Online Subsystem (OSS) GDK / Live for Xbox Live. PlayFab Party OSS compliments the base OSS by adding support for PlayFab Party networking and Voice over Internet Protocol (VOIP).

Party OSS works alongside the PlayFab SDK marketplace plugin which provides other PlayFab functionalities such as economy, leaderboards, and more. For more information, see [PlayFab SDK on the UE4 Marketplace (external site)](https://www.unrealengine.com/marketplace/product/playfab-sdk).

## What is included in the Online Subsystem?
- Game networking
- VOIP
- Support for the following platforms:
     - Xbox Series X GDK
     - PC GDK
     - Xbox One GDK
     - Xbox One XDK
- Support for cross-play & cross-talk across the above platforms
    - Extra configuration is required for XDK <-> GDK cross-play. Consult the [PlayFab Party Online Subsystem (OSS) Quickstart](party-unreal-engine-oss-quickstart.md) and [Obtaining PlayFab Party libraries](party-unreal-engine-oss-obtaining-playfab-party-libraries.md) sections for more details.
- Azure Cognitive services
    - Real-time text chat translation
    - Real-time voice chat transcription
    - Real-time voice chat transcription translation
    - Text-to-speech synthesis 

## Which versions of Unreal Engine are supported?
We recommend using Unreal Engine 4.25plus – the first approved version of UE4 for shipping on the Microsoft GDK. If you are on an earlier version of Unreal Engine 4, the OSS can be backported with minimal work. Refer to the [Using older versions of Unreal Engine 4](party-unreal-engine-using-older-versions.md) page for more details.

**NOTE:** If you are using a version of UE4 earlier than 4.25plus, you will have to rename all references to GDK to Anvil using find & replace all.

## Which versions of the Microsoft Game Development Kit (GDK) are supported?
- **PC**
    - Recommended: June 2020 GDK (2006) or later
    - Minimum: November 2019 GDK (1911)
        - When utilizing a GDK version earlier than 2006 on PC, please reach out to your Microsoft Representative for further guidance.
- **Xbox GDK:**
    - Minimum & Recommended: June 2020 GDK (2006) or later
- **Xbox XDK:**
    - Minimum & Recommended: July 2018 XDK (1807)

## Pricing

**VOIP and Game Networking functionality is free for users signed in with an Xbox Live account, regardless of platform.**

Cognitive services and other services may have a cost associated with them. For details, see [Billing for PlayFab Party](pricing.md) or reach out to your Microsoft Representative.