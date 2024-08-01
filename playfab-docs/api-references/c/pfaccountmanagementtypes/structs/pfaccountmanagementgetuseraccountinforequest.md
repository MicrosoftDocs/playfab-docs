---
author: jasonsandlin
title: "PFAccountManagementGetUserAccountInfoRequest"
description: "PFAccountManagementGetUserAccountInfoRequest data model. This API allows for access to details regarding a user in the PlayFab service, usually for purposes of customer support. Note that data returned may be Personally Identifying Information (PII), such as email address, and so care should be taken in how this data is stored and managed. Since this call will always return the relevant information for users who have accessed the title, the recommendation is to not store this data locally."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetUserAccountInfoRequest  

PFAccountManagementGetUserAccountInfoRequest data model. This API allows for access to details regarding a user in the PlayFab service, usually for purposes of customer support. Note that data returned may be Personally Identifying Information (PII), such as email address, and so care should be taken in how this data is stored and managed. Since this call will always return the relevant information for users who have accessed the title, the recommendation is to not store this data locally.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetUserAccountInfoRequest {  
    const char* playFabId;  
} PFAccountManagementGetUserAccountInfoRequest;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
