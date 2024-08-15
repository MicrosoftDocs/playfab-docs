---
author: jasonsandlin
title: "PFEntityGetEntityTokenResult"
description: "Gets the result of a successful PFEntityGetEntityTokenAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityGetEntityTokenResult  

Gets the result of a successful PFEntityGetEntityTokenAsync call.  

## Syntax  
  
```cpp
HRESULT PFEntityGetEntityTokenResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    const PFEntityToken** entityToken,  
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
  
**`entityToken`** &nbsp; [PFEntityToken**](../structs/pfentitytoken.md)  
*library-allocated output*  
  
Pointer to the EntityToken object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
entityToken is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
