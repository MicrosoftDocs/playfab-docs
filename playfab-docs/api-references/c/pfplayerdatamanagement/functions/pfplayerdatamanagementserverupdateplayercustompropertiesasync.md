---
author: jasonsandlin
title: "PFPlayerDataManagementServerUpdatePlayerCustomPropertiesAsync"
description: "Updates the title-specific custom property values for a player"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerUpdatePlayerCustomPropertiesAsync  

Updates the title-specific custom property values for a player  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerUpdatePlayerCustomPropertiesAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFPlayerDataManagementServerUpdatePlayerCustomPropertiesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFPlayerDataManagementServerUpdatePlayerCustomPropertiesRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementserverupdateplayercustompropertiesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. Performs an additive update of the custom properties for the specified player. In updating the player's custom properties, properties which already exist will have their values overwritten. No other properties will be changed apart from those specified in the call. See also ServerDeletePlayerCustomPropertiesAsync, ServerGetPlayerCustomPropertyAsync, ServerListPlayerCustomPropertiesAsync. When the asynchronous task is complete, call [PFPlayerDataManagementServerUpdatePlayerCustomPropertiesGetResultSize](pfplayerdatamanagementserverupdateplayercustompropertiesgetresultsize.md) and [PFPlayerDataManagementServerUpdatePlayerCustomPropertiesGetResult](pfplayerdatamanagementserverupdateplayercustompropertiesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
