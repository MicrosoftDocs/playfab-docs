---
author: jasonsandlin
title: "PFAuthenticationLoginWithBattleNetAsync"
description: "Sign in the user with a Battle.net identity token"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAuthenticationLoginWithBattleNetAsync  

Sign in the user with a Battle.net identity token  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithBattleNetAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAuthenticationLoginWithBattleNetRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithBattleNetRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithbattlenetrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. See also ClientLinkBattleNetAccountAsync, ClientUnlinkBattleNetAccountAsync. When the asynchronous task is complete, call [PFAuthenticationLoginWithBattleNetGetResult](pfauthenticationloginwithbattlenetgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
