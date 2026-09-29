---
author: jasonsandlin
title: "PFPlayerDataManagementClientGetPlayerCustomPropertyAsync"
description: "Retrieves a title-specific custom property value for a player."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientGetPlayerCustomPropertyAsync  

Retrieves a title-specific custom property value for a player.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementClientGetPlayerCustomPropertyAsync(  
    PFEntityHandle entityHandle,  
    const PFPlayerDataManagementClientGetPlayerCustomPropertyRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFPlayerDataManagementClientGetPlayerCustomPropertyRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementclientgetplayercustompropertyrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also ClientDeletePlayerCustomPropertiesAsync, ClientListPlayerCustomPropertiesAsync, ClientUpdatePlayerCustomPropertiesAsync. When the asynchronous task is complete, call [PFPlayerDataManagementClientGetPlayerCustomPropertyGetResultSize](pfplayerdatamanagementclientgetplayercustompropertygetresultsize.md) and [PFPlayerDataManagementClientGetPlayerCustomPropertyGetResult](pfplayerdatamanagementclientgetplayercustompropertygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
