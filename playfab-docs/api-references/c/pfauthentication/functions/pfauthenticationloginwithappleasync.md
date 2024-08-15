---
author: jasonsandlin
title: "PFAuthenticationLoginWithAppleAsync"
description: "Signs in the user with a Sign in with Apple identity token."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithAppleAsync  

Signs in the user with a Sign in with Apple identity token.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithAppleAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithAppleRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithAppleRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithapplerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on iOS and macOS. See also ClientLinkAppleAsync, ClientUnlinkAppleAsync. When the asynchronous task is complete, call [PFAuthenticationLoginWithAppleGetResult](pfauthenticationloginwithapplegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
