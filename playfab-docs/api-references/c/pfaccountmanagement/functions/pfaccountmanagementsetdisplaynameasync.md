---
author: jasonsandlin
title: "PFAccountManagementSetDisplayNameAsync"
description: "Update the display name of the entity"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementSetDisplayNameAsync  

Update the display name of the entity  

## Syntax  
  
```cpp
HRESULT PFAccountManagementSetDisplayNameAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementSetDisplayNameRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementSetDisplayNameRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementsetdisplaynamerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Given an entity profile, will update its display name to the one passed in if the profile's version is equal to the specified value See also ProfileGetProfileAsync. When the asynchronous task is complete, call [PFAccountManagementSetDisplayNameGetResultSize](pfaccountmanagementsetdisplaynamegetresultsize.md) and [PFAccountManagementSetDisplayNameGetResult](pfaccountmanagementsetdisplaynamegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
