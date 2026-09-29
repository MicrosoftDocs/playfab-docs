---
author: jasonsandlin
title: "PFPlayerDataManagementServerListPlayerCustomPropertiesAsync"
description: "Retrieves title-specific custom property values for a player."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerListPlayerCustomPropertiesAsync  

Retrieves title-specific custom property values for a player.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerListPlayerCustomPropertiesAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFPlayerDataManagementListPlayerCustomPropertiesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFPlayerDataManagementListPlayerCustomPropertiesRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementlistplayercustompropertiesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. See also ServerDeletePlayerCustomPropertiesAsync, ServerGetPlayerCustomPropertyAsync, ServerUpdatePlayerCustomPropertiesAsync. When the asynchronous task is complete, call [PFPlayerDataManagementServerListPlayerCustomPropertiesGetResultSize](pfplayerdatamanagementserverlistplayercustompropertiesgetresultsize.md) and [PFPlayerDataManagementServerListPlayerCustomPropertiesGetResult](pfplayerdatamanagementserverlistplayercustompropertiesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
