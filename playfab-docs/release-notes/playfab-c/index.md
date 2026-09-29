---
title: PlayFab Services C/C++ SDK Release Notes
author: amccalib
description: PlayFab Services C/C++ SDK Release Notes.
ms.author: andmcc
ms.date: 09/04/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---
# PlayFab Services C/C++ SDK Release Notes

These release notes are for __PlayFabCSdk__. For release notes for other PlayFab Services SDKs, see [Other Services SDK Release Notes](../index.md).

> [!NOTE]
> For release notes about service releases and product updates, see the [release notes](https://github.com/PlayFab/PlayFab/releases) section on [PlayFab's public GitHub repository](https://github.com/PlayFab/PlayFab)

## 2604.0.1

Date: September 4, 2026

### Breaking changes

- Removed `PFInventoryGetMicrosoftStoreAccessTokensAsync`, its result functions, and its request and response types after the service API was retired.
- Removed `PFSegmentsServerGetPlayersInSegmentAsync`, its result functions, and its supporting types after the service API was retired.
- Removed the obsolete `entity` member from `PFAuthenticationGetEntityRequest`. `PFAuthenticationGetEntityAsync` now issues a token for the calling entity.
- Renamed two Account Management request types to distinguish the Client and Server models:
  - `PFAccountManagementUnlinkAppleRequest` is now `PFAccountManagementClientUnlinkAppleRequest`.
  - `PFAccountManagementUnlinkGameCenterAccountRequest` is now `PFAccountManagementClientUnlinkGameCenterAccountRequest`.
- Removed the retired `E_PF_COPILOT_DISABLED`, `E_PF_COPILOT_INVALID_REQUEST`, `E_PF_GET_PLAYERS_IN_SEGMENT_DEPRECATED`, and `E_PF_GET_PLAYERS_IN_SEGMENT_RATE_LIMIT_EXCEEDED` error codes.
- Changed the underlying type of `PFGameSaveInitOptions` from `uint32_t` to `uint64_t`.
- Added values to `PFMultiplayerServerAzureVmSize`. Existing values after the insertion points have new numeric representations, so applications shouldn't persist or transmit the numeric value of this enumeration across SDK versions.

### API updates

- Added the optional `namespaceWide` member to `PFFriendsClientGetFriendsListRequest` and `PFFriendsServerGetFriendsListRequest`. It includes friends from the same namespace who haven't signed in to the current title.
- Added PlayStation Network authentication-version and sandbox support through new `authVersion`, `sandboxId`, and `psnSandboxId` members on the related Authentication, Account Management, and user-information models.
- Added `issuer` to `PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest`.
- Added statistics data to entity profiles through `includeStatistics` and the new `PFStatisticColumn`, `PFStatisticColumnCollection`, and `PFStatisticColumnCollectionDictionaryEntry` types.
- Added `aggregationTargetEntityKeys` to `PFStatisticsStatisticUpdate` and added the `PFStatisticAggregationMethod` enumeration.
- Added `expirationTimestamp` to `PFInventoryRedemptionSuccess`, `region` to `PFMultiplayerServerRequestPartyServiceResponse`, and additional Azure VM sizes.
- Added service error codes for new PlayStation Network, Nintendo, Economy, Experiments, Statistics, Segments, entity-membership, IP-address, and Game Save conditions.
- `PFEntityRegisterTokenRefreshedEventHandler` now accepts an optional task queue.
- Added `E_PF_GAMESAVE_OPERATION_IN_PROGRESS` for Game Save operations rejected because another mutually exclusive operation is in progress.
- Added `PF_GAMESAVE_MAX_SHORT_SAVE_DESCRIPTION_LENGTH`, which defines the maximum accepted short save-description length as 768 characters.

### Runtime and platform updates

- Fixed `PFUninitializeAsync` hanging while an internal HTTP operation or event-pipeline flush is in progress.
- Added the SDK version to the trace log during initialization.
- Updated `PlayFab::Wrappers::Exception::what()` to include the `HRESULT` in its message.
- Exported `PF_API` symbols with default visibility on iOS and macOS, and fixed a macOS launch crash when using the Apple Unified SDK.
- Fixed sized `operator delete` overrides on Clang-based toolchains so custom memory hooks are honored.
- Updated GDK projects to use the `x64` project platform required by the GDK 2510 layout and added support for retargeting projects to the Visual Studio 2026 `v145` toolset.
- Pinned the Android `com.google.android.gms:play-services-games-v2` dependency to version 21.0.0 to retain `minSdkVersion 21` compatibility.

### Game Save updates

- Fixed non-PlayFab blob-transfer failures being reported as success. HTTP failures now return a failing `HRESULT` instead of allowing a manifest to be finalized against a blob that wasn't written.
- Fixed data-loss and synchronization issues involving stale extended-manifest URLs, incomplete remote file sets, folder deletion during download, missing `localstate.json`, and marker-file creation for new saves.
- Fixed upload, locking, and conflict failures, including infinite relock loops, stale manifest versions, incorrect base-version chains, conflict-loser selection, mishandled nonretryable service errors, and unnecessarily slow uploads after directory deletion.
- Fixed GDK memory corruption and races in shared Game Save context management, and added validation that prevents extended-manifest paths from escaping the save folder.
- Restored title write access to the save folder when synchronization enters the `Uploading` state. Original files are read only during `PreparingForUpload`.
- Clarified progress behavior: `PFGameSaveFilesUiProgressCallback` reports state transitions, while `PFGameSaveFilesUiProgressGetProgress` can be polled for byte-level progress. A total of zero now means that the total is unknown.
- Fixed GRTS cancellation and offline behavior, accepted forward-slash paths produced by engines such as Unreal Engine, and corrected several Windows and GDK initialization, shutdown, device-identity, and save-loading failures.
- Fixed Game Save telemetry identifying Steam Deck devices incorrectly.

## 2504.0.0

Date: April 22, 2025

- Migrated JSON parsing from rapidjson to nlohmann::json for improved security and maintainability.
- Addressed an issue where initializing PFCore overwrites the trace callback set by the title.
- Changes to the memory hook functions, adding a new API to retrieve default memory hooks and modifying existing memory allocation functions to include a memory type ID.
- Fixed a bug related to tracing cleanup when multiple clients are involved.
- Enabled the PFAccountManagementSetDisplayNameAsync API in PlayFab.C.
- Introduced custom memory allocation for the nlohmann JSON library and global overrides for new/delete operators.

## 2410.0.0

Date: October 4, 2024

 - Added public headers, source, and libraries for use with the Microsoft GDK to the GitHub release
 - The http library, libHttpClient, is now a dynamic library dependency on all platforms.
 This library must be included in the game's shipped package for PlayFab Services to function.
 - Added public preview APIs for Leaderboards and Statistics
 - Added authenticationToken optional parameter authenticationToken to PFAuthenticationLoginWithFacebookRequest
 - Added support for new service error codes
 - Removed OfferId from redeem responses in the Economy API. Added the new field MarketplaceAlternateId instead.
 Callers should move to the new field, while the service will continue to respond with both fields for backward compatibility.
 - Resolved an issue with PFFriendsExternalFriendSources not allowing multiple selections

## 2406.0.0

Date: July 2, 2024

 - Added support for optional gzip compression to __PFEventPipelineConfig__ for Linux and Android
 - Added support for automatic response gzip compression (and decompression) using __PFHttpSettings__
 - Enable print truncation when attempting to log XCurl traces
 - Fixed various static code analysis warnings

## 2403.0.0

Date: February 28, 2024

 - Release of new SDK projections with support for Linux, Android, iOS and macOS. The new APIs being exposed with this release are:

    - **For Android**:
      - LoginWithFacebook
      - ClientLinkGoogleAccount
      - ClientLinkGooglePlayGamesServicesAccount
      - ClientUnlinkGoogleAccount
      - ClientUnlinkGooglePlayGamesServicesAccount
      - ClientAndroidDevicePushNotificationRegistration
      - RedeemGooglePlayInventoryItems

    - **For iOS**:
      - LoginWithFacebook
      - ClientLinkApple
      - ClientUnlinkApple
      - ClientLinkGameCenterAccount
      - ClientUnlinkGameCenterAccount
      - ClientRegisterForIOSPushNotification
      - RedeemAppleAppStoreInventoryItems

 - Added support for Event Buffering in Event pipelines.

## 2310.0.1

Date: September 28, 2023

 - Added PFAccountManagementServerLinkNintendoServiceAccountSubjectAsync to Win32 

## 2310.0.0

Date: September 28, 2023

 - Added support for Nintendo Switch (see Request access for secured SDKs and samples - PlayFab | Microsoft Learn to request access)
 - Added optional gzip compressionLevel to __PFEventPipelineConfig__
 - Removed TelemetryKey management calls from __PFEvents__
 - Added missing Legacy __PFCloudScript__ Client calls:
   - ClientExecuteCloudScript
   - ExecuteEntityCloudScript
 - Added missing __PFAccountManagement__ Client calls:
   - ClientAddOrUpdateContactEmail
   - ClientAddUsernamePassword
   - ClientGetPlayFabIDsFromFacebookIDs
   - ClientGetPlayFabIDsFromFacebookInstantGamesIds
   - ClientGetPlayFabIDsFromGameCenterIDs
   - ClientGetPlayFabIDsFromGoogleIDs
   - ClientGetPlayFabIDsFromGooglePlayGamesPlayerIDs
   - ClientGetPlayFabIDsFromKongregateIDs
   - ClientGetPlayFabIDsFromNintendoServiceAccountIds
   - ClientGetPlayFabIDsFromNintendoSwitchDeviceIds
   - ClientGetPlayFabIDsFromPSNAccountIDs
   - ClientGetPlayFabIDsFromTwitchIDs
   - ClientLinkAndroidDeviceID
   - ClientLinkApple
   - ClientLinkFacebookAccount
   - ClientLinkFacebookInstantGamesId
   - ClientLinkGameCenterAccount
   - ClientLinkGoogleAccount
   - ClientLinkGooglePlayGamesServicesAccount
   - ClientLinkIOSDeviceID
   - ClientLinkKongregate
   - ClientLinkNintendoServiceAccount
   - ClientLinkNintendoSwitchDeviceId
   - ClientLinkPSNAccount
   - ClientLinkTwitch
   - ClientRemoveContactEmail
   - ClientSendAccountRecoveryEmail
   - ClientUnlinkAndroidDeviceID
   - ClientUnlinkApple
   - ClientUnlinkFacebookAccount
   - ClientUnlinkFacebookInstantGamesId
   - ClientUnlinkGameCenterAccount
   - ClientUnlinkGoogleAccount
   - ClientUnlinkGooglePlayGamesServicesAccount
   - ClientUnlinkIOSDeviceID
   - ClientUnlinkKongregate
   - ClientUnlinkNintendoServiceAccount
   - ClientUnlinkNintendoSwitchDeviceId
   - ClientUnlinkPSNAccount
   - ClientUnlinkTwitch
   - ClientUpdateUserTitleDisplayName
 - Added many calls intended for use by game servers (only for Win32)
   - __PFAuthentication__
     - ServerLoginWithServerCustomId
     - ServerLoginWithSteamId
     - ServerLoginWithXbox
     - ServerLoginWithXboxId
     - AuthenticateGameServerWithCustomId
     - Delete
     - GetEntity
     - ValidateEntityToken
   - __PFAccountManagement__
     - ServerBanUsers
     - ServerDeletePlayer
     - ServerGetPlayerCombinedInfo
     - ServerGetPlayerProfile
     - ServerGetPlayFabIDsFromFacebookIDs
     - ServerGetPlayFabIDsFromFacebookInstantGamesIds
     - ServerGetPlayFabIDsFromNintendoServiceAccountIds
     - ServerGetPlayFabIDsFromNintendoSwitchDeviceIds
     - ServerGetPlayFabIDsFromPSNAccountIDs
     - ServerGetPlayFabIDsFromSteamIDs
     - ServerGetPlayFabIDsFromTwitchIDs
     - ServerGetPlayFabIDsFromXboxLiveIDs
     - ServerGetServerCustomIDsFromPlayFabIDs
     - ServerGetUserAccountInfo
     - ServerGetUserBans
     - ServerLinkNintendoServiceAccount
     - ServerLinkNintendoSwitchDeviceId
     - ServerLinkPSNAccount
     - ServerLinkServerCustomId
     - ServerLinkSteamId
     - ServerLinkXboxAccount
     - ServerRevokeAllBansForUser
     - ServerRevokeBans
     - ServerSendCustomAccountRecoveryEmail
     - ServerSendEmailFromTemplate
     - ServerUnlinkNintendoServiceAccount
     - ServerUnlinkNintendoSwitchDeviceId
     - ServerUnlinkPSNAccount
     - ServerUnlinkServerCustomId
     - ServerUnlinkSteamId
     - ServerUnlinkXboxAccount
     - ServerUpdateAvatarUrl
     - ServerUpdateBans
     - GetTitlePlayersFromXboxLiveIDs
   - __PFCloudScript__
     - ServerExecuteCloudScript
   - __PFFriends__
     - ServerAddFriend
     - ServerGetFriendsList
     - ServerRemoveFriend
     - ServerSetFriendTags
   - __PFInventory__
     - GetTransactionHistory
   - __PFLocalization__
     - GetLanguageList
   - __PFPlatformSpecific__
     - ServerAwardSteamAchievement
   - __PFPlayerDataManagement__
     - ServerGetUserData
     - ServerGetUserInternalData
     - ServerGetUserPublisherData
     - ServerGetUserPublisherInternalData
     - ServerGetUserPublisherReadOnlyData
     - ServerGetUserReadOnlyData
     - ServerUpdateUserData
     - ServerUpdateUserInternalData
     - ServerUpdateUserPublisherData
     - ServerUpdateUserPublisherInternalData
     - ServerUpdateUserPublisherReadOnlyData
     - ServerUpdateUserReadOnlyData
   - __PFPushNotifications__
     - ServerSendPushNotification
     - ServerSendPushNotificationFromTemplate
   - __PFSegments__
     - ServerAddPlayerTag
     - ServerGetAllSegments
     - ServerGetPlayerSegments
     - ServerGetPlayersInSegment
     - ServerGetPlayerTags
     - ServerRemovePlayerTag
   - __PFTitleDataManagement__
     - ServerGetPublisherData
     - ServerGetTime
     - ServerGetTitleData
     - ServerGetTitleInternalData
     - ServerGetTitleNews
     - ServerSetPublisherData
     - ServerSetTitleData
     - ServerSetTitleInternalData

## 2306.0.0

Date: July 26, 2023

 - Initial release of the SDK with support for Win32 and GDK
