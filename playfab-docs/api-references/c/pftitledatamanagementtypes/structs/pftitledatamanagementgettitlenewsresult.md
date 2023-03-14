---
author: jasonsandlin
title: "PFTitleDataManagementGetTitleNewsResult"
description: "PFTitleDataManagementGetTitleNewsResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
*array of size `newsCount`*  
  
(Optional) Array of news items.
  
**`newsCount`** &nbsp; uint32_t  
  
Count of news
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
