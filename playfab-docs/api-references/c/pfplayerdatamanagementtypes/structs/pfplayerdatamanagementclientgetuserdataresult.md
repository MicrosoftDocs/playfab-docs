---
author: jasonsandlin
title: "PFPlayerDataManagementClientGetUserDataResult"
description: "PFPlayerDataManagementClientGetUserDataResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFPlayerDataManagementClientGetUserDataResult  

PFPlayerDataManagementClientGetUserDataResult data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementClientGetUserDataResult {  
    uint32_t dataCount;  
    uint32_t dataVersion;  
} PFPlayerDataManagementClientGetUserDataResult;  
```
  
### Members  
  
**`dataCount`** &nbsp; uint32_t  
*array of size `dataCount`*  
  
(Optional) User specific data for this title.
  
**`dataVersion`** &nbsp; uint32_t  
  
Indicates the current version of the data that has been set. This is incremented with every set call for that type of data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
