---
author: jasonsandlin
title: "PFAuthenticationLoginWithNintendoServiceAccountAsync"
description: "Signs in the user with a Nintendo service account token."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginWithNintendoServiceAccountAsync  

Signs in the user with a Nintendo service account token.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithNintendoServiceAccountAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithNintendoServiceAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithNintendoServiceAccountRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithnintendoserviceaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Nintendo Switch. See also ClientLinkNintendoServiceAccountAsync, ClientUnlinkNintendoServiceAccountAsync. When the asynchronous task is complete, call [PFAuthenticationLoginWithNintendoServiceAccountGetResult](pfauthenticationloginwithnintendoserviceaccountgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
