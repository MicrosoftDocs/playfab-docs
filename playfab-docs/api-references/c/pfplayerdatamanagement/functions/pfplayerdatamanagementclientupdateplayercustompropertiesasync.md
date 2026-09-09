---
author: jasonsandlin
title: "PFPlayerDataManagementClientUpdatePlayerCustomPropertiesAsync"
description: "Updates the title-specific custom property values for a player"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientUpdatePlayerCustomPropertiesAsync  

Updates the title-specific custom property values for a player  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementClientUpdatePlayerCustomPropertiesAsync(  
    PFEntityHandle entityHandle,  
    const PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFPlayerDataManagementClientUpdatePlayerCustomPropertiesRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementclientupdateplayercustompropertiesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Performs an additive update of the custom properties for the specified player. In updating the player's custom properties, properties which already exist will have their values overwritten. No other properties will be changed apart from those specified in the call. See also ClientDeletePlayerCustomPropertiesAsync, ClientGetPlayerCustomPropertyAsync, ClientListPlayerCustomPropertiesAsync. When the asynchronous task is complete, call [PFPlayerDataManagementClientUpdatePlayerCustomPropertiesGetResult](pfplayerdatamanagementclientupdateplayercustompropertiesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
