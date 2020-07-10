---
title: Content & Configuration Writes Meter API Description
author: vDonGlover
description: This file details the APIs that cause file writes meter to increment.
ms.author: v-doglo
ms.date: 11/04/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Content & Configuration Writes

Content & Configuration files include the following items: entity files, actions, rules, scheduled tasks, matchmaking, push notifications, emails, and title news. Content & Configuration files are a set of key/value pairs that are primarily used to manage configuration for your game remotely.

The following APIs cause the Content & Configuration writes meter to increment.

## Admin APIs

- [AddLocalizedNews](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addlocalizednews?view=playfab-rest)
  Update news item to include localized version

- [AddNews](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/addnews?view=playfab-rest)
   Adds a new news item to the title's news feed

- [DeleteContent](https://docs.microsoft.com/rest/api/playfab/admin/content/deletecontent?view=playfab-rest)
  Delete a content file from the title. When deleting a file that does not exist, it returns success.

-[ModifyMatchmakerGameModes](https://docs.microsoft.com/en-us/rest/api/playfab/admin/matchmaking/modifymatchmakergamemodes?view=playfab-rest)
    Updates the game server mode details for the specified game server executable

-[ResetPassword](https://docs.microsoft.com/en-us/rest/api/playfab/admin/account-management/resetpassword?view=playfab-rest)
    Reset a player's password for a given title.

- [SetupPushNotification](https://docs.microsoft.com/rest/api/playfab/admin/title-wide-data-management/setuppushnotification?view=playfab-rest)
  Sets the Amazon Resource Name (ARN) for iOS and Android push notifications. Documentation on the exact restrictions can be found at: http://docs.aws.amazon.com/sns/latest/api/API_CreatePlatformApplication.html. Currently, Amazon device Messaging is not supported.

## Data APIs

- [FinalizeFileUploads](https://docs.microsoft.com/rest/api/playfab/data/file/finalizefileuploads?view=playfab-rest)
  Finalize file uploads to an entity's profile.

- [DeleteFiles](https://docs.microsoft.com/rest/api/playfab/data/file/deletefiles?view=playfab-rest)
  Delete files on an entity's profile.

- [InitiateFileUploads](https://docs.microsoft.com/rest/api/playfab/data/file/initiatefileuploads?view=playfab-rest)
  Initiates file uploads to an entity's profile.

## Server APIs

- [DeletePushNotificationTemplate](https://docs.microsoft.com/rest/api/playfab/server/account-management/deletepushnotificationtemplate?view=playfab-rest)
   Deletes push notification template for title

- [SavePushNotificationTemplate](https://docs.microsoft.com/rest/api/playfab/server/account-management/savepushnotificationtemplate?view=playfab-rest)
   Saves push notification template for title
