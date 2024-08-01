---
title: Content & Configuration Reads Meter API Description
author: joannaleecy
description: This file details the APIs that cause file reads meter to increment.
ms.author: joanlee
ms.date: 11/04/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Content & Configuration Reads

Content & Configuration files include the following items: entity files, actions, rules, scheduled tasks, matchmaking, push notifications, emails, and title news. Content & Configuration files are a set of key/value pairs that are primarily used to manage configuration for your game remotely.

The following APIs cause the Content & Configuration reads meter to increment.

## Admin APIs

- [GetContentUploadUrl](/rest/api/playfab/admin/content/get-content-upload-url?view=playfab-rest&preserve-view=true)
    Retrieves the pre-signed URL for uploading a content file. A subsequent HTTP PUT to the returned URL uploads the content. Also, please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply

- [GetActionsOnPlayersInSegmentTaskInstance](/rest/api/playfab/admin/scheduled-task/get-actions-on-players-in-segment-task-instance?view=playfab-rest&preserve-view=true)
    Get information about a ActionsOnPlayersInSegment task instance.

## Client APIs

- [GetTitleNews](/rest/api/playfab/client/title-wide-data-management/get-title-news?view=playfab-rest&preserve-view=true)
    Retrieves the title news feed, as configured in the developer portal.

- [GetContentDownloadUrl](/rest/api/playfab/client/content/get-content-download-url?view=playfab-rest&preserve-view=true)
    This API retrieves a pre-signed URL for accessing a content file for the title. A subsequent HTTP GET to the returned URL will attempt to download the content. A HEAD query to the returned URL will attempt to retrieve the metadata of the content. Note that a successful result does not guarantee the existence of this content - if it has not been uploaded, the query to retrieve the data will fail. See this post for more information: https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service. Also, please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply.

- [GetPhotonAuthenticationToken](/rest/api/playfab/client/authentication/get-photon-authentication-token?view=playfab-rest&preserve-view=true)
    Gets a Photon custom authentication token that can be used to securely join the player into a Photon room. See [Photon Quickstart](/gaming/playfab/features/multiplayer/photon/quickstart) for more details.

- [GetTitlePublicKey](/rest/api/playfab/client/authentication/get-title-public-key?view=playfab-rest&preserve-view=true)
    Returns the title's base 64 encoded RSA CSP blob.

- [GetTradeStatus](/rest/api/playfab/client/trading/get-trade-status?view=playfab-rest&preserve-view=true)
    Gets the current status of an existing trade.

- [GetWindowsHelloChallenge](/gaming/playfab/features/authentication/platform-specific-authentication/uwp)
    Requests a challenge from the server to be signed by Windows Hello Passport service to authenticate.

## Data APIs

- [GetFiles](/rest/api/playfab/data/file/get-files?view=playfab-rest&preserve-view=true)
    Retrieves file metadata from an entity's profile.

## Server APIs

- [GetContentDownloadUrl](/rest/api/playfab/server/content/get-content-download-url?view=playfab-rest&preserve-view=true)
    This API retrieves a pre-signed URL for accessing a content file for the title. A subsequent HTTP GET to the returned URL will attempt to download the content. A HEAD query to the returned URL will attempt to retrieve the metadata of the content. Note that a successful result does not guarantee the existence of this content - if it has not been uploaded, the query to retrieve the data will fail. See this post for more information: https://community.playfab.com/hc/community/posts/205469488-How-to-upload-files-to-PlayFab-s-Content-Service. Also, please be aware that the Content service is specifically PlayFab's CDN offering, for which standard CDN rates apply.

- [GetTitleNews](/rest/api/playfab/server/title-wide-data-management/get-title-news?view=playfab-rest&preserve-view=true)
    Retrieves the title news feed, as configured in the developer portal.

- [SendCustomAccountRecoveryEmail](/rest/api/playfab/server/account-management/send-custom-account-recovery-email?view=playfab-rest&preserve-view=true)
    Forces an email to be sent to the registered contact email address for the user's account based on an account recovery email template.

- [SendEmailFromTemplate](/rest/api/playfab/server/account-management/send-email-from-template?view=playfab-rest&preserve-view=true)
    Sends an email based on an email template to a player's contact email.

- [SendPushNotification](/rest/api/playfab/server/account-management/send-push-notification?view=playfab-rest&preserve-view=true)
    Sends an iOS/Android Push Notification to a specific user, if that user's device has been configured for Push Notifications in PlayFab. If a user has linked both Android and iOS devices, both will be notified.

- [SendPushNotificationFromTemplate](/rest/api/playfab/server/account-management/send-push-notification-from-template?view=playfab-rest&preserve-view=true)
    Sends an iOS/Android Push Notification template to a specific user, if that user's device has been configured for Push Notifications in PlayFab. If a user has linked both Android and iOS devices, both will be notified.
