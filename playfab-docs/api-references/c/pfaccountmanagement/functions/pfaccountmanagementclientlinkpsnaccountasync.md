---
author: jasonsandlin
title: "PFAccountManagementClientLinkPSNAccountAsync"
description: "Links the PlayStation :tm: Network account associated with the provided access code to the user's PlayFab account"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementClientLinkPSNAccountAsync  

Links the PlayStation :tm: Network account associated with the provided access code to the user's PlayFab account  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientLinkPSNAccountAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementClientLinkPSNAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementClientLinkPSNAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementclientlinkpsnaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Sony PlayStation®, Linux, and macOS. See also ClientLoginWithPSNAsync, ClientUnlinkPSNAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_ALREADY_LINKED, E_PF_ACCOUNT_LINKED_TO_A_BANNED_PLAYER, E_PF_INVALID_PARAMS, E_PF_INVALID_PSN_AUTH_CODE, E_PF_INVALID_PSN_AUTH_CODE, E_PF_INVALID_PSN_ISSUER_ID, E_PF_LINKED_ACCOUNT_ALREADY_CLAIMED, E_PF_PSN_INACCESSIBLE, E_PF_PSN_NEXT_GEN_NOT_CONFIGURED_FOR_TITLE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
