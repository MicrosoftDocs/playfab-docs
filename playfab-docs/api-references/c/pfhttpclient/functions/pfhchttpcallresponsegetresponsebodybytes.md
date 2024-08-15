---
author: jasonsandlin
title: "PFHCHttpCallResponseGetResponseBodyBytes"
description: "Get the response body buffer of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using PFHCHttpCallResponseSetResponseBodyWriteFunction."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseGetResponseBodyBytes  

Get the response body buffer of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using PFHCHttpCallResponseSetResponseBodyWriteFunction.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseGetResponseBodyBytes(  
    PFHCCallHandle call,  
    size_t bufferSize,  
    uint8_t* buffer,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`bufferSize`** &nbsp; size_t  
  
The response body buffer size being passed in.  
  
**`buffer`** &nbsp; uint8_t*  
*_Out_writes_bytes_to_opt_(bufferSize,*bufferUsed)*  
  
The buffer to be written to.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The actual number of bytes written to the buffer.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling PFHCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
