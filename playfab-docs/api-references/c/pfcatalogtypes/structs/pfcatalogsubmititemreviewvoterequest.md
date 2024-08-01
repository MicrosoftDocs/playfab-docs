---
author: jasonsandlin
title: "PFCatalogSubmitItemReviewVoteRequest"
description: "PFCatalogSubmitItemReviewVoteRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogSubmitItemReviewVoteRequest  

PFCatalogSubmitItemReviewVoteRequest data model.  

## Syntax  
  
```cpp
typedef struct PFCatalogSubmitItemReviewVoteRequest {  
    PFCatalogCatalogAlternateId const* alternateId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* itemId;  
    const char* reviewId;  
    PFCatalogHelpfulnessVote const* vote;  
} PFCatalogSubmitItemReviewVoteRequest;  
```
  
### Members  
  
**`alternateId`** &nbsp; [PFCatalogCatalogAlternateId](pfcatalogcatalogalternateid.md) const*  
*may be nullptr*  
  
(Optional) An alternate ID of the item associated with the review.
  
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
  
**`reviewId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of the review to submit a helpfulness vote for.
  
**`vote`** &nbsp; [PFCatalogHelpfulnessVote](../enums/pfcataloghelpfulnessvote.md) const*  
*may be nullptr*  
  
(Optional) The helpfulness vote of the review.
  
  
## Requirements  
  
**Header:** PFCatalogTypes.h
  
## See also  
[PFCatalogTypes members](../pfcatalogtypes_members.md)  

  
  
