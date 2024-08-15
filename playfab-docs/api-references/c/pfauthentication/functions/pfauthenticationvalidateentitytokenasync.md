---
author: jasonsandlin
title: "PFAuthenticationValidateEntityTokenAsync"
description: "Method for a server to validate a client provided EntityToken. Only callable by the title entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationValidateEntityTokenAsync  

Method for a server to validate a client provided EntityToken. Only callable by the title entity.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationValidateEntityTokenAsync(  
    PFEntityHandle entityHandle,  
    const PFAuthenticationValidateEntityTokenRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAuthenticationValidateEntityTokenRequest*](../../pfauthenticationtypes/structs/pfauthenticationvalidateentitytokenrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Given an entity token, validates that it hasn't expired or been revoked and will return details of the owner. When the asynchronous task is complete, call [PFAuthenticationValidateEntityTokenGetResultSize](pfauthenticationvalidateentitytokengetresultsize.md) and [PFAuthenticationValidateEntityTokenGetResult](pfauthenticationvalidateentitytokengetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
