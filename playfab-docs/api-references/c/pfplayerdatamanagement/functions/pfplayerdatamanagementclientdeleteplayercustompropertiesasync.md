---
author: jasonsandlin
title: "PFPlayerDataManagementClientDeletePlayerCustomPropertiesAsync"
description: "Deletes title-specific custom properties for a player"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientDeletePlayerCustomPropertiesAsync  

Deletes title-specific custom properties for a player  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementClientDeletePlayerCustomPropertiesAsync(  
    PFEntityHandle entityHandle,  
    const PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFPlayerDataManagementClientDeletePlayerCustomPropertiesRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementclientdeleteplayercustompropertiesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Deletes custom properties for the specified player. The list of provided property names must be non-empty. See also ClientGetPlayerCustomPropertyAsync, ClientListPlayerCustomPropertiesAsync, ClientUpdatePlayerCustomPropertiesAsync. When the asynchronous task is complete, call [PFPlayerDataManagementClientDeletePlayerCustomPropertiesGetResultSize](pfplayerdatamanagementclientdeleteplayercustompropertiesgetresultsize.md) and [PFPlayerDataManagementClientDeletePlayerCustomPropertiesGetResult](pfplayerdatamanagementclientdeleteplayercustompropertiesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
