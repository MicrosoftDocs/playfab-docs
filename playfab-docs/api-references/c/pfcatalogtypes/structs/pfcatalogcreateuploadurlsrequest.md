---
author: jasonsandlin
title: "PFCatalogCreateUploadUrlsRequest"
description: "PFCatalogCreateUploadUrlsRequest data model. Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure Storage Blob Service REST API pattern for uploading content. The response contains upload URLs and IDs for each file. The IDs and URLs returned must be added to the item metadata and committed using the CreateDraftItem or UpdateDraftItem Item APIs."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCreateUploadUrlsRequest  

PFCatalogCreateUploadUrlsRequest data model. Upload URLs point to Azure Blobs; clients must follow the Microsoft Azure Storage Blob Service REST API pattern for uploading content. The response contains upload URLs and IDs for each file. The IDs and URLs returned must be added to the item metadata and committed using the CreateDraftItem or UpdateDraftItem Item APIs.  

## Syntax  
  
```cpp
typedef struct PFCatalogCreateUploadUrlsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFCatalogUploadInfo const* files;  
    uint32_t filesCount;  
} PFCatalogCreateUploadUrlsRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`files`** &nbsp; [PFCatalogUploadInfo](pfcataloguploadinfo.md) const*  
*may be nullptr*  
  
(Optional) Description of the files to be uploaded by the client.
  
**`filesCount`** &nbsp; uint32_t  
  
Count of files
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
