---
author: jasonsandlin
title: "PFPlayerDataManagementServerGetPlayerCustomPropertyAsync"
description: "Retrieves a title-specific custom property value for a player."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerGetPlayerCustomPropertyAsync  

Retrieves a title-specific custom property value for a player.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerGetPlayerCustomPropertyAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFPlayerDataManagementServerGetPlayerCustomPropertyRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFPlayerDataManagementServerGetPlayerCustomPropertyRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementservergetplayercustompropertyrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. See also ServerDeletePlayerCustomPropertiesAsync, ServerListPlayerCustomPropertiesAsync, ServerUpdatePlayerCustomPropertiesAsync. When the asynchronous task is complete, call [PFPlayerDataManagementServerGetPlayerCustomPropertyGetResultSize](pfplayerdatamanagementservergetplayercustompropertygetresultsize.md) and [PFPlayerDataManagementServerGetPlayerCustomPropertyGetResult](pfplayerdatamanagementservergetplayercustompropertygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
