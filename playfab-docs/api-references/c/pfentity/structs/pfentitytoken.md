---
author: jasonsandlin
title: "PFEntityToken"
description: "PlayFab EntityToken and its expiration time. Used to authenticate PlayFab service calls."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityToken  

PlayFab EntityToken and its expiration time. Used to authenticate PlayFab service calls.  

## Syntax  
  
```cpp
typedef struct PFEntityToken {  
    const char* token;  
    time_t const* expiration;  
} PFEntityToken;  
```
  
### Members  
  
**`token`** &nbsp; const char*  
  
The token used to set X-EntityToken for all entity based API calls.
  
**`expiration`** &nbsp; time_t const*  
  
(Optional) The time the token will expire, if it is an expiring token, in UTC.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
