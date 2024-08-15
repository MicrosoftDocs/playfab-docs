---
author: jasonsandlin
title: "PFCatalogImage"
description: "PFCatalogImage data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogImage  

PFCatalogImage data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogImage {  
    const char* id;  
    const char* tag;  
    const char* type;  
    const char* url;  
} PFCatalogImage;  
```
  
### Members  
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The image unique ID.
  
**`tag`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The client-defined tag associated with this image. Tags must be defined in the Catalog Config before being used in images.
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Images can be defined as either a "thumbnail" or "screenshot". There can only be one "thumbnail" image per item.
  
**`url`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The URL for retrieval of the image.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
