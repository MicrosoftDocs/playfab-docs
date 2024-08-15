---
title: PlayFab Services C/C++ SDK Release Notes
author: amccalib
description: PlayFab Services C/C++ SDK Release Notes.
ms.author: andmcc
ms.date: 09/28/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---
# PlayFab Services C/C++ SDK Release Notes

These release notes are for __PlayFabCSdk__. For release notes for other PlayFab Services SDKs, see [Other Services SDK Release Notes](../index.md).

> [!NOTE]
> For release notes about service releases and product updates, see the [release notes](https://github.com/PlayFab/PlayFab/releases) section on [PlayFab's public GitHub repository](https://github.com/PlayFab/PlayFab)

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
