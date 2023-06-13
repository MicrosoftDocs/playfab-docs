---
author: jasonsandlin
title: "PFAccountManagementClientGetAccountInfoAsync"
description: "Retrieves the user's PlayFab account details"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFAccountManagementClientGetAccountInfoAsync  

Retrieves the user's PlayFab account details  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetAccountInfoAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetAccountInfoRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFTitlePlayerHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetAccountInfoRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetaccountinforequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
If successful, call [PFAccountManagementClientGetAccountInfoGetResult](pfaccountmanagementclientgetaccountinfogetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  