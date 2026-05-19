---
title: PlayFab Services SDK Release Notes 2026
author: stevenLizano29
description: PlayFab Services SDK Release Notes for 2026.
ms.author: v-stevenroj
ms.date: 05/12/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---
# PlayFab Services SDK Release Notes 2026

> [!NOTE]
> For release notes about service releases and product updates, see the [release notes](https://github.com/PlayFab/PlayFab/releases) section on [PlayFab's public GitHub repository](https://github.com/PlayFab/PlayFab).

## 260512

Date: May 12, 2026

- Added `UnlinkApple` and `UnlinkGameCenterAccount` to the Server API
- Added `EntityIsNotAMember` and `InvalidEntityTypeForAggregation` errors to `UpdateStatistics` in the Progression API
- Added `StatisticVersionIncrementNotAllowedWhileLinked` error code across multiple APIs
- Updated Data, Groups, and Profiles API concurrency-control descriptions for profile and group version checks
- Added error codes for new service errors

## 260424

Date: April 24, 2026

- Added `ProductDisabledForTitle` error code to multiple calls in the Multiplayer and Events APIs
- Added `GetPlayersInSegmentRetired` error code to segmented-player retrieval in the Admin and Server APIs
- Added `EventSinkResourceMisconfigured` error code in the Admin API
- Updated Economy API `GetTransactionHistory` documentation to clarify limits (50 events by default, or 250 with response compression)
- Updated Progression API `GetFriendLeaderboardForEntity` request example

## 260410

Date: April 10, 2026

- Added `ValidateApiPolicy` to the Admin API
- Added `ExportPlayersInSegment` and `GetSegmentExport` to the Server API
- Added `AggregationTargetEntityKeys` field to statistic update requests in the Progression API
- Added `WestUs3` Azure region to the Multiplayer API
- Added new VM families and sizes to the Multiplayer API (`Fasv6`, `Fasv7`, `Fadsv7`, `Eadsv5`, `Eadsv6`, `Eadsv7`, `Dadsv7`)
- Added error codes for new service errors

## 260327

Date: March 27, 2026

- Added `IncludeStatistics` parameter to `GetEntityProfile` and `GetEntityProfiles` in the Profiles API
- Added `StatisticsColumnDetails` field to entity profile response in the Profiles API
- Added `LastUpdated` field to `GetPolicy` response in the Admin API
- Added `Warnings` field to `UpdatePolicy` response in the Admin API
- Updated documentation for `GetPolicy` and `UpdatePolicy` request parameters in the Admin API
- Added `PreconditionFailed` error code to `GetInventoryItems` and `TransferInventoryItems` in the Economy API
- Added `StatisticUpdateNotAllowedWhileLinked` error code to the Progression API
- Added error codes for new service errors

## 260313

Date: March 13, 2026

- Renamed the `GetPlayersInSegmentDeprecated` error code to `GetPlayersInSegmentRetired`
- Updated the `GetFriendsList` documentation in the Client and Server APIs to clarify Xbox friend's behavior
- Updated the `FindFriendLobbies` documentation in the Multiplayer API to clarify mutual friends requirement
- Added the `ProductDisabledForTitle` error code to multiple calls across the Client, Server, Admin, and Experimentation APIs
- Added error codes for new service errors

## 260227

Date: February 27, 2026

- Added `ProductDisabledForTitle` error code to multiple calls across the Client, Server, and Admin APIs
- Added error codes for new service errors

## 260213

Date: February 13, 2026

- Added `AddOrUpdateContactEmail` to the Server API
- Added PubSub connection lifetime extension support to the Multiplayer API
- Added error codes for new service errors

## 260123

Date: January 23, 2026

- Removed `GetMicrosoftStoreAccessTokens` from the Economy API
- Added error codes for new service errors

## 260109

Date: January 9, 2026

- Added the following calls to the Server API:
  - `UnlinkFacebookAccount`
  - `UnlinkFacebookInstantGamesId`
- Added error codes for new service errors
