---
author: jasonsandlin
title: "PFAccountManagementReportPlayerClientResult"
description: "PFAccountManagementReportPlayerClientResult data model. Players are currently limited to five reports per day. Attempts by a single user account to submit reports beyond five will result in Updated being returned as false."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementReportPlayerClientResult  

PFAccountManagementReportPlayerClientResult data model. Players are currently limited to five reports per day. Attempts by a single user account to submit reports beyond five will result in Updated being returned as false.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementReportPlayerClientResult {  
    int32_t submissionsRemaining;  
} PFAccountManagementReportPlayerClientResult;  
```
  
### Members  
  
**`submissionsRemaining`** &nbsp; int32_t  
  
The number of remaining reports which may be filed today.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
