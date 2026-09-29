---
author: jasonsandlin
title: "PFAuthenticationServerLoginWithBattleNetAsync"
description: "Sign in the user with a Battle.net identity token"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationServerLoginWithBattleNetAsync  

Sign in the user with a Battle.net identity token  

## Syntax  
  
```cpp
HRESULT PFAuthenticationServerLoginWithBattleNetAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const char* secretKey,  
    const PFAuthenticationServerLoginWithBattleNetRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`secretKey`** &nbsp; char*  
*_In_z_*  
  
Title Secret Key used to authenticate the service request.  
  
**`request`** &nbsp; [PFAuthenticationServerLoginWithBattleNetRequest*](../../pfauthenticationtypes/structs/pfauthenticationserverloginwithbattlenetrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. See also ServerLinkBattleNetAccountAsync, ServerUnlinkBattleNetAccountAsync. When the asynchronous task is complete, call [PFAuthenticationServerLoginWithBattleNetGetResult](pfauthenticationserverloginwithbattlenetgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
