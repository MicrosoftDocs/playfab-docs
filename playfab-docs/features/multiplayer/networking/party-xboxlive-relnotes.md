---
title: PlayFab Party Xbox Live Helper Release Notes
author: alexatxbox
description: Release notes for PlayFab Party Xbox Live Helper
ms.author: alstonge
ms.date: 08/15/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, party, release notes, multiplayer, networking, xbox, xbl
ms.localizationpriority: medium
---

# Xbox Live Helper library release notes

The Xbox Live Helper library is available on [Nuget.org](https://www.nuget.org/profiles/PlayFab)!

## 1.1.0

### GetEntityIdsFromXboxLiveUserIds API

This release of the Party Xbox Live Helper library introduces the `PartyXblManager::GetEntityIdsFromXboxLiveUserIds()` API and associated completion state change, `PartyXblGetEntityIdsFromXboxLiveUserIdsCompleted`. This API allows Titles to query the PlayFab Entity Ids corresponding to a given list of Xbox Live User IDs. Please refer to the [overview](party-xbox-live-guide.md#translating-xbox-live-user-ids-to-playfab-entity-ids) for more information.

## 1.0.1

#### LoginToPlayFab API

This release of the Party Xbox Live Helper library introduces the `PartyXblManager::LoginToPlayFab()` API and associated completion state change, `PartyXblLoginToPlayFabCompletedStateChange`. This API provides equivalent functionality to the PlayFab SDK `LoginWithXbox` API. Please refer to the [overview](party-xbox-live-guide.md#user-creation-and-interaction-with-playfab-party) for more information.
