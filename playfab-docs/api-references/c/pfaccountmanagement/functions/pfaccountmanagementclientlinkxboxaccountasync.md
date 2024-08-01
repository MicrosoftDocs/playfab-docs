---
author: jasonsandlin
title: "PFAccountManagementClientLinkXboxAccountAsync"
description: "Links the Xbox Live account associated with the provided access code to the user's PlayFab account"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientLinkXboxAccountAsync  

Links the Xbox Live account associated with the provided access code to the user's PlayFab account  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientLinkXboxAccountAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementClientLinkXboxAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementClientLinkXboxAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementclientlinkxboxaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, GDK, Linux, and macOS. See also ClientLoginWithXboxAsync, ClientUnlinkXboxAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_ALREADY_LINKED, E_PF_EXPIRED_XBOX_LIVE_TOKEN, E_PF_INVALID_XBOX_LIVE_TOKEN, E_PF_LINKED_ACCOUNT_ALREADY_CLAIMED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
