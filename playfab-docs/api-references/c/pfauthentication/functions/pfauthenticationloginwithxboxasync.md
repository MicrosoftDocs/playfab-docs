---
author: jasonsandlin
title: "PFAuthenticationLoginWithXboxAsync"
description: "Signs the user in using a XBOX Live Token, returning a session identifier that can subsequently be used for API calls which require an authenticated user. If possible, PFAuthenticationLoginWithXUserAsync should be preferred, as it will more seamlessly handle automatic token refresh."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationLoginWithXboxAsync  

Signs the user in using a XBOX Live Token, returning a session identifier that can subsequently be used for API calls which require an authenticated user. If possible, PFAuthenticationLoginWithXUserAsync should be preferred, as it will more seamlessly handle automatic token refresh.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithXboxAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithXboxRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithXboxRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithxboxrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFAuthenticationLoginWithXboxGetResult](pfauthenticationloginwithxboxgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
