---
author: jasonsandlin
title: "PFAccountManagementClientAddUsernamePasswordAsync"
description: "Adds playfab username/password auth to an existing account created via an anonymous auth method, e.g. automatic device ID login."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientAddUsernamePasswordAsync  

Adds playfab username/password auth to an existing account created via an anonymous auth method, e.g. automatic device ID login.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientAddUsernamePasswordAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementAddUsernamePasswordRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementAddUsernamePasswordRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementaddusernamepasswordrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ClientLoginWithEmailAddressAsync, ClientLoginWithPlayFabAsync. When the asynchronous task is complete, call [PFAccountManagementClientAddUsernamePasswordGetResultSize](pfaccountmanagementclientaddusernamepasswordgetresultsize.md) and [PFAccountManagementClientAddUsernamePasswordGetResult](pfaccountmanagementclientaddusernamepasswordgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
