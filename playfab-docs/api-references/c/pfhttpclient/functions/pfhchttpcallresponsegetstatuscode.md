---
author: jasonsandlin
title: "PFHCHttpCallResponseGetStatusCode"
description: "Get the HTTP status code of the HTTP call response."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseGetStatusCode  

Get the HTTP status code of the HTTP call response.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseGetStatusCode(  
    PFHCCallHandle call,  
    uint32_t* statusCode  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`statusCode`** &nbsp; uint32_t*  
*output*  
  
the HTTP status code of the HTTP call response.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling PFHCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
