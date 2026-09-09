---
author: jasonsandlin
title: "PFPlayerDataManagementServerGetPlayerCustomPropertyGetResultSize"
description: "Get the size in bytes needed to store the result of a ServerGetPlayerCustomProperty call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerGetPlayerCustomPropertyGetResultSize  

Get the size in bytes needed to store the result of a ServerGetPlayerCustomProperty call.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerGetPlayerCustomPropertyGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_PLAYER_CUSTOM_PROPERTIES_PROPERTY_DOES_NOT_EXIST or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
