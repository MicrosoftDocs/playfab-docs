---
author: jasonsandlin
title: "PFTitleDataManagementGetTitleNewsRequest"
description: "PFTitleDataManagementGetTitleNewsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementGetTitleNewsRequest  

PFTitleDataManagementGetTitleNewsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementGetTitleNewsRequest {  
    int32_t const* count;  
} PFTitleDataManagementGetTitleNewsRequest;  
```
  
### Members  
  
**`count`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Limits the results to the last n entries. Defaults to 10 if not set.
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
