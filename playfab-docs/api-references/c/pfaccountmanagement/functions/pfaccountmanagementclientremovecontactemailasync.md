---
author: jasonsandlin
title: "PFAccountManagementClientRemoveContactEmailAsync"
description: "Removes a contact email from the player's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientRemoveContactEmailAsync  

Removes a contact email from the player's profile.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientRemoveContactEmailAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementRemoveContactEmailRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementRemoveContactEmailRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementremovecontactemailrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This API removes an existing contact email from the player's profile. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
