---
author: jasonsandlin
title: "PFAccountManagementClientLinkNintendoServiceAccountAsync"
description: "Links the Nintendo account associated with the token to the user's PlayFab account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientLinkNintendoServiceAccountAsync  

Links the Nintendo account associated with the token to the user's PlayFab account.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientLinkNintendoServiceAccountAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementClientLinkNintendoServiceAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementClientLinkNintendoServiceAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementclientlinknintendoserviceaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Nintendo Switch, Linux, and macOS. See also ClientLoginWithNintendoServiceAccountAsync, ClientUnlinkNintendoServiceAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_INVALID_IDENTITY_PROVIDER_ID, E_PF_LINKED_IDENTIFIER_ALREADY_CLAIMED, E_PF_NINTENDO_SWITCH_NOT_ENABLED_FOR_TITLE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
