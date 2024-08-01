---
author: jasonsandlin
title: "PFAccountManagementServerGetUserAccountInfoAsync"
description: "Retrieves the relevant details for a specified user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerGetUserAccountInfoAsync  

Retrieves the relevant details for a specified user  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetUserAccountInfoAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetUserAccountInfoRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetUserAccountInfoRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetuseraccountinforequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This API allows for access to details regarding a user in the PlayFab service, usually for purposes of customer support. Note that data returned may be Personally Identifying Information (PII), such as email address, and so care should be taken in how this data is stored and managed. Since this call will always return the relevant information for users who have accessed the title, the recommendation is to not store this data locally. See also ServerGetUserInventoryAsync. When the asynchronous task is complete, call [PFAccountManagementServerGetUserAccountInfoGetResultSize](pfaccountmanagementservergetuseraccountinfogetresultsize.md) and [PFAccountManagementServerGetUserAccountInfoGetResult](pfaccountmanagementservergetuseraccountinfogetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
