---
author: jasonsandlin
title: "PFAuthenticationEntityTokenResponse"
description: "PFAuthenticationEntityTokenResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationEntityTokenResponse  

PFAuthenticationEntityTokenResponse data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationEntityTokenResponse {  
    PFEntityKey const* entity;  
    const char* entityToken;  
    time_t const* tokenExpiration;  
} PFAuthenticationEntityTokenResponse;  
```
  
### Members  
  
**`entity`** &nbsp; PFEntityKey const*  
*may be nullptr*  
  
(Optional) The entity id and type.
  
**`entityToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The token used to set X-EntityToken for all entity based API calls.
  
**`tokenExpiration`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The time the token will expire, if it is an expiring token, in UTC.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
