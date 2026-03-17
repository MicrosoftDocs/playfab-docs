---
title: PlayFab Services SDK Release Notes 2026
author: stevenLizano29
description: PlayFab Services SDK Release Notes for 2026.
ms.author: v-stevenroj
ms.date: 03/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---
# PlayFab Services SDK Release Notes 2026

> [!NOTE]
> For release notes about service releases and product updates, see the [release notes](https://github.com/PlayFab/PlayFab/releases) section on [PlayFab's public GitHub repository](https://github.com/PlayFab/PlayFab)

## 260313

Date: March 13, 2026

 - Renamed the `GetPlayersInSegmentDeprecated` error code to `GetPlayersInSegmentRetired`
 - Updated the `GetFriendsList` documentation in the Client and Server APIs to clarify Xbox friend's behavior
 - Updated the `FindFriendLobbies` documentation in the Multiplayer API to clarify mutual friends requirement
 - Added the `ProductDisabledForTitle` error code to multiple calls across the Client, Server, Admin, and Experimentation APIs
 - Added error codes for new service errors

## 260227

Date: February 27, 2026

 - Added ProductDisabledForTitle error code to multiple calls across the Client, Server, and Admin APIs
 - Added error codes for new service errors

## 260213

Date: February 13, 2026

 - Added AddOrUpdateContactEmail to the Server API
 - Added PubSub connection lifetime extension support to the Multiplayer API
 - Added error codes for new service errors

## 260123

Date: January 23, 2026

 - Removed GetMicrosoftStoreAccessTokens from the Economy API
 - Added error codes for new service errors

## 260109

Date: January 9, 2026

 - Added the following calls to the Server API:
   - UnlinkFacebookAccount
   - UnlinkFacebookInstantGamesId
 - Added error codes for new service errors
