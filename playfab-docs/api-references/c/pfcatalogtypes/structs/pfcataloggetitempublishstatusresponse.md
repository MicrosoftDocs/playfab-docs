---
author: jasonsandlin
title: "PFCatalogGetItemPublishStatusResponse"
description: "PFCatalogGetItemPublishStatusResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemPublishStatusResponse  

PFCatalogGetItemPublishStatusResponse data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogGetItemPublishStatusResponse {  
    PFCatalogPublishResult const* result;  
    const char* statusMessage;  
} PFCatalogGetItemPublishStatusResponse;  
```
  
### Members  
  
**`result`** &nbsp; [PFCatalogPublishResult](../enums/pfcatalogpublishresult.md) const*  
*may be nullptr*  
  
(Optional) High level status of the published item.
  
**`statusMessage`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Descriptive message about the current status of the publish.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
