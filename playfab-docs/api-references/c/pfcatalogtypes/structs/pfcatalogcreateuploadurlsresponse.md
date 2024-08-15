---
author: jasonsandlin
title: "PFCatalogCreateUploadUrlsResponse"
description: "PFCatalogCreateUploadUrlsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCreateUploadUrlsResponse  

PFCatalogCreateUploadUrlsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogCreateUploadUrlsResponse {  
    PFCatalogUploadUrlMetadata const* uploadUrls;  
    uint32_t uploadUrlsCount;  
} PFCatalogCreateUploadUrlsResponse;  
```
  
### Members  
  
**`uploadUrls`** &nbsp; [PFCatalogUploadUrlMetadata](pfcataloguploadurlmetadata.md) const*  
*may be nullptr*  
  
(Optional) List of URLs metadata for the files to be uploaded by the client.
  
**`uploadUrlsCount`** &nbsp; uint32_t  
  
Count of uploadUrls
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
