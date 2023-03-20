---
author: jasonsandlin
title: "PFAccountManagementClientUpdateAvatarUrlAsync"
description: "Update the avatar URL of the player"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
PFTitlePlayerHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementClientUpdateAvatarUrlRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementclientupdateavatarurlrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
