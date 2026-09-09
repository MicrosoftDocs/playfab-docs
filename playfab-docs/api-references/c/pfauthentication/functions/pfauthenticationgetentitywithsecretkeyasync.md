---
author: jasonsandlin
title: "PFAuthenticationGetEntityWithSecretKeyAsync"
description: "Method to exchange a legacy AuthenticationTicket or title SecretKey for an Entity Token or to refresh a still valid Entity Token."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationGetEntityWithSecretKeyAsync  

Method to exchange a legacy AuthenticationTicket or title SecretKey for an Entity Token or to refresh a still valid Entity Token.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationGetEntityWithSecretKeyAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const char* secretKey,  
    const PFAuthenticationGetEntityRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`secretKey`** &nbsp; char*  
*_In_z_*  
  
Title Secret Key used to authenticate the service request.  
  
**`request`** &nbsp; [PFAuthenticationGetEntityRequest*](../../pfauthenticationtypes/structs/pfauthenticationgetentityrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows, Linux, and macOS. This API must be called with X-SecretKey, X-Authentication or X-EntityToken headers. The header must still be valid and cannot be expired or revoked.If successful, it will issue a new entity token and emit the 'entity_logged_in' PlayStream event. When the asynchronous task is complete, call [PFAuthenticationGetEntityWithSecretKeyGetResult](pfauthenticationgetentitywithsecretkeygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
