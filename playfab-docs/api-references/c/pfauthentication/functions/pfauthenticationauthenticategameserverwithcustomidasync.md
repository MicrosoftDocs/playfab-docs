---
author: jasonsandlin
title: "PFAuthenticationAuthenticateGameServerWithCustomIdAsync"
description: "Create a game_server entity token and return a new or existing game_server entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationAuthenticateGameServerWithCustomIdAsync  

Create a game_server entity token and return a new or existing game_server entity.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationAuthenticateGameServerWithCustomIdAsync(  
    PFEntityHandle entityHandle,  
    const PFAuthenticationAuthenticateCustomIdRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAuthenticationAuthenticateCustomIdRequest*](../../pfauthenticationtypes/structs/pfauthenticationauthenticatecustomidrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Create or return a game_server entity token. Caller must be a title entity. When the asynchronous task is complete, call [PFAuthenticationAuthenticateGameServerWithCustomIdGetResultSize](pfauthenticationauthenticategameserverwithcustomidgetresultsize.md) and [PFAuthenticationAuthenticateGameServerWithCustomIdGetResult](pfauthenticationauthenticategameserverwithcustomidgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
