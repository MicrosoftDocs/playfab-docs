---
author: jasonsandlin
title: "PFHCHttpCallResponseGetResponseBodyBytesSize"
description: "Get the response body buffer size of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using PFHCHttpCallResponseSetResponseBodyWriteFunction."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseGetResponseBodyBytesSize  

Get the response body buffer size of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using PFHCHttpCallResponseSetResponseBodyWriteFunction.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseGetResponseBodyBytesSize(  
    PFHCCallHandle call,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The response body buffer size of the HTTP call.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling PFHCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
