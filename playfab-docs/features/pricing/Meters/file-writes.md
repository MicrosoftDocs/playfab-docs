---
title: Content & Configuration Writes Meter API Description
author: joannaleecy
description: This file details the APIs that cause file writes meter to increment.
ms.author: joanlee
ms.date: 11/04/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Content & Configuration Writes

Content & Configuration files include the following items: entity files, actions, rules, scheduled tasks, matchmaking, push notifications, emails, and title news. Content & Configuration files are a set of key/value pairs that are primarily used to manage configuration for your game remotely.

The following APIs cause the Content & Configuration writes meter to increment.

## Admin APIs

- [AddLocalizedNews](/rest/api/playfab/admin/title-wide-data-management/add-localized-news?view=playfab-rest&preserve-view=true)
  Update news item to include localized version

- [AddNews](/rest/api/playfab/admin/title-wide-data-management/add-news?view=playfab-rest&preserve-view=true)
   Adds a new news item to the title's news feed

- [DeleteContent](/rest/api/playfab/admin/content/delete-content?view=playfab-rest&preserve-view=true)
  Delete a content file from the title. When deleting a file that does not exist, it returns success.

-[ResetPassword](/rest/api/playfab/admin/account-management/reset-password?view=playfab-rest&preserve-view=true)
    Reset a player's password for a given title.

- [SetupPushNotification](/rest/api/playfab/admin/title-wide-data-management/setup-push-notification?view=playfab-rest&preserve-view=true)
  Sets the Amazon Resource Name (ARN) for iOS and Android push notifications. Documentation on the exact restrictions can be found at: http://docs.aws.amazon.com/sns/latest/api/API_CreatePlatformApplication.html. Currently, Amazon device Messaging is not supported.

- [UpdatePolicy](/rest/api/playfab/admin/authentication/update-policy?view=playfab-rest&preserve-view=true)
    Changes a policy for a title

## Data APIs

- [FinalizeFileUploads](/rest/api/playfab/data/file/finalize-file-uploads?view=playfab-rest&preserve-view=true)
  Finalize file uploads to an entity's profile.

- [DeleteFiles](/rest/api/playfab/data/file/delete-files?view=playfab-rest&preserve-view=true)
  Delete files on an entity's profile.

- [InitiateFileUploads](/rest/api/playfab/data/file/initiate-file-uploads?view=playfab-rest&preserve-view=true)
  Initiates file uploads to an entity's profile.

## Server APIs

- [DeletePushNotificationTemplate](/rest/api/playfab/server/account-management/delete-push-notification-template?view=playfab-rest&preserve-view=true)
   Deletes push notification template for title

- [SavePushNotificationTemplate](/rest/api/playfab/server/account-management/save-push-notification-template?view=playfab-res&preserve-view=true)
   Saves push notification template for title
