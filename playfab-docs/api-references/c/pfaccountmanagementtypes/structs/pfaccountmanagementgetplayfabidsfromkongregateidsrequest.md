---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromKongregateIDsRequest"
description: "PFAccountManagementGetPlayFabIDsFromKongregateIDsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromKongregateIDsRequest  

PFAccountManagementGetPlayFabIDsFromKongregateIDsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromKongregateIDsRequest {  
    const char* const* kongregateIDs;  
    uint32_t kongregateIDsCount;  
} PFAccountManagementGetPlayFabIDsFromKongregateIDsRequest;  
```
  
### Members  
  
**`kongregateIDs`** &nbsp; const char* const*  
  
Array of unique Kongregate identifiers (Kongregate's user_id) for which the title needs to get PlayFab identifiers. The array cannot exceed 2,000 in length.
  
**`kongregateIDsCount`** &nbsp; uint32_t  
  
Count of kongregateIDs
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
