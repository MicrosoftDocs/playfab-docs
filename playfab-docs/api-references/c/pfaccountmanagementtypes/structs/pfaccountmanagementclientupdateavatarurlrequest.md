---
author: jasonsandlin
title: "PFAccountManagementClientUpdateAvatarUrlRequest"
description: "PFAccountManagementClientUpdateAvatarUrlRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFAccountManagementClientUpdateAvatarUrlRequest  

PFAccountManagementClientUpdateAvatarUrlRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementClientUpdateAvatarUrlRequest {  
    const char* imageUrl;  
} PFAccountManagementClientUpdateAvatarUrlRequest;  
```
  
### Members  
  
**`imageUrl`** &nbsp; const char*  
*is null-terminated*  
  
URL of the avatar image. If empty, it removes the existing avatar URL.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
