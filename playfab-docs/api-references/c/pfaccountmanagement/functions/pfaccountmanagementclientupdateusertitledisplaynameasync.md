---
author: jasonsandlin
title: "PFAccountManagementClientUpdateUserTitleDisplayNameAsync"
description: "Updates the title specific display name for the user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientUpdateUserTitleDisplayNameAsync  

Updates the title specific display name for the user  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientUpdateUserTitleDisplayNameAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementUpdateUserTitleDisplayNameRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementUpdateUserTitleDisplayNameRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementupdateusertitledisplaynamerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. In addition to the PlayFab username, titles can make use of a DisplayName which is also a unique identifier, but specific to the title. This allows for unique names which more closely match the theme or genre of a title, for example. When the asynchronous task is complete, call [PFAccountManagementClientUpdateUserTitleDisplayNameGetResultSize](pfaccountmanagementclientupdateusertitledisplaynamegetresultsize.md) and [PFAccountManagementClientUpdateUserTitleDisplayNameGetResult](pfaccountmanagementclientupdateusertitledisplaynamegetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
