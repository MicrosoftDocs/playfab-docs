---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayerCombinedInfoAsync"
description: "Retrieves all of the user's different kinds of info."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayerCombinedInfoAsync  

Retrieves all of the user's different kinds of info.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayerCombinedInfoAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayerCombinedInfoRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayerCombinedInfoRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayercombinedinforequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayerCombinedInfoGetResultSize](pfaccountmanagementclientgetplayercombinedinfogetresultsize.md) and [PFAccountManagementClientGetPlayerCombinedInfoGetResult](pfaccountmanagementclientgetplayercombinedinfogetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
