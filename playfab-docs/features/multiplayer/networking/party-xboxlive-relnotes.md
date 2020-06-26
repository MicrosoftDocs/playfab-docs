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

## 1.2.5

This release of the Party Xbox Live Helper library includes the following changes:

- A small memory leak is fixed.
- A bug which prevented some heap allocations from flowing through the memory callbacks set in `PartyXblManager::SetMemoryCallbacks()` is fixed.
- `PartyXblManager::CreateLocalChatUser()` will no longer asynchronously fail if Xbox Live services cannot be queried. In the event of service failures, `PartyXblLocalChatUser::GetAccessibilitySettings()` will return an empty `PartyXblAccessibilitySettings` struct and `PartyXblLocalChatUser::GetCrossNetworkCommunicationPrivacySetting()` will return `PartyXblCrossNetworkCommunicationPrivacySetting::Disallowed`.

## 1.2.0

This release of the Party Xbox Live Helper library includes support for the updated chat permission options in version 1.3.0 of PlayFab Party. For a full list of Party and Party Xbox Live Helper library version compatibility, see the [Party Xbox Live Helper Library overview](party-xbox-live-guide.md).

## 1.1.0

### GetEntityIdsFromXboxLiveUserIds API

This release of the Party Xbox Live Helper library introduces the `PartyXblManager::GetEntityIdsFromXboxLiveUserIds()` API and associated completion state change, `PartyXblGetEntityIdsFromXboxLiveUserIdsCompleted`. This API allows Titles to query the PlayFab Entity Ids corresponding to a given list of Xbox Live User IDs. For more information, see [overview](party-xbox-live-guide.md#mapping-between-xbox-live-user-ids-and-playfab-entity-ids).

## 1.0.1

#### LoginToPlayFab API

This release of the Party Xbox Live Helper library introduces the `PartyXblManager::LoginToPlayFab()` API and associated completion state change, `PartyXblLoginToPlayFabCompletedStateChange`. This API provides equivalent functionality to the PlayFab SDK `LoginWithXbox` API. For more information, see [overview](party-xbox-live-guide.md#creating-partylocalchatcontrols-from-partyxbllocalchatusers).
