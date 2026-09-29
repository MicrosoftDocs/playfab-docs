---
author: jasonsandlin
title: "PFAuthenticationAuthenticateCustomIdResult"
description: "PFAuthenticationAuthenticateCustomIdResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationAuthenticateCustomIdResult  

PFAuthenticationAuthenticateCustomIdResult data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationAuthenticateCustomIdResult {  
    const PFAuthenticationEntityTokenResponse* entityToken;  
    bool newlyCreated;  
} PFAuthenticationAuthenticateCustomIdResult;  
```
  
### Members  
  
**`entityToken`** &nbsp; const [PFAuthenticationEntityTokenResponse*](pfauthenticationentitytokenresponse.md)  
*may be nullptr*  
  
(Optional) The token generated used to set X-EntityToken for game_server calls.
  
**`newlyCreated`** &nbsp; bool  
  
True if the account was newly created on this authentication.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
