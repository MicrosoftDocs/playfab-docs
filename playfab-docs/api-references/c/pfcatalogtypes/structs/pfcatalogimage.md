---
author: jasonsandlin
title: "PFCatalogImage"
description: "PFCatalogImage data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
(Optional) The client-defined tag associated with this image.
  
**`type`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The client-defined type of this image.
  
**`url`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The URL for retrieval of the image.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
