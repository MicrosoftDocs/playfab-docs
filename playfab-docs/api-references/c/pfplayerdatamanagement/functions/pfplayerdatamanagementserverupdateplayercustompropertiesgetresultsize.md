---
author: jasonsandlin
title: "PFPlayerDataManagementServerUpdatePlayerCustomPropertiesGetResultSize"
description: "Get the size in bytes needed to store the result of a ServerUpdatePlayerCustomProperties call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerUpdatePlayerCustomPropertiesGetResultSize  

Get the size in bytes needed to store the result of a ServerUpdatePlayerCustomProperties call.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerUpdatePlayerCustomPropertiesGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_PLAYER_CUSTOM_PROPERTIES_DUPLICATE_PROPERTY_NAME, E_PF_PLAYER_CUSTOM_PROPERTIES_PROPERTY_COUNT_TOO_HIGH, E_PF_PLAYER_CUSTOM_PROPERTIES_PROPERTY_NAME_IS_INVALID, E_PF_PLAYER_CUSTOM_PROPERTIES_PROPERTY_NAME_TOO_LONG, E_PF_PLAYER_CUSTOM_PROPERTIES_STRING_PROPERTY_VALUE_TOO_LONG, E_PF_PLAYER_CUSTOM_PROPERTIES_VALUE_IS_INVALID_TYPE, E_PF_PLAYER_CUSTOM_PROPERTIES_VERSION_MISMATCH, E_PF_PRODUCT_DISABLED_FOR_TITLE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
