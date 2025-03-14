---
title: PlayFab Party Unity plugin Release Notes
author: vicodex
description: Release notes for PlayFab Party Unity SDK
ms.author: victorku
ms.date: 01/27/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, party, unity, release notes, multiplayer, networking
ms.localizationpriority: medium
---

# PlayFab Party Unity plugin release notes

## 1.9.3.0

* Updated binaries to Party 1.9.3 or greater for all platforms.

## 1.8.0.0

* Updated binaries to Party 1.8.0 or greater for all platforms.

## 1.7.6.0

PlayFab Party Unity SDK plugin is supported on Linux (Ubuntu 20.04 and Ubuntu 22.04).

## New features for all platforms

* Adds support for suspending and later resuming titles on Xbox and Switch.
* Adds support for leaving and later rejoining a Party for iOS app suspension: [ResetParty()](unity-party-api-reference/classes/playfabmultiplayermanager/methods/playfabunityresetparty.md).
* Various bug fixes.

## 1.7.0.1

* Enabled peer-to-peer connection on supported platforms, except from mobile ones, by default.

## 1.5.0.3

Party Unity SDK plugin becomes generally available (GA) to developers on platforms:
- Windows, iOS, Android:
https://github.com/playfab/PlayFabPartyUnity
- Sony PlayStation&#174;:
  - PS4&#8482;: https://dev.azure.com/PlayFabPrivate/PS4/_git/PlayFabPartyUnityPS4 (restricted access)
  - PS5&#8482;: https://dev.azure.com/PlayFabPrivate/PS5/_git/PlayFabPartyUnityPS5 (restricted access)
- Nintendo Switch&trade;: https://dev.azure.com/PlayFabPrivate/Switch/_git/PlayFabPartyUnitySwitch (restricted access)

"PlayStation" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS4" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS5" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

### New features in GA

- Ability to set a language for the local player, before creating or joining a Party
- Optional translation of incoming text chat messages to local language, using Party Cognitive Services
- Speech-to-text (STT): optional transcription of incoming audio chat into text chat messages in local language, using Party Cognitive Services (incurs additional cost if exceeds free quota)
- Text-to-speech (TTS): optional synthesization of speech, conversion of outgoing text chat messages into audible form received by other players (incurs additional cost if exceeds free quota)

### Bug fixes

- Numerous bug fixes and stability improvements since prerelease.
