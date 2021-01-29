---
title: PlayFab Party Unity plugin Release Notes
author: vicodex
description: Release notes for PlayFab Party Unity SDK
ms.author: victorku
ms.date: 01/27/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, party, unity, release notes, multiplayer, networking
ms.localizationpriority: medium
---

# PlayFab Party Unity plugin release notes

## 1.5.0.3

Party Unity SDK plugin becomes generally available (GA) to developers on platforms:
- Windows, iOS, Android:
https://github.com/playfab/PlayFabPartyUnity
- Sony PlayStation&reg;:
  - PS4: https://dev.azure.com/PlayFabPrivate/PS4/_git/PlayFabPartyUnityPS4 (restricted access)
  - PS5: https://dev.azure.com/PlayFabPrivate/PS5/_git/PlayFabPartyUnityPS5 (restricted access)
- Nintendo Switch&trade;: https://dev.azure.com/PlayFabPrivate/Switch/_git/PlayFabPartyUnitySwitch (restricted access)

### New features in GA

- Ability to set a language for the local player, before creating or joining a Party
- Optional translation of incoming text chat messages to local language, using Party Cognitive Services
- Speech-to-text (STT): optional transcription of incoming audio chat into text chat messages in local language, using Party Cognitive Services (incurs additional cost if exceeds free quota)
- Text-to-speech (TTS): optional synthesization of speech, conversion of outgoing text chat messages into audible form received by other players (incurs additional cost if exceeds free quota)

### Bug fixes

- Numerous bug fixes and stability improvements since pre-release.
