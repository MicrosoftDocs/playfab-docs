---
author: jasonsandlin
title: "PFPlayerDataManagementServerDeletePlayerCustomPropertiesAsync"
description: "Deletes title-specific custom properties for a player"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerDeletePlayerCustomPropertiesAsync  

Deletes title-specific custom properties for a player  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerDeletePlayerCustomPropertiesAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFPlayerDataManagementServerDeletePlayerCustomPropertiesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFPlayerDataManagementServerDeletePlayerCustomPropertiesRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementserverdeleteplayercustompropertiesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. Deletes custom properties for the specified player. The list of provided property names must be non-empty. See also ServerGetPlayerCustomPropertyAsync, ServerListPlayerCustomPropertiesAsync, ServerUpdatePlayerCustomPropertiesAsync. When the asynchronous task is complete, call [PFPlayerDataManagementServerDeletePlayerCustomPropertiesGetResultSize](pfplayerdatamanagementserverdeleteplayercustompropertiesgetresultsize.md) and [PFPlayerDataManagementServerDeletePlayerCustomPropertiesGetResult](pfplayerdatamanagementserverdeleteplayercustompropertiesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
