---
author: jasonsandlin
title: "PFAccountManagementClientUpdateAvatarUrlAsync"
description: "Update the avatar URL of the player"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientUpdateAvatarUrlAsync  

Update the avatar URL of the player  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientUpdateAvatarUrlAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementClientUpdateAvatarUrlRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementClientUpdateAvatarUrlRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementclientupdateavatarurlrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
