---
author: jasonsandlin
title: "PFCatalogModerationState"
description: "PFCatalogModerationState data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogModerationState  

PFCatalogModerationState data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogModerationState {  
    time_t const* lastModifiedDate;  
    const char* reason;  
    PFCatalogModerationStatus const* status;  
} PFCatalogModerationState;  
```
  
### Members  
  
**`lastModifiedDate`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The date and time this moderation state was last updated.
  
**`reason`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The current stated reason for the associated item being moderated.
  
**`status`** &nbsp; [PFCatalogModerationStatus](../enums/pfcatalogmoderationstatus.md) const*  
*may be nullptr*  
  
(Optional) The current moderation status for the associated item.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
