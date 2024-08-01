---
author: jasonsandlin
title: "PFHCHttpCallRequestSetHeader"
description: "Set a request header for the HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetHeader  

Set a request header for the HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetHeader(  
    PFHCCallHandle call,  
    const char* headerName,  
    const char* headerValue,  
    bool allowTracing  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`headerName`** &nbsp; char*  
*_In_z_*  
  
UTF-8 encoded request header name for the HTTP call.  
  
**`headerValue`** &nbsp; char*  
*_In_z_*  
  
UTF-8 encoded request header value for the HTTP call.  
  
**`allowTracing`** &nbsp; bool  
  
Set to false to skip tracing this request header, for example if it contains private information.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
