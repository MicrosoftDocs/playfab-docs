---
author: jasonsandlin
title: "PFAccountManagementClientLinkFacebookInstantGamesIdAsync"
description: "Links the Facebook Instant Games Id to the user's PlayFab account"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientLinkFacebookInstantGamesIdAsync  

Links the Facebook Instant Games Id to the user's PlayFab account  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientLinkFacebookInstantGamesIdAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementLinkFacebookInstantGamesIdRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementLinkFacebookInstantGamesIdRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementlinkfacebookinstantgamesidrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ClientLoginWithFacebookInstantGamesIdAsync, ClientUnlinkFacebookInstantGamesIdAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_FACEBOOK_INSTANT_GAMES_AUTH_NOT_CONFIGURED_FOR_TITLE, E_PF_INVALID_FACEBOOK_INSTANT_GAMES_SIGNATURE, E_PF_LINKED_IDENTIFIER_ALREADY_CLAIMED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
