---
author: jasonsandlin
title: "PFAccountManagementClientUpdateUserTitleDisplayNameGetResultSize"
description: "Get the size in bytes needed to store the result of a ClientUpdateUserTitleDisplayName call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientUpdateUserTitleDisplayNameGetResultSize  

Get the size in bytes needed to store the result of a ClientUpdateUserTitleDisplayName call.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientUpdateUserTitleDisplayNameGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ACCOUNT_NOT_FOUND, E_PF_INVALID_PARTNER_RESPONSE, E_PF_NAME_NOT_AVAILABLE, E_PF_PROFANE_DISPLAY_NAME or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
