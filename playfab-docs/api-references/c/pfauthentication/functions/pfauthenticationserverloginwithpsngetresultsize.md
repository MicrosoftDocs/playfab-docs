---
author: jasonsandlin
title: "PFAuthenticationServerLoginWithPSNGetResultSize"
description: "Get the size in bytes needed to store the result of a PFAuthenticationServerLoginWithPSNAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationServerLoginWithPSNGetResultSize  

Get the size in bytes needed to store the result of a PFAuthenticationServerLoginWithPSNAsync call.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationServerLoginWithPSNGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ENCRYPTION_KEY_MISSING, E_PF_EVALUATION_MODE_PLAYER_COUNT_EXCEEDED, E_PF_FEATURE_NOT_CONFIGURED_FOR_TITLE, E_PF_INVALID_PARAMS, E_PF_INVALID_PSN_AUTH_CODE, E_PF_INVALID_PSN_ISSUER_ID, E_PF_PLAYER_SECRET_ALREADY_CONFIGURED, E_PF_PLAYER_SECRET_NOT_CONFIGURED, E_PF_PSN_INACCESSIBLE, E_PF_PSN_NEXT_GEN_NOT_CONFIGURED_FOR_TITLE, E_PF_REQUEST_VIEW_CONSTRAINT_PARAMS_NOT_ALLOWED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
