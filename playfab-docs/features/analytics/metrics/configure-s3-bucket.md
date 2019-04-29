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

- Navigate to **Services (1)**.
- Select **S3 (2)**.

![Select Amazon S3](media/tutorials/select-amazon-s3.png)  

- The **S3** page contains an overview of all your buckets.
- Click the **Create bucket** button to create a new bucket.

![Amazon S3 - Create bucket](media/tutorials/amazon-s3-create-bucket.png)  
To create your new S3 bucket, you must go though a 4-step wizard:

1. Assign a unique, DNS-compliant **Bucket name** for your bucket. Remember this name, you will need it when configuring your PlayFab event archiving.
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

In order to archive events, you will need to give PlayFab access to the bucket on your behalf. This is done by means of an access key.

- Double-check that you have your newly created bucket in the list of **S3** services **(1)**.
- Select your account **Name** in the top right corner **(2)**.
- Then select **My Security Credentials (3)**.

![Amazon S3 - Open My Security Credentials](media/tutorials/amazon-s3-open-my-security-credentials.png)  

- Locate the **Access Key** list.
- Select the **Create New Access Key** button.

![Amazon S3 - Security Credentials - Open Create Access Key](media/tutorials/amazon-s3-security-credentials-open-create-access-key.png)  

- Expand the **Access Key** data **(1)**.
- Save the **Access Key ID (2)** and **Secret Access Key (3)**. You will need them when configuring your PlayFab Event archiving.
- Select the **Close** button **(4)**.

![Amazon S3 - Save Access Key data](media/tutorials/amazon-s3-security-credentials-save-access-key-data.png)  
