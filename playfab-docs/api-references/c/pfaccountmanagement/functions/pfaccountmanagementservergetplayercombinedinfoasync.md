---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayerCombinedInfoAsync"
description: "Returns whatever info is requested in the response for the user. Note that PII (like email address, facebook id) may be returned. All parameters default to false."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerGetPlayerCombinedInfoAsync  

Returns whatever info is requested in the response for the user. Note that PII (like email address, facebook id) may be returned. All parameters default to false.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayerCombinedInfoAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetPlayerCombinedInfoRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayerCombinedInfoRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayercombinedinforequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementServerGetPlayerCombinedInfoGetResultSize](pfaccountmanagementservergetplayercombinedinfogetresultsize.md) and [PFAccountManagementServerGetPlayerCombinedInfoGetResult](pfaccountmanagementservergetplayercombinedinfogetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
