---
title: Content & Configuration Reads Meter API Description
author: vDonGlover
description: This file details the APIs that cause file reads meter to increment.
ms.author: v-doglo
ms.date: 11/04/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Content & Configuration Reads

Content & Configuration files include the following items: entity files, actions, rules, scheduled tasks, matchmaking, push notifications, emails, and title news. Content & Configuration files are a set of key/value pairs that are primarily used to manage configuration for your game remotely.

The following APIs cause the Content & Configuration reads meter to increment.

## Admin APIs

- [ExportMasterPlayerData](https://docs.microsoft.com/rest/api/playfab/admin/account-management/exportmasterplayerdata?view=playfab-rest)
    Exports all associated data of a master player account.

- [GetContentUploadUrl](https://docs.microsoft.com/rest/api/playfab/admin/content/getcontentuploadurl?view=playfab-rest)
    Retrieves the pre-signed URL for uploading a content file. A subsequent HTTP PUT to the returned URL uploads the content. Also, please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply

- [GetActionsOnPlayersInSegmentTaskInstance](https://docs.microsoft.com/rest/api/playfab/admin/scheduledtask/getactionsonplayersinsegmenttaskinstance?view=playfab-rest)
    Get information about a ActionsOnPlayersInSegment task instance.

## Client APIs

- [GetTitleNews](https://docs.microsoft.com/rest/api/playfab/client/title-wide-data-management/gettitlenews?view=playfab-rest)
    Retrieves the title news feed, as configured in the developer portal.

- [GetContentDownloadUrl](https://docs.microsoft.com/rest/api/playfab/client/content/getcontentdownloadurl?view=playfab-rest)
    This API retrieves a pre-signed URL for accessing a content file for the title. A subsequent HTTP GET to the returned URL will attempt to download the content. A HEAD query to the returned URL will attempt to retrieve the metadata of the content. Note that a successful result does not guarantee the existence of this content - if it has not been uploaded, the query to retrieve the data will fail. See this post for more information: https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service. Also, please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply.

- [GetPhotonAuthenticationToken](https://docs.microsoft.com/rest/api/playfab/client/authentication/getphotonauthenticationtoken?view=playfab-rest)
    Gets a Photon custom authentication token that can be used to securely join the player into a Photon room. See https://docs.microsoft.com/gaming/playfab/features/multiplayer/photon/quickstart for more details.

- [GetTitlePublicKey](https://docs.microsoft.com/rest/api/playfab/client/authentication/gettitlepublickey?view=playfab-rest)
    Returns the title's base 64 encoded RSA CSP blob.

- [GetTradeStatus](https://docs.microsoft.com/rest/api/playfab/client/trading/gettradestatus?view=playfab-rest)
    Gets the current status of an existing trade.

- [GetWindowsHelloChallenge](https://docs.microsoft.com/rest/api/playfab/client/authentication/getwindowshellochallenge?view=playfab-rest)
    Requests a challenge from the server to be signed by Windows Hello Passport service to authenticate.

## Data APIs

- [GetFiles](https://docs.microsoft.com/rest/api/playfab/data/file/getfiles?view=playfab-rest)
    Retrieves file metadata from an entity's profile.

## Server APIs

- [GetContentDownloadUrl](https://docs.microsoft.com/rest/api/playfab/server/content/getcontentdownloadurl?view=playfab-rest)
    This API retrieves a pre-signed URL for accessing a content file for the title. A subsequent HTTP GET to the returned URL will attempt to download the content. A HEAD query to the returned URL will attempt to retrieve the metadata of the content. Note that a successful result does not guarantee the existence of this content - if it has not been uploaded, the query to retrieve the data will fail. See this post for more information: https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service. Also, please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply.

- [GetTitleNews](https://docs.microsoft.com/rest/api/playfab/server/title-wide-data-management/gettitlenews?view=playfab-rest)
    Retrieves the title news feed, as configured in the developer portal.

- [SendCustomAccountRecoveryEmail](https://docs.microsoft.com/rest/api/playfab/server/account-management/sendcustomaccountrecoveryemail?view=playfab-rest)
    Forces an email to be sent to the registered contact email address for the user's account based on an account recovery email template.

- [SendEmailFromTemplate](https://docs.microsoft.com/rest/api/playfab/server/account-management/sendemailfromtemplate?view=playfab-rest)
    Sends an email based on an email template to a player's contact email.

- [SendPushNotification](https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotification?view=playfab-rest)
    Sends an iOS/Android Push Notification to a specific user, if that user's device has been configured for Push Notifications in PlayFab. If a user has linked both Android and iOS devices, both will be notified.

- [SendPushNotificationFromTemplate](https://docs.microsoft.com/rest/api/playfab/server/account-management/sendpushnotificationfromtemplate?view=playfab-rest)
    Sends an iOS/Android Push Notification template to a specific user, if that user's device has been configured for Push Notifications in PlayFab. If a user has linked both Android and iOS devices, both will be notified.
