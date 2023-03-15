---
author: jasonsandlin
title: "PFCatalogCreateUploadUrlsRequest"
description: "PFCatalogCreateUploadUrlsRequest data model. Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure Storage Blob Service REST API pattern for uploading content. The response contains upload URLs and IDs for each file. The IDs and URLs returned must be added to the item metadata and committed using the CreateDraftItem or UpdateDraftItem Item APIs."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogCreateUploadUrlsRequest  

PFCatalogCreateUploadUrlsRequest data model. Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure Storage Blob Service REST API pattern for uploading content. The response contains upload URLs and IDs for each file. The IDs and URLs returned must be added to the item metadata and committed using the CreateDraftItem or UpdateDraftItem Item APIs.  

## Syntax  
  
```cpp
typedef struct PFCatalogCreateUploadUrlsRequest {  
    uint32_t customTagsCount;  
    PFCatalogUploadInfo const* files;  
    uint32_t filesCount;  
} PFCatalogCreateUploadUrlsRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`files`** &nbsp; [PFCatalogUploadInfo](pfcataloguploadinfo.md) const*  
*array of size `filesCount`*  
  
(Optional) Description of the files to be uploaded by the client.
  
**`filesCount`** &nbsp; uint32_t  
  
Count of files
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
