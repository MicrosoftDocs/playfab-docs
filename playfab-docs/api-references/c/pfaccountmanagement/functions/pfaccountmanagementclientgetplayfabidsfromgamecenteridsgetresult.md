---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsGetResult"
description: "Gets the result of a successful PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsGetResult  

Gets the result of a successful PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsAsync call.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFAccountManagementGetPlayFabIDsFromGameCenterIDsResult** result,  
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
  
**`result`** &nbsp; [PFAccountManagementGetPlayFabIDsFromGameCenterIDsResult**](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromgamecenteridsresult.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
