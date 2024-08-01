---
author: jasonsandlin
title: "PFAuthenticationLoginWithOpenIdConnectAsync"
description: "Logs in a user with an Open ID Connect JWT created by an existing relationship between a title and an Open ID Connect provider."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithOpenIdConnectAsync  

Logs in a user with an Open ID Connect JWT created by an existing relationship between a title and an Open ID Connect provider.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithOpenIdConnectAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithOpenIdConnectRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithOpenIdConnectRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithopenidconnectrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also ClientLinkOpenIdConnectAsync, ClientUnlinkOpenIdConnectAsync. When the asynchronous task is complete, call [PFAuthenticationLoginWithOpenIdConnectGetResult](pfauthenticationloginwithopenidconnectgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
