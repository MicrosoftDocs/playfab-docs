---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromKongregateIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Kongregate identifiers. The Kongregate identifiers are the IDs for the user accounts, available as 'user_id' from the Kongregate API methods(ex: http://developers.kongregate.com/docs/client/getUserId)."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromKongregateIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of Kongregate identifiers. The Kongregate identifiers are the IDs for the user accounts, available as 'user_id' from the Kongregate API methods(ex: http://developers.kongregate.com/docs/client/getUserId).  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromKongregateIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromKongregateIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromKongregateIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromkongregateidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromKongregateIDsGetResultSize](pfaccountmanagementclientgetplayfabidsfromkongregateidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromKongregateIDsGetResult](pfaccountmanagementclientgetplayfabidsfromkongregateidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
