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

- [Private Preview libraries and release notes](./bmb-quickstart.md)
- [Stub conceptual introduction](./intro-to-networking.md)
- [Proposed pricing](./pricing.md)

Got questions? Email [Bumblelion Overhead](mailto:bumblelionoverhead@microsoft.com)

Artifacts that are in progress:

- Reference documentation 
- Legit conceptual documentation 
- BumbleRumble (a sample)


## Roadmap

|-|1PP Private Preview (1810)|3PP Private Preview (1902)|3PP Public Preview (1904)|
|-|-|-|-|
|Players|32 max|-|-|
|Chat|Voice; Speech to text|Text; Text to Speech||
|Identity|PlayFab custom identity; XBL identity|Steam Identity|Steam Compliance; XBL Compliance|
|Network|-|DTLS Security; Datacenter selection|-|
|Administration|-|Game Manager UX | Billing & Consumption analytics|

Backlog (dates TBD):

- Client Audio manipulation (post-decode)
- Client Audio manipulation (pre-encode)
- Speech to Text translation
- Text to Text translation
- Increasing player maximum
- PLayFab Multiplayer Server library
- Server Mixing
- Peer-to-peer transport (reduces network egress cost)


## Inital SDK Availability

Table below indicates our confidence level for providing an SDK for the specified platform on that date. We intend to support every platform on this list it's simply a matter of time.

|-|1PP Private Preview (1810)|3PP Private Preivew (1902)|3PP Public Preview 1904|
|-|-|-|-|
|Win32/Win10|Done|-|-|
|Xbox ERA|Available today without hardware acceleration|-|High|
|Win32/Win7|-|High||
|PlayStation|-|-|Medium|
|Android|Unplanned|
|Switch|Unplanned|
|iOS|-|-|Low|
|GameCore/Win10|-|High|-|
|GameCore/Xbox|-|High|-|

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
