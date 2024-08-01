---
author: jasonsandlin
title: "PFTitleDataManagementTitleNewsItem"
description: "PFTitleDataManagementTitleNewsItem data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementTitleNewsItem  

PFTitleDataManagementTitleNewsItem data model.  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementTitleNewsItem {  
    const char* body;  
    const char* newsId;  
    time_t timestamp;  
    const char* title;  
} PFTitleDataManagementTitleNewsItem;  
```
  
### Members  
  
**`body`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) News item text.
  
**`newsId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique identifier of news item.
  
**`timestamp`** &nbsp; time_t  
  
Date and time when the news item was posted.
  
**`title`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Title of the news item.
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
