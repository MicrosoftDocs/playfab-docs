---
author: jasonsandlin
title: "PFPlayerDataManagementServerListPlayerCustomPropertiesGetResult"
description: "Gets the result of a successful PFPlayerDataManagementServerListPlayerCustomPropertiesAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerListPlayerCustomPropertiesGetResult  

Gets the result of a successful PFPlayerDataManagementServerListPlayerCustomPropertiesAsync call.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerListPlayerCustomPropertiesGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFPlayerDataManagementServerListPlayerCustomPropertiesResult** result,  
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
  
**`result`** &nbsp; [PFPlayerDataManagementServerListPlayerCustomPropertiesResult**](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementserverlistplayercustompropertiesresult.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_PRODUCT_DISABLED_FOR_TITLE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
