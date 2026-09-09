---
author: jasonsandlin
title: "PFPlayerDataManagementServerUpdatePlayerCustomPropertiesGetResult"
description: "Gets the result of a successful PFPlayerDataManagementServerUpdatePlayerCustomPropertiesAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerUpdatePlayerCustomPropertiesGetResult  

Gets the result of a successful PFPlayerDataManagementServerUpdatePlayerCustomPropertiesAsync call.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerUpdatePlayerCustomPropertiesGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult** result,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t  
  
The size of the buffer for the result object.  
  
**`buffer`** &nbsp; void*  
*_Out_writes_bytes_to_(bufferSize,*bufferUsed)*  
  
Byte buffer used for the result value and its fields.  
  
**`result`** &nbsp; [PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult**](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementserverupdateplayercustompropertiesresult.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_PLAYER_CUSTOM_PROPERTIES_DUPLICATE_PROPERTY_NAME, E_PF_PLAYER_CUSTOM_PROPERTIES_PROPERTY_COUNT_TOO_HIGH, E_PF_PLAYER_CUSTOM_PROPERTIES_PROPERTY_NAME_IS_INVALID, E_PF_PLAYER_CUSTOM_PROPERTIES_PROPERTY_NAME_TOO_LONG, E_PF_PLAYER_CUSTOM_PROPERTIES_STRING_PROPERTY_VALUE_TOO_LONG, E_PF_PLAYER_CUSTOM_PROPERTIES_VALUE_IS_INVALID_TYPE, E_PF_PLAYER_CUSTOM_PROPERTIES_VERSION_MISMATCH, E_PF_PRODUCT_DISABLED_FOR_TITLE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
