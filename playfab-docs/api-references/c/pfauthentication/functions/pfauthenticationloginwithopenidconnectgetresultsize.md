---
author: jasonsandlin
title: "PFAuthenticationLoginWithOpenIdConnectGetResultSize"
description: "Get the size in bytes needed to store the result of a PFAuthenticationLoginWithOpenIdConnectAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithOpenIdConnectGetResultSize  

Get the size in bytes needed to store the result of a PFAuthenticationLoginWithOpenIdConnectAsync call.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithOpenIdConnectGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ENCRYPTION_KEY_MISSING, E_PF_EVALUATION_MODE_PLAYER_COUNT_EXCEEDED, E_PF_INVALID_IDENTITY_PROVIDER_ID, E_PF_INVALID_SIGNATURE, E_PF_INVALID_SIGNATURE_TIME, E_PF_PLAYER_SECRET_ALREADY_CONFIGURED, E_PF_PLAYER_SECRET_NOT_CONFIGURED, E_PF_REQUEST_VIEW_CONSTRAINT_PARAMS_NOT_ALLOWED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
