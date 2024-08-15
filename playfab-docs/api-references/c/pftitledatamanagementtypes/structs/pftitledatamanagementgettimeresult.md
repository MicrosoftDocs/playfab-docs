---
author: jasonsandlin
title: "PFTitleDataManagementGetTimeResult"
description: "PFTitleDataManagementGetTimeResult data model. Time is always returned as Coordinated Universal Time (UTC)."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementGetTimeResult  

PFTitleDataManagementGetTimeResult data model. Time is always returned as Coordinated Universal Time (UTC).  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementGetTimeResult {  
    time_t time;  
} PFTitleDataManagementGetTimeResult;  
```
  
### Members  
  
**`time`** &nbsp; time_t  
  
Current server time when the request was received, in UTC.
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
