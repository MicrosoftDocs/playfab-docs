---
author: jasonsandlin
title: "PFAuthenticationValidateEntityTokenGetResult"
description: "Gets the result of a successful PFAuthenticationValidateEntityTokenAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationValidateEntityTokenGetResult  

Gets the result of a successful PFAuthenticationValidateEntityTokenAsync call.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationValidateEntityTokenGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFAuthenticationValidateEntityTokenResponse** result,  
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
  
**`result`** &nbsp; [PFAuthenticationValidateEntityTokenResponse**](../../pfauthenticationtypes/structs/pfauthenticationvalidateentitytokenresponse.md)  
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
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
