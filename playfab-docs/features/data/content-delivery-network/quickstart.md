---
title: Content Delivery Network quickstart
author: v-thopra
description: Describes the PlayFab Content Delivery Network in detail.
ms.author: v-thopra
ms.date: 01/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, data, content delivery network
ms.localizationpriority: medium
---

# Content Delivery Network quickstart

PlayFab **Content Delivery Network** (**CDN**) stores individual assets as files uniquely identified by the file name, also referred to as a *key*. This implies that you add, update, remove, and retrieve assets by key.

PlayFab CDN allows segregating assets by folders. The folder path to the asset becomes part of the *asset key*.

The following example is a valid asset key stored inside the folder named **Android**.

 `Android/Image.png`.

When the user is fetching assets, their requests are automatically routed to the nearest edge location, so content is delivered with the best possible performance.

This, however, can introduce delays into file management actions, like those found in the following examples:

- **File uploading**: Your file will be available immediately.

- **File overwriting**: The old file will appear to users for up to 24 hours until it's overwritten with the new file.

- **File deletion**: The file will continue to exist for up to 24 hours while the delete command removes it from all edge locations.

## Uploading assets

Before your users are able to fetch an asset, it must be uploaded to the CDN. This can be done in **Game Manager**:

- Select **Content** from the menu on the left **(1)**.
- Choose the **File Management** tab **(2)**.
- Then select the **Upload Files** button **(3)**.

![Game Manager - Content - File Management - Upload Files](../../data/content-delivery-network/media/tutorials/game-manager-content-file-management-upload-files.png)  

You may:

- Select multiple **Files (1)**.
- Every file selected will appear in the list **(2)**.
- Submit your files by selecting the **Upload Files** button **(3)**.

![Game Manager - Choose and Upload Files](../../data/content-delivery-network/media/tutorials/game-manager-choose-and-upload-files.png)  

- Uploaded files will appear in the list **(1)**.
- Keep in mind that you may also manage *folders*.
  - To create a folder, select the **New Folder** button **(2)**.

![Game Manager - Content - File Management - File List and New Folder](../../data/content-delivery-network/media/tutorials/game-manager-content-file-management-file-list-new-folder.png)  

- Fill in the **Folder name (1)**.
- Select the **Create Folder** button **(2)**.

![Game Manager - Create New Folder](../../data/content-delivery-network/media/tutorials/game-manager-create-new-folder.png)  

This will create a new folder in the tree. You may then select this folder, and upload the files normally.

![Game Manager - Content - File Management - Select Folder](../../data/content-delivery-network/media/tutorials/game-manager-content-file-management-select-folder.png)  

Alternatively, you may upload assets via code using the admin SDK. This is a two step process:

1. First, call [GetContentUploadUrl](xref:titleid.playfabapi.com.admin.content.getcontentuploadurl) and obtain the pre-signed URL that will authorize your upload.
2. Then, use the URL to make a **HTTP PUT** request and provide your data, and (optionally) content type.

Consider using the snippet provided below that shows how to get a pre-signed URL.

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

You may then check the result through the PlayFab Game Manager. Make sure the file is in the list.

## Fetching assets

Downloading the asset via code is identical to uploading the asset. Again, it is a two step process.

1. First, make a call to [GetContentDownloadUrl](xref:titleid.playfabapi.com.client.content.getcontentdownloadurl) and obtain a pre-signed URL that will authorize your download.
2. You then use the  pre-signed URL to make a **HTTP GET** request and fetch the data.

Consider using the snippet provided below that shows the bare bones of the process.

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

As mentioned above, CDN may involve latency in regards to file updates. During development it is sometimes useful to force fetch the latest, fresh files.

The  [GetContentDownloadUrl](xref:titleid.playfabapi.com.client.content.getcontentdownloadurl) call allows you to set the **ThruCDN** parameter to **False**. The **URL** returned will then point to non-cached fresh files.

> [!NOTE]
> Your published game client should *never* use this option!
