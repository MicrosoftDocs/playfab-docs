---
author: jasonsandlin
title: "PFAuthenticationServerLoginWithPSNGetResult"
description: "Get the result from a PFAuthenticationServerLoginWithPSNAsync call. The PFEntityHandle will always be returned, but the additional info in the PFAuthenticationLoginResult is only returned if a buffer is provided."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationServerLoginWithPSNGetResult  

Get the result from a PFAuthenticationServerLoginWithPSNAsync call. The PFEntityHandle will always be returned, but the additional info in the PFAuthenticationLoginResult is only returned if a buffer is provided.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationServerLoginWithPSNGetResult(  
    XAsyncBlock* async,  
    const PFAuthenticationEntityTokenResponse** entityTokenResponse,  
    size_t bufferSize,  
    void* buffer,  
    const PFAuthenticationLoginResult** result,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`entityTokenResponse`** &nbsp; [PFAuthenticationEntityTokenResponse**](../../pfauthenticationtypes/structs/pfauthenticationentitytokenresponse.md)  
*library-allocated output*  
  
TBD    
  
**`bufferSize`** &nbsp; size_t  
  
The size of the buffer for the result object.  
  
**`buffer`** &nbsp; void*  
*_Out_writes_bytes_to_(bufferSize,*bufferUsed)*  
  
Byte buffer used for the Login result value and its fields.  
  
**`result`** &nbsp; [PFAuthenticationLoginResult**](../../pfauthenticationtypes/structs/pfauthenticationloginresult.md)  
*optional, library-allocated output*  
  
Pointer to the LoginResult object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ENCRYPTION_KEY_MISSING, E_PF_EVALUATION_MODE_PLAYER_COUNT_EXCEEDED, E_PF_FEATURE_NOT_CONFIGURED_FOR_TITLE, E_PF_INVALID_PARAMS, E_PF_INVALID_PSN_AUTH_CODE, E_PF_INVALID_PSN_ISSUER_ID, E_PF_PLAYER_SECRET_ALREADY_CONFIGURED, E_PF_PLAYER_SECRET_NOT_CONFIGURED, E_PF_PSN_INACCESSIBLE, E_PF_PSN_NEXT_GEN_NOT_CONFIGURED_FOR_TITLE, E_PF_REQUEST_VIEW_CONSTRAINT_PARAMS_NOT_ALLOWED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
If the PFAuthenticationServerLoginWithPSNAsync call fails, entityHandle with be null. Otherwise, the handle must be closed with PFEntityCloseHandle when it is no longer needed. If returned, 'result' is a pointer within 'buffer' and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
