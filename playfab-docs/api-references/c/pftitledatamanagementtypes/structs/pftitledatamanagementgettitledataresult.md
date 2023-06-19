---
author: jasonsandlin
title: "PFTitleDataManagementGetTitleDataResult"
description: "PFTitleDataManagementGetTitleDataResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 05/24/2023
---

# PFTitleDataManagementGetTitleDataResult  

PFTitleDataManagementGetTitleDataResult data model.  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementGetTitleDataResult {  
    PFStringDictionaryEntry const* data;  
    uint32_t dataCount;  
} PFTitleDataManagementGetTitleDataResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) A dictionary object of key / value pairs.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFTitleDataManagementTypes.h
  
## See also  
[PFTitleDataManagementTypes members](../pftitledatamanagementtypes_members.md)  

  
  
