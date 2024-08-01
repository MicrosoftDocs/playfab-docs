---
author: jasonsandlin
title: "PFTitleDataManagementGetPublisherDataResult"
description: "PFTitleDataManagementGetPublisherDataResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementGetPublisherDataResult  

PFTitleDataManagementGetPublisherDataResult data model.  

## Syntax  
  
```cpp
typedef struct PFTitleDataManagementGetPublisherDataResult {  
    PFStringDictionaryEntry const* data;  
    uint32_t dataCount;  
} PFTitleDataManagementGetPublisherDataResult;  
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

  
  
