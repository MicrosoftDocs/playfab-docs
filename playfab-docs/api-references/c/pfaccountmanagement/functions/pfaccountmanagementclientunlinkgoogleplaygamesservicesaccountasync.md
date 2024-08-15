---
author: jasonsandlin
title: "PFAccountManagementClientUnlinkGooglePlayGamesServicesAccountAsync"
description: "Unlinks the related Google Play Games account from the user's PlayFab account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientUnlinkGooglePlayGamesServicesAccountAsync  

Unlinks the related Google Play Games account from the user's PlayFab account.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientUnlinkGooglePlayGamesServicesAccountAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementUnlinkGooglePlayGamesServicesAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementUnlinkGooglePlayGamesServicesAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementunlinkgoogleplaygamesservicesaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, Android, and macOS. See also ClientLinkGooglePlayGamesServicesAccountAsync, ClientLoginWithGooglePlayGamesServicesAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_NOT_LINKED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
