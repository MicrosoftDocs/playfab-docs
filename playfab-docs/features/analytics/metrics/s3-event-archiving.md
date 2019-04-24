---
title: S3 Event Archiving
author: v-thopra
description: Shows step-by-step how to configure PlayFab event archiving from scratch using Amazon S3 Bucket.
ms.author: v-thopra
ms.date: 10/31/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, events
ms.localizationpriority: medium
---

# S3 event archiving

PlayFab allows you to archive the entire event flow using the
 Amazon S3 bucket. This tutorial shows you step-by-step how to configure event archiving from scratch.

## Configuring Amazon S3 bucket

First, you much configure your Amazon S3 bucket. See [Configuring Amazon Access](configure-s3-bucket.md).

## Configuring PlayFab event archiving

When your Amazon S3 bucket is ready, it's time to set up the PlayFab side of things.

We need to pass the access key data and bucket name to PlayFab to enable event archiving.

To access the PlayFab **Event Archive**:

- Select **Analytics** in the menu on the left **(1)**.
- Then select the **Event Archive** tab **(2)**.
- Finally, select the **Update Settings** button **(3)**.

![Game Manager - Analytics - Event Archive](media/tutorials/game-manager-analytics-event-archive.png)  

The **Update Settings** page will offer you the following settings:

1. The **Amazon S3 bucket name** (use the one you created while configuring the **Amazon S3 Bucket**).
2. **Prefix** is the *root folder* under which PlayFab will store all the relevant data.
3. **Access key ID** (use the one you obtained while configuring access to the Amazon account).
4. **Secret key** (use the one you obtained while configuring access to the Amazon account).
5. Select the **Save Settings** button when everything is in place.

![Game Manager - Analytics - Event Archive - Update Settings](media/tutorials/game-manager-analytics-event-archive-update-settings.png)

PlayFab should present you with a nice page, indicating that event archiving is enabled.

![Game Manager - Analytics - Event Archiving Enabled](media/tutorials/game-manager-analytics-event-archiving-enabled.png)  

Make sure to post some events and then check your bucket on the Amazon portal.

After a short period of time, you should see that new compressed JSON streams are appearing, nicely broken out by title, event name, year, month and day.

![Amazon S3 - Event Bucket](media/tutorials/amazon-s3-event-bucket.png)  
