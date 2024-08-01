---
author: jasonsandlin
title: "PFAccountManagementServerLinkXboxAccountAsync"
description: "Links the Xbox Live account associated with the provided access code to the user's PlayFab account"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerLinkXboxAccountAsync  

Links the Xbox Live account associated with the provided access code to the user's PlayFab account  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerLinkXboxAccountAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementServerLinkXboxAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementServerLinkXboxAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementserverlinkxboxaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ServerLoginWithXboxAsync, ServerUnlinkXboxAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_ALREADY_LINKED, E_PF_INVALID_XBOX_LIVE_TOKEN, E_PF_LINKED_ACCOUNT_ALREADY_CLAIMED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
