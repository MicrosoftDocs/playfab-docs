---
author: jasonsandlin
title: "PFHCHttpCallResponseGetResponseString"
description: "Get the response body string of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using PFHCHttpCallResponseSetResponseBodyWriteFunction."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseGetResponseString  

Get the response body string of the HTTP call. This API operation will fail if a custom write callback was set on this call handle using PFHCHttpCallResponseSetResponseBodyWriteFunction.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseGetResponseString(  
    PFHCCallHandle call,  
    const char** responseString  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`responseString`** &nbsp; char**  
*output*  
  
The UTF-8 encoded response body string of the HTTP call. The memory for the returned string pointer remains valid for the life of the PFHCCallHandle object until PFHCHttpCallCloseHandle() is called on it.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling PFHCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
