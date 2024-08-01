---
author: jasonsandlin
title: "PFAuthenticationReLoginWithXUserAsync"
description: "Reauthenticates an existing PFEntityHandle using an XUserHandle. Used to address situations where the EntityToken expired and the PlayFab SDK is unable to refresh it."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationReLoginWithXUserAsync  

Reauthenticates an existing PFEntityHandle using an XUserHandle. Used to address situations where the EntityToken expired and the PlayFab SDK is unable to refresh it.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationReLoginWithXUserAsync(  
    PFEntityHandle entityHandle,  
    const PFAuthenticationLoginWithXUserRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to re-login.  
  
**`request`** &nbsp; [PFAuthenticationLoginWithXUserRequest*](../../pfauthenticationtypes/structs/pfauthenticationloginwithxuserrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Call XAsyncGetStatus to get the result of the operation. If successful, the cached EntityToken for the PFEntityHandle will be updated in place.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
