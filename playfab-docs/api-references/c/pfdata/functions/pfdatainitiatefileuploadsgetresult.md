---
author: jasonsandlin
title: "PFDataInitiateFileUploadsGetResult"
description: "Gets the result of a successful PFDataInitiateFileUploadsAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFDataInitiateFileUploadsGetResult  

Gets the result of a successful PFDataInitiateFileUploadsAsync call.  

## Syntax  
  
```cpp
HRESULT PFDataInitiateFileUploadsGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFDataInitiateFileUploadsResponse** result,  
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
  
**`result`** &nbsp; [PFDataInitiateFileUploadsResponse**](../../pfdatatypes/structs/pfdatainitiatefileuploadsresponse.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
