---
author: jasonsandlin
title: "PFDataFinalizeFileUploadsGetResult"
description: "Gets the result of a successful PFDataFinalizeFileUploadsAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataFinalizeFileUploadsGetResult  

Gets the result of a successful PFDataFinalizeFileUploadsAsync call.  

## Syntax  
  
```cpp
HRESULT PFDataFinalizeFileUploadsGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFDataFinalizeFileUploadsResponse** result,  
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
  
**`result`** &nbsp; [PFDataFinalizeFileUploadsResponse**](../../pfdatatypes/structs/pfdatafinalizefileuploadsresponse.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_FILE_NOT_FOUND, E_PF_NO_ENTITY_FILE_OPERATION_PENDING or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
