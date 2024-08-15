---
author: jasonsandlin
title: "PFCatalogUploadUrlMetadata"
description: "PFCatalogUploadUrlMetadata data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogUploadUrlMetadata  

PFCatalogUploadUrlMetadata data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogUploadUrlMetadata {  
    const char* fileName;  
    const char* id;  
    const char* url;  
} PFCatalogUploadUrlMetadata;  
```
  
### Members  
  
**`fileName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the file for which this upload URL was requested.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique ID for the binary content to be uploaded to the target URL.
  
**`url`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) URL for the binary content to be uploaded to.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
