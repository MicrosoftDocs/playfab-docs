---
author: jasonsandlin
title: "PFAccountManagementClientAddOrUpdateContactEmailAsync"
description: "Adds or updates a contact email to the player's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientAddOrUpdateContactEmailAsync  

Adds or updates a contact email to the player's profile.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientAddOrUpdateContactEmailAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementAddOrUpdateContactEmailRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementAddOrUpdateContactEmailRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementaddorupdatecontactemailrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This API adds a contact email to the player's profile. If the player's profile already contains a contact email, it will update the contact email to the email address specified. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
