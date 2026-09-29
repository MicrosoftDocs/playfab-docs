---
author: jasonsandlin
title: "PFPlayerDataManagementClientListPlayerCustomPropertiesAsync"
description: "Retrieves title-specific custom property values for a player."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientListPlayerCustomPropertiesAsync  

Retrieves title-specific custom property values for a player.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementClientListPlayerCustomPropertiesAsync(  
    PFEntityHandle entityHandle,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also ClientDeletePlayerCustomPropertiesAsync, ClientGetPlayerCustomPropertyAsync, ClientUpdatePlayerCustomPropertiesAsync. When the asynchronous task is complete, call [PFPlayerDataManagementClientListPlayerCustomPropertiesGetResultSize](pfplayerdatamanagementclientlistplayercustompropertiesgetresultsize.md) and [PFPlayerDataManagementClientListPlayerCustomPropertiesGetResult](pfplayerdatamanagementclientlistplayercustompropertiesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
