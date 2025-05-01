---
title: PlayFab Party Xbox Live Helper Release Notes
author: ScottMunroMS
description: Release notes for PlayFab Party Xbox Live Helper
ms.author: scmunro
ms.date: 04/14/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, party, release notes, multiplayer, networking, xbox, xbl
ms.localizationpriority: medium
---

# Xbox Live Helper library release notes

The Xbox Live Helper library is available on [Nuget.org](https://www.nuget.org/profiles/PlayFab)!

> [!NOTE]
> Support for the XDK and Windows 7 platforms ended on August 1, 2023. No new Xbox Live Helper library updates will be released for those platforms. The Xbox Live Helper networking and voice services will continue to operate with no impact to any titles currently using Windows 7 or XDK versions of the Xbox Live Helper library.  
> 
>For more information, please see our [forum post](https://community.playfab.com/articles/141546/playfab-party-ending-support-for-the-xdk-and-windo.html).


## 1.2.15

January 29, 2024

This release of the Party Xbox Live Helper library includes the following changes:

- Switched over to new internal build and release infrastructure. No functional changes.

## 1.2.14

October 20, 2023

This release of the Party Xbox Live Helper library includes the following changes:

- Improved internal diagnostics.

## 1.2.12

July 21, 2022

This release of the Party Xbox Live Helper library includes the following changes:

- Improvements to memory management such that all memory is now released as part of `PartyXblManager::Cleanup()`.
- Developers interested in where time is spent in internal library functions can now configure optional method entrance and exit callbacks to hook into their preferred high-performance instrumentation method. For more information, see [`PartyXblManager::SetProfilingCallbacksForMethodEntryExit`](xblreference/classes/PartyXblManager/methods/partyxblmanager_setprofilingcallbacksformethodentryexit.md). In this release, the callbacks are only supported for Windows, Xbox One XDK, and Microsoft Game Core platforms.


## 1.2.9

April 12, 2021

This release of the Party Xbox Live Helper library includes the following changes:

- Fixed a bug where the async operation started by `PartyManager::GetEntityIdsFromXboxLiveUserIds()` may crash on failure.

## 1.2.5

June 26, 2020

This release of the Party Xbox Live Helper library includes the following changes:

- A small memory leak is fixed.
- A bug which prevented some heap allocations from flowing through the memory callbacks set in `PartyXblManager::SetMemoryCallbacks()` is fixed.
- `PartyXblManager::CreateLocalChatUser()` will no longer asynchronously fail if Xbox Live services cannot be queried. In the event of service failures, `PartyXblLocalChatUser::GetAccessibilitySettings()` will return an empty `PartyXblAccessibilitySettings` struct and `PartyXblLocalChatUser::GetCrossNetworkCommunicationPrivacySetting()` will return `PartyXblCrossNetworkCommunicationPrivacySetting::Disallowed`.

## 1.2.0

February 18, 2020

This release of the Party Xbox Live Helper library includes support for the updated chat permission options in version 1.3.0 of PlayFab Party. For a full list of Party and Party Xbox Live Helper library version compatibility, see the [Party Xbox Live Helper Library overview](party-xbox-live-guide.md).

## 1.1.0

January 23, 202

### GetEntityIdsFromXboxLiveUserIds API

This release of the Party Xbox Live Helper library introduces the `PartyXblManager::GetEntityIdsFromXboxLiveUserIds()` API and associated completion state change, `PartyXblGetEntityIdsFromXboxLiveUserIdsCompleted`. This API allows Titles to query the PlayFab Entity Ids corresponding to a given list of Xbox Live User IDs. For more information, see [overview](party-xbox-live-guide.md#mapping-between-xbox-live-user-ids-and-playfab-entity-ids).

## 1.0.1

October 29, 2019

#### LoginToPlayFab API

This release of the Party Xbox Live Helper library introduces the `PartyXblManager::LoginToPlayFab()` API and associated completion state change, `PartyXblLoginToPlayFabCompletedStateChange`. This API provides equivalent functionality to the PlayFab SDK `LoginWithXbox` API. For more information, see [overview](party-xbox-live-guide.md#creating-partylocalchatcontrols-from-partyxbllocalchatusers).
