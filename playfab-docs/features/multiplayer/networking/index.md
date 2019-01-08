---
title: Communication Fabric (Bumblelion)
author: v-thopra
description: Homepage for the Bumblelion 1PP Preview. Properly called PlayFab Multiplayer Communication Fabric.
ms.author: v-thopra
ms.date: 07/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, bumblelion, networking, communication
ms.localizationpriority: medium
---

# Communication Fabric (Bumblelion)

This is the homepage for the Bumblelion 1PP Preview. Properly called "PlayFab Multiplayer Communication Fabric," this relay service creates secure, ultra low-latency device-to-device networks. You can use these networks for game data or voice and text chat.

Here are current docs:

- [Getting started with Bumblelion Private Preview](quickstart.md)
- [Stub conceptual introduction](intro-to-networking.md)
- [Proposed pricing](pricing.md)

Got questions? Email [Bumblelion Overhead](mailto:bumblelionoverhead@microsoft.com)

Artifacts that are in progress:

- Reference documentation 
- Legit conceptual documentation 
- BumbleRumble (a sample)

## Roadmap

|-|Private Preview (1810)| Feburary (1902)|May - 3PP Public Preview (1905)|
|-|-|-|-|
|Players|32 max|-|-|
|Chat|Voice; Speech to text|Text; Text to Speech||
|Identity|PlayFab custom identity; XBL identity|Steam Identity|Steam Compliance; XBL Compliance|
|Network|-|DTLS Security; Datacenter selection|-|
|Administration|-|Game Manager UX | Billing & Consumption analytics|

[Backlog in VSO](https://dev.azure.com/playfab/PlayFab/_backlogs/backlog/Bumblelion/Stories?fullScreen=true)

## Initial SDK Availability

Table below indicates our confidence level for providing an SDK for the specified platform on that date. We intend to support every platform on this list it's simply a matter of time.

|-|1PP Private Preview (1810)|Feburary (1902)| May - Public Preview (1905)| June (1906)|
|-|-|-|-|-|
|Win32/Win10|Done|-|-|-|
|Xbox ERA|Available today without hardware acceleration|-|High|-|
|Win32/Win7|-|-|High|-|
|PlayStation|-|-|-|Medium | 
|Android (Lollipop 5.1+, Samsung, Huawei and Xiaomi)|-|-|-|Medium|
|Switch|-|-| -| Medium |
|iOS (8.0+) |-|-|-| Medium|
|GameCore/Win10|-|-|-|High|
|GameCore/Xbox|-|-|-|High|

## How does Bumblelion related to Xbox Integrated Multiplayer? (XIM)

|-|Bumblelion | XIM |
|-|-|-|
|Identity|- PlayFab Custom <br> - XBL <br> - Steam <br> - PSN <br> |- Xbox Live|
|Platforms|- Win7 Win32 <br> - ERA <br> - GameCore <br> - iOS <br> - Android|- ERA <br> - GameCore <br> - Win10 UWP|
|Access|- Any PlayFab customer |- Managed Xbox Live Partners or ID@Xbox|
|Pricing|- Pay for consumption |- Free|
|Network|- Low latency messaging between devices | - Low latency messaging between devices |
|Chat|- Voice and Text Chat <br> - Text to Speech synthesis <br> - Speech to text transcription <br> - Text to text translation <br> - Speech to text translation |- Voice and Text Chat <br> - Text to Speech synthesis <br> - Speech to text transcription |
|Telemetry| - Integrated PlayStream events | - No telemetry |
