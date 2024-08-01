---
author: jasonsandlin
title: "PFAccountManagementClientLinkGameCenterAccountAsync"
description: "Links the Game Center account associated with the provided Game Center ID to the user's PlayFab account. Logging in with a Game Center ID is insecure if you do not include the optional PublicKeyUrl, Salt, Signature, and Timestamp parameters in this request. It is recommended you require these parameters on all Game Center calls by going to the Apple Add-ons page in the PlayFab Game Manager and enabling the 'Require secure authentication only for this app' option."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientLinkGameCenterAccountAsync  

Links the Game Center account associated with the provided Game Center ID to the user's PlayFab account. Logging in with a Game Center ID is insecure if you do not include the optional PublicKeyUrl, Salt, Signature, and Timestamp parameters in this request. It is recommended you require these parameters on all Game Center calls by going to the Apple Add-ons page in the PlayFab Game Manager and enabling the 'Require secure authentication only for this app' option.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientLinkGameCenterAccountAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementLinkGameCenterAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementLinkGameCenterAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementlinkgamecenteraccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, iOS, and macOS. See also ClientUnlinkGameCenterAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_ALREADY_LINKED, E_PF_GAME_CENTER_AUTHENTICATION_FAILED, E_PF_INVALID_GAME_CENTER_AUTH_REQUEST, E_PF_LINKED_ACCOUNT_ALREADY_CLAIMED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
