---
author: jasonsandlin
title: "PFAccountManagementServerLinkNintendoServiceAccountAsync"
description: "Links the Nintendo account associated with the token to the user's PlayFab account"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerLinkNintendoServiceAccountAsync  

Links the Nintendo account associated with the token to the user's PlayFab account  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerLinkNintendoServiceAccountAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementServerLinkNintendoServiceAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementServerLinkNintendoServiceAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementserverlinknintendoserviceaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ServerLinkNintendoServiceAccountSubjectAsync, ServerUnlinkNintendoServiceAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_INVALID_IDENTITY_PROVIDER_ID, E_PF_LINKED_IDENTIFIER_ALREADY_CLAIMED, E_PF_NINTENDO_SWITCH_NOT_ENABLED_FOR_TITLE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
