---
author: jasonsandlin
title: "PFLinkedPlatformAccountModel"
description: "PFLinkedPlatformAccountModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFLinkedPlatformAccountModel  

PFLinkedPlatformAccountModel data model.  

## Syntax  
  
```cpp
typedef struct PFLinkedPlatformAccountModel {  
    const char* email;  
    PFLoginIdentityProvider const* platform;  
    const char* platformUserId;  
    const char* username;  
} PFLinkedPlatformAccountModel;  
```
  
### Members  
  
**`email`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Linked account email of the user on the platform, if available.
  
**`platform`** &nbsp; [PFLoginIdentityProvider](../enums/pfloginidentityprovider.md) const*  
*may be nullptr*  
  
(Optional) Authentication platform.
  
**`platformUserId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique account identifier of the user on the platform.
  
**`username`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Linked account username of the user on the platform, if available.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
