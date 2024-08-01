---
author: jasonsandlin
title: "PFPlayerDataManagementUpdateUserDataResult"
description: "PFPlayerDataManagementUpdateUserDataResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerDataManagementUpdateUserDataResult  

PFPlayerDataManagementUpdateUserDataResult data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementUpdateUserDataResult {  
    uint32_t dataVersion;  
} PFPlayerDataManagementUpdateUserDataResult;  
```
  
### Members  
  
**`dataVersion`** &nbsp; uint32_t  
  
Indicates the current version of the data that has been set. This is incremented with every set call for that type of data (read-only, internal, etc). This version can be provided in Get calls to find updated data.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
