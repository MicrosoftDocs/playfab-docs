---
title: S3 Event Archiving
author: v-thopra
description: Shows step-by-step how to configure PlayFab event archiving from scratch using Amazon S3 Bucket.
ms.author: v-thopra
ms.date: 31/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, events
ms.localizationpriority: medium
---

# S3 Event Archiving

PlayFab allows you to archive the entire event flow using Amazon S3 Bucket. This tutorial shows you step-by-step how to configure event archiving from scratch. Each step is represented as a picture followed by a description.

## Configuring Amazon S3 Bucket

![Select Amazon S3](media/tutorials/select-amazon-s3.png)  

Once you have created an Amazon account, navigate to "Services" **(1)** and select "S3" **(2)**.

![Amazon S3 - Create bucket](media/tutorials/amazon-s3-create-bucket.png)  

On the S3 page, you will have an overview of all your buckets and you will notice a button for creating a new bucket. Click it.

![Amazon S3 - Create bucket - enter bucket name](media/tutorials/amazon-s3-create-bucket-enter-bucket-name.png)  

To create your new S3 bucket, you must go though a 4-step wizard. Step 1 requires you to assign a unique, DNS-compliant name for your bucket **(1)**. Make sure to have that name available somewhere for copying and pasting. We will need it when we configure PlayFab event archiving. When you are done, hit "Next" **(2)**.

![Amazon S3 - Create bucket - add versioning](media/tutorials/amazon-s3-create-bucket-add-versioning.png)  

Step 2 offers you to **optionally** add versioning, logging, and tagging for your bucket. Click "Next" **(1)**.

![Amazon S3 - Create bucket - enable read/write](media/tutorials/amazon-s3-create-bucket-enable-read-write.png)  

During Step 3, ensure that you have Read/Write access **(1)** for objects. Hit "Next" **(2)**.  

![Amazon S3 - Create bucket - check settings](media/tutorials/amazon-s3-create-bucket-check-settings.png)  

During Step 4, double check your settings and click "Create Bucket" **(1)**.

## Configuring Amazon Access

In order to archive events, you will need to give PlayFab access to the bucket on your behalf. This is done by means of an Access Key.

![Amazon S3 - Open My Security Credentials](media/tutorials/amazon-s3-open-my-security-credentials.png)  

Double check that you have your newly created bucket in the list of S3 services **(1)**. Then click your account name in the top right corner **(2)** and select "My Security Credentials" **(3)**.

![Amazon S3 - Security Credentials - Open Create Access Key](media/tutorials/amazon-s3-security-credentials-open-create-access-key.png)  

Locate the access key list and the "Create New Access Key" button. Click it.

![Amazon S3 - Save Access Key data](media/tutorials/amazon-s3-security-credentials-save-access-key-data.png)  

Expand the Access Key data **(1)**. Save the Access Key ID **(2)** and Secret Access Key **(3)**. Make sure they are available for copy/paste. We will need them when we configure PlayFab event archiving. Hit "Close" **(4)**.

## Configuring PlayFab Event Archiving

When your Amazon S3 bucket is ready, it's time to set up the PlayFab side of things. We need to pass the access key data and bucket name to PlayFab to enable event archiving.

![Game Manager - Analytics - Event Archive](media/tutorials/game-manager-analytics-event-archive.png)  

To access the PlayFab Event Archive, select "Analytics" in the sidebar panel **(1)**. Then select the "Event Archive" tab **(2)**. Finally, click the "Update Settings" button **(3)**.

![Game Manager - Analytics - Event Archive - Update Settings](media/tutorials/game-manager-analytics-event-archive-update-settings.png)

The Update Settings page will offer you the following settings:

1. Amazon S3 **bucket name** (use the one you created while configuring the Amazon S3 Bucket).
2. Prefix is the **root folder** under which PlayFab will store all the relevant data.
3. **Access Key ID** (use the one you obtained while configuring access to the Amazon Account).
4. **Secret Key** (use the one you obtained while configuring access to the Amazon Account).
5. Click "**Save Settings**" when everything is in place.

![Game Manager - Analytics - Event Archiving Enabled](media/tutorials/game-manager-analytics-event-archiving-enabled.png)  

PlayFab should present you with a nice page indicating that Event Archiving is enabled.

![Amazon S3 - Event Bucket](media/tutorials/amazon-s3-event-bucket.png)  

Make sure to post some events and then check your bucket on the Amazon portal. Soon enough, you will see that new compressed JSON streams will appear, nicely split by title, event name, year, month and day.
