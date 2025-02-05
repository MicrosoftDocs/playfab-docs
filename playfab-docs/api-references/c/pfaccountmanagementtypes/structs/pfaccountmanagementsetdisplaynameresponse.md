---
author: jasonsandlin
title: "PFAccountManagementSetDisplayNameResponse"
description: "PFAccountManagementSetDisplayNameResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFAccountManagementSetDisplayNameResponse  

PFAccountManagementSetDisplayNameResponse data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementSetDisplayNameResponse {  
    PFOperationTypes const* operationResult;  
    int32_t const* versionNumber;  
} PFAccountManagementSetDisplayNameResponse;  
```
  
### Members  
  
**`operationResult`** &nbsp; [PFOperationTypes](../../pftypes/enums/pfoperationtypes.md) const*  
*may be nullptr*  
  
(Optional) The type of operation that occured on the profile's display name.
  
**`versionNumber`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The updated version of the profile after the display name update.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
