---
author: jasonsandlin
title: "PFAccountManagementServerUpdateAvatarUrlRequest"
description: "PFAccountManagementServerUpdateAvatarUrlRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerUpdateAvatarUrlRequest  

PFAccountManagementServerUpdateAvatarUrlRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementServerUpdateAvatarUrlRequest {  
    const char* imageUrl;  
    const char* playFabId;  
} PFAccountManagementServerUpdateAvatarUrlRequest;  
```
  
### Members  
  
**`imageUrl`** &nbsp; const char*  
*is null-terminated*  
  
URL of the avatar image. If empty, it removes the existing avatar URL.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
