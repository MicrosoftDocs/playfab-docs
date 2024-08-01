---
author: jasonsandlin
title: "PFAccountManagementClientLinkFacebookAccountAsync"
description: "Links the Facebook account associated with the provided Facebook access token to the user's PlayFab account"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientLinkFacebookAccountAsync  

Links the Facebook account associated with the provided Facebook access token to the user's PlayFab account  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientLinkFacebookAccountAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementLinkFacebookAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementLinkFacebookAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementlinkfacebookaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, Android, iOS, and macOS. Facebook sign-in is accomplished using the Facebook User Access Token. More information on the Token can be found in the Facebook developer documentation (https://developers.facebook.com/docs/facebook-login/access-tokens/). In Unity, for example, the Token is available as AccessToken in the Facebook SDK ScriptableObject FB. Note that titles should never re-use the same Facebook applications between PlayFab Title IDs, as Facebook provides unique user IDs per application and doing so can result in issues with the Facebook ID for the user in their PlayFab account information. If you must re-use an application in a new PlayFab Title ID, please be sure to first unlink all accounts from Facebook, or delete all users in the first Title ID. See also ClientLoginWithFacebookAsync, ClientUnlinkFacebookAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_ALREADY_LINKED, E_PF_ACCOUNT_NOT_FOUND, E_PF_FACEBOOK_API_ERROR, E_PF_INVALID_FACEBOOK_TOKEN, E_PF_LINKED_ACCOUNT_ALREADY_CLAIMED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
