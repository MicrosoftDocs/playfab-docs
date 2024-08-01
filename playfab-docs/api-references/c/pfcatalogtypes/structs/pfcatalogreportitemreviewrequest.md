---
author: jasonsandlin
title: "PFCatalogReportItemReviewRequest"
description: "PFCatalogReportItemReviewRequest data model. Submit a report for an inappropriate review, allowing the submitting user to specify their concern."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogReportItemReviewRequest  

PFCatalogReportItemReviewRequest data model. Submit a report for an inappropriate review, allowing the submitting user to specify their concern.  

## Syntax  
  
```cpp
typedef struct PFCatalogReportItemReviewRequest {  
    PFCatalogCatalogAlternateId const* alternateId;  
    PFCatalogConcernCategory const* concernCategory;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* itemId;  
    const char* reason;  
    const char* reviewId;  
} PFCatalogReportItemReviewRequest;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) An alternate ID of the item associated with the review.
  
**`concernCategory`** &nbsp; [PFCatalogConcernCategory](../enums/pfcatalogconcerncategory.md) const*  
*may be nullptr*  
  
(Optional) The reason this review is being reported.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The entity to perform this action on.
  
**`itemId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The string ID of the item associated with the review.
  
**`reason`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The string reason for this report.
  
**`reviewId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the review to submit a report for.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
