---
title: Setup an Amazon S3 bucket
author: mafonten
description: Shows step-by-step how to configure an Amazon S3 bucket for PlayFab event archiving.
ms.author: mafonten
ms.date: 04/18/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, events, s3, amazon
ms.localizationpriority: medium
---

# Set up an Amazon S3 bucket for PlayFab event archiving

This topic describes how to set up an Amazon S3 bucket so that you can archive your PlayFab events to it.

## Setting up Amazon S3 bucket

Once you have created an Amazon account:

1. Navigate to **Services**.
2. Select **S3**.

![Select Amazon S3](media/tutorials/select-amazon-s3.png)  

- The **S3** page contains an overview of all your buckets.
- Select the **Create bucket** button to create a new bucket.

![Amazon S3 - Create bucket](media/tutorials/amazon-s3-create-bucket.png)  
To create your new S3 bucket, you must go though a 4-step wizard:

1. Assign a unique, DNS-compliant **Bucket name** for your bucket. Remember this name, you will need it when configuring your PlayFab event archiving.
2. When you are done, select the **Next** button.

![Amazon S3 - Create bucket - enter bucket name](media/tutorials/amazon-s3-create-bucket-enter-bucket-name.png)  

You will be offered the option of adding **Versioning**, **Logging**, and **Tags** for your **Bucket**.

1. Select the **Next** button when you are done.

![Amazon S3 - Create bucket - add versioning](media/tutorials/amazon-s3-create-bucket-add-versioning.png)  

1. During the step shown below, make sure that you have checked the **Read/Write** boxes for access to objects.
2. Select the **Next** button when you are done, as shown below.

![Amazon S3 - Create bucket - enable read/write](media/tutorials/amazon-s3-create-bucket-enable-read-write.png)  

1. In this last step, double-check your settings, and select the **Create bucket** button, as shown below.

![Amazon S3 - Create bucket - check settings](media/tutorials/amazon-s3-create-bucket-check-settings.png)  

## Configuring Amazon access

In order to archive events, you will need to give PlayFab access to the bucket on your behalf. This is done by means of an Access Key.

1. Double-check that you have your newly created bucket in the list of **S3** services.
2. Select your account **Name** in the top right corner.
3. Then select **My Security Credentials**, as shown in the drop-down menu below.

![Amazon S3 - Open My Security Credentials](media/tutorials/amazon-s3-open-my-security-credentials.png)  

- Locate the **Access Key** list.
- Select the **Create New Access Key** button.

![Amazon S3 - Security Credentials - Open Create Access Key](media/tutorials/amazon-s3-security-credentials-open-create-access-key.png)  

1. Expand the **Access Key** data.
2. Save the **Access Key ID**.
3. Save the **Secret Access Key**. You will need both keys when configuring your PlayFab Event archiving.
4. Select the **Close** button.

![Amazon S3 - Save Access Key data](media/tutorials/amazon-s3-security-credentials-save-access-key-data.png)  
