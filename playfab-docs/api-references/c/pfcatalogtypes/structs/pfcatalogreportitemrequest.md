---
author: jasonsandlin
title: "PFCatalogReportItemRequest"
description: "PFCatalogReportItemRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogReportItemRequest  

PFCatalogReportItemRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogReportItemRequest {  
    PFCatalogCatalogAlternateId const* alternateId;  
    PFCatalogConcernCategory const* concernCategory;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* id;  
    const char* reason;  
} PFCatalogReportItemRequest;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) An alternate ID associated with this item.
  
**`concernCategory`** &nbsp; [PFCatalogConcernCategory](../enums/pfcatalogconcerncategory.md) const*  
*may be nullptr*  
  
(Optional) Category of concern for this report.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`id`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The unique ID of the item.
  
**`reason`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The string reason for this report.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
