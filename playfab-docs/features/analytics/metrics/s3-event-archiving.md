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
 **Amazon S3** bucket. This tutorial shows you step-by-step how to configure event archiving from scratch.

## Configuring Amazon S3 bucket

Once you have created an **Amazon** account:

- Navigate to **Services (1)**.
- Select **S3 (2)**.

![Select Amazon S3](media/tutorials/select-amazon-s3.png)  

- On the **S3** page, you will have an overview of all your buckets.
- Notice the **Create bucket** button?  Use it to create a new bucket by selecting it.

![Amazon S3 - Create bucket](media/tutorials/amazon-s3-create-bucket.png)  
To create your new S3 bucket, you must go though a 4-step wizard:

1. You must assign a unique, **DNS**-compliant **Bucket name** for your bucket. Make sure to have that name available somewhere for copying and pasting. We will need it when we configure PlayFab event archiving.
2. When you are done, select the **Next** button.

![Amazon S3 - Create bucket - enter bucket name](media/tutorials/amazon-s3-create-bucket-enter-bucket-name.png)  

- This step offers you the option of adding **Versioning**, **Logging**, and **Tags** for your **Bucket**.
- Select the **Next** button when you are done **(1)**.

![Amazon S3 - Create bucket - add versioning](media/tutorials/amazon-s3-create-bucket-add-versioning.png)  

- During this step, make sure that you have **Read/Write** access **(1)** for objects.
 - Select the **Next** button **(2)** when you are done.

![Amazon S3 - Create bucket - enable read/write](media/tutorials/amazon-s3-create-bucket-enable-read-write.png)  

In this last step, double-check your settings and select the **Create bucket** button **(1)**.

![Amazon S3 - Create bucket - check settings](media/tutorials/amazon-s3-create-bucket-check-settings.png)  

## Configuring Amazon access

In order to archive events, you will need to give PlayFab access to the bucket on your behalf.

This is done by means of an access key.

- Double-check that you have your newly created bucket in the list of **S3** services **(1)**.
- Select your account **Name** in the top right corner **(2)**.
- Then select **My Security Credentials (3)**.

![Amazon S3 - Open My Security Credentials](media/tutorials/amazon-s3-open-my-security-credentials.png)  

- Locate the **Access Key** list.
- Select the **Create New Access Key** button.

![Amazon S3 - Security Credentials - Open Create Access Key](media/tutorials/amazon-s3-security-credentials-open-create-access-key.png)  

- Expand the **Access Key** data **(1)**.
- Save the **Access Key ID (2)** and **Secret Access Key (3)**.
- Make sure they are available for copy/paste. We will need them when we configure **PlayFab Event** archiving.
- Select the **Close** button **(4)**.

![Amazon S3 - Save Access Key data](media/tutorials/amazon-s3-security-credentials-save-access-key-data.png)  

## Configuring PlayFab event archiving

When your **Amazon S3** bucket is ready, it's time to set up the PlayFab side of things.

We need to pass the access key data and bucket name to PlayFab to enable event archiving.

To access the PlayFab **Event Archive**:

- Select **Analytics** in the menu on the left **(1)**.
- Then select the **Event Archive** tab **(2)**.
- Finally, select the **Update Settings** button **(3)**.

![Game Manager - Analytics - Event Archive](media/tutorials/game-manager-analytics-event-archive.png)  

The **Update Settings** page will offer you the following settings:

1. The **Amazon S3 bucket name** (use the one you created while configuring the **Amazon S3 Bucket**).
2. **Prefix** is the *root folder* under which PlayFab will store all the relevant data.
3. **Access key ID** (use the one you obtained while configuring access to the **Amazon Account**).
4. **Secret Key** (use the one you obtained while configuring access to the **Amazon** account).
5. Select the **Save Settings** button when everything is in place.

![Game Manager - Analytics - Event Archive - Update Settings](media/tutorials/game-manager-analytics-event-archive-update-settings.png)

PlayFab should present you with a nice page indicating that event archiving is enabled.

![Game Manager - Analytics - Event Archiving Enabled](media/tutorials/game-manager-analytics-event-archiving-enabled.png)  

Make sure to post some events and then check your bucket on the **Amazon** portal.

After a short period of time, you should see that new compressed **JSON** streams are appearing, nicely broken out by title, event name, year, month and day.

![Amazon S3 - Event Bucket](media/tutorials/amazon-s3-event-bucket.png)  
