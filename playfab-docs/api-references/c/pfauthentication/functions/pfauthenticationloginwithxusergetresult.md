---
author: jasonsandlin
title: "PFAuthenticationLoginWithXUserGetResult"
description: "Get the result from a PFAuthenticationLoginWithXUserAsync call. The PFEntityHandle will always be returned, but the additional info in the PFAuthenticationLoginResult is only returned if a buffer is provided."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFAuthenticationLoginWithXUserGetResult  

Get the result from a PFAuthenticationLoginWithXUserAsync call. The PFEntityHandle will always be returned, but the additional info in the PFAuthenticationLoginResult is only returned if a buffer is provided.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationLoginWithXUserGetResult(  
    XAsyncBlock* async,  
    PFEntityHandle* entityHandle,  
    size_t bufferSize,  
    void* buffer,  
    PFAuthenticationLoginResult result,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
  
XAsyncBlock for the async operation.  
  
**`entityHandle`** &nbsp; PFEntityHandle*  
*output*  
  
PFEntityHandle which can be used to authenticate other PlayFab API calls.  
  
**`bufferSize`** &nbsp; size_t  
  
The size of the buffer for the result object.  
  
**`buffer`** &nbsp; void*  
*_Out_writes_bytes_to_opt_(bufferSize,*bufferUsed)*  
  
Byte buffer used for the Login result value and its fields.  
  
**`result`** &nbsp; [PFAuthenticationLoginResult](../../pfauthenticationtypes/structs/pfauthenticationloginresult.md)  
*optional, library-allocated output*  
  
Pointer to the LoginResult object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
If the PFAuthenticationLoginWithXUserAsync call fails, entityHandle with be null. Otherwise, the handle must be closed with PFEntityCloseHandle when it is no longer needed. If returned, 'result' is a pointer within 'buffer' and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
