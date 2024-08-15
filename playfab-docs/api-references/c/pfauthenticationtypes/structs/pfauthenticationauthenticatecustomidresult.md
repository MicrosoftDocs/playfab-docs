---
author: jasonsandlin
title: "PFAuthenticationAuthenticateCustomIdResult"
description: "PFAuthenticationAuthenticateCustomIdResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationAuthenticateCustomIdResult  

PFAuthenticationAuthenticateCustomIdResult data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationAuthenticateCustomIdResult {  
    PFAuthenticationEntityTokenResponse const* entityToken;  
    bool newlyCreated;  
} PFAuthenticationAuthenticateCustomIdResult;  
```
  
### Members  
  
**`entityToken`** &nbsp; [PFAuthenticationEntityTokenResponse](pfauthenticationentitytokenresponse.md) const*  
*may be nullptr*  
  
(Optional) The token generated used to set X-EntityToken for game_server calls.
  
**`newlyCreated`** &nbsp; bool  
  
True if the account was newly created on this authentication.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
