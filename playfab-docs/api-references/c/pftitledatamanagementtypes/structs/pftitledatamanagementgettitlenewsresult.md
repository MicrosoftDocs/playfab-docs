---
author: jasonsandlin
title: "PFTitleDataManagementGetTitleNewsResult"
description: "PFTitleDataManagementGetTitleNewsResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementGetTitleNewsResult  

PFTitleDataManagementGetTitleNewsResult data model.  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementGetTitleNewsResult {  
    PFTitleDataManagementTitleNewsItem const* news;  
    uint32_t newsCount;  
} PFTitleDataManagementGetTitleNewsResult;  
```
  
### Members  
  
**`news`** &nbsp; [PFTitleDataManagementTitleNewsItem](pftitledatamanagementtitlenewsitem.md) const*  
*may be nullptr*  
  
(Optional) Array of news items.
  
**`newsCount`** &nbsp; uint32_t  
  
Count of news
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
