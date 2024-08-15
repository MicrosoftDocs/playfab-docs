---
author: jasonsandlin
title: "PFAuthenticationDeleteAsync"
description: "Delete a game_server entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationDeleteAsync  

Delete a game_server entity.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationDeleteAsync(  
    PFEntityHandle entityHandle,  
    const PFAuthenticationDeleteRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAuthenticationDeleteRequest*](../../pfauthenticationtypes/structs/pfauthenticationdeleterequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Delete a game_server entity. The caller can be the game_server entity attempting to delete itself. Or a title entity attempting to delete game_server entities for this title. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
