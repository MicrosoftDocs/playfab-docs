---
title: Chapter 4 - Try out Content Management
author: v-thopra
description: Chapter 4 of a four-part Getting Started tutorial for PlayFab that covers Content Management.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, config, content management, cdn
ms.localizationpriority: medium
---

# Chapter 4 - Try out Content Management

Welcome to Chapter 4 of our tutorial [Getting Started with PlayFab](getting-started-with-playfab.md), the tutorial contains the following Chapters:

- [Chapter 1 - Getting started with Players and Tournaments](get-started-with-players-and-tournaments.md)
- [Chapter 2 - Setting up your game's in-game economy](set-up-your-games-in-game-economy.md)
- [Chapter 3 - Exploring automation](explore-automation.md)
- **Chapter 4 - Trying out Content Management**

## Overview

Chapter 4 contains the following sections to help you try out **Content Management**:

[CDN](#cdn)
[Uploading assets](#uploading-assets)
[Fetching Assets](#fetching-assets)

## CDN

**CDN** stands for **Content Delivery Network** - an infrastructure to deliver **Assets** (images, audio, binary content, etc) to the **End User** that focuses on speed and availability.

**CDN** costs are independent from your tier (**Essentials**, **Professional**, etc.) and require a **Payment Account** to be set up with **PlayFab**.

This can be done by entering your credit card information in the **Admin**->**Billing** tab of your **Title**.

**CDN** costs are based on your usage - see the **Content**->**File Management** tab for more information on this. Please contact our [developer forum](https://community.playfab.com/) with questions.

**PlayFab CDN** stores individual **Assets** as files uniquely identified by the **File Name**, also referred to as a **Key**. This implies that you add, update, remove, and retrieve **Assets** by **Key**.

**PlayFab CDN** allows segregating **Assets** by **Folders**. The **Folder** path to the **Asset** becomes part of the **Asset Key**.

The following is a valid **Asset Key** stored inside the **Folder** named **Android**:

`Android/Image.png`.

When the **User** is fetching **Assets**, their requests are automatically routed to the nearest edge location, so content is delivered with the best possible performance. This, however, can introduce delays into file management actions, like the following:

- **File uploading**: Your file will be available immediately.

- **File overwriting**: The old file will appear to users for up to *24 hours* until it's overwritten with the new file.

- **File deletion**: The file will continue to exist for up to *24 hours* while the delete command removes it from all edge locations.

## Uploading assets

Before your **Users** are able to fetch an **Asset**, it must be uploaded to the **CDN**. This can be done using **Game Manager**:

- Select **Content** from the menu to the left **(1)**.
- Select the **File Management** tab **(2)**.
- Select the **Upload Files** button **(3)**:

![Game Manager - Content - File Management - Upload Files](media/tutorials/game-manager-content-file-management-upload-files.png)  

- You may select multiple **Files (1)**.
- Every **File** selected will appear in the list **(2)**.
- Submit your **Files** by selecting the **Upload Files** button **(3)**.

![Game Manager - Choose and Upload Files](media/tutorials/game-manager-choose-and-upload-files.png)  

- Uploaded **Files** will appear in the list **(1)**. Keep in mind that you may also manage **Folders**:
  - To create a **Folder**, select the **New Folder** button **(2)**.

![Game Manager - Content - File Management - File List and New Folder](media/tutorials/game-manager-content-file-management-file-list-new-folder.png)  

- Fill in the **Folder Name (1)**.
- Select the **Create Folder** button **(2)**.

![Game Manager - Create New Folder](media/tutorials/game-manager-create-new-folder.png)  

This will create a new **Folder** in the tree. You may then select this **Folder** and upload the files normally.

![Game Manager - Content - File Management - Select Folder](media/tutorials/game-manager-content-file-management-select-folder.png)  

Alternatively, you may upload **Assets** via code using the **Admin SDK**. This is a two-step process:

1. Call [GetContentUploadUrl](xref:titleid.playfabapi.com.admin.content.getcontentuploadurl) and obtain the pre-signed **URL** that will authorize your upload.
2. Then, use the **URL** to make a **HTTP PUT** request and provide your data, and (optionally) content type. Consider the snippet shown below that shows how to get a pre-signed **URL**.

```csharp
public void UploadFileToCDN(string key, byte[] content, string contentType = "binary/octet-stream") {
    GetUploadUrl(key, contentType, presignedUrl => {
        PutFile(presignedUrl, content, contentType);
    });
}

void GetUploadUrl(string key, string contentType, Action<string> onComplete) {
    PlayFabAdminAPI.GetContentUploadUrl(new GetContentUploadUrlRequest() {
        ContentType = contentType,
        Key = key
    }, result => onComplete(result.URL), 
    error => Debug.LogError(error.GenerateErrorReport()));
}

void PutFile(string presignedUrl, byte[] content, string contentType = "binary/octet-stream") {
    // Implement your own PUT HTTP request here.
    // - Must use PUT method
    // - Must set content type Header
}
```

You may then check the result through the **PlayFab Game Manager** and make sure the **File** is in the list.

## Fetching Assets

Downloading the **Asset** via code is identical to uploading it.  Again, it is a two-step process:

1. Make a call to [GetContentDownloadUrl](xref:titleid.playfabapi.com.client.content.getcontentdownloadurl) and obtain a pre-signed **URL** that will authorize your download. You then use the  pre-signed **URL** to make a **HTTP GET** request and fetch the data. Consider the snippet shown below that shows the bare bones of the process.

```csharp
public void DownloadFileFromCDN(string key) {
    GetDownloadUrl(key, presignedUrl =>
    {
        GetFile(presignedUrl);
    });
}

void GetDownloadUrl(string key, Action<string> onComplete) {
    PlayFabClientAPI.GetContentDownloadUrl(new GetContentDownloadUrlRequest() {
        Key = key,
        ThruCDN = true
    }, result => onComplete(result.URL), 
    error => Debug.LogError(error.GenerateErrorReport()));
}

void GetFile(string preauthorizedUrl) {
    // Implement your own GET HTTP request here.
}
```

As mentioned above, **CDN** may involve latency in regards to **File** updates.

 During development, it is sometimes useful to force-fetch the latest, fresh files. The  [GetContentDownloadUrl](xref:titleid.playfabapi.com.client.content.getcontentdownloadurl) call allows you to set the **ThruCDN** parameter to **False**.

The **URL** returned will *then* point to non-cached fresh files. (Your published **Game Client** should *never* use this option!)
