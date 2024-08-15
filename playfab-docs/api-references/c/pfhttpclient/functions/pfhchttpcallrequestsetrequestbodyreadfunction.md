---
author: jasonsandlin
title: "PFHCHttpCallRequestSetRequestBodyReadFunction"
description: "Sets a custom callback function that will be used to read the request body when the HTTP call is performed. If a custom read callback is used, any request body data previously set by PFHCHttpCallRequestSetRequestBodyBytes or PFHCHttpCallRequestSetRequestBodyString is ignored making these API operations mutually exclusive."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetRequestBodyReadFunction  

Sets a custom callback function that will be used to read the request body when the HTTP call is performed. If a custom read callback is used, any request body data previously set by PFHCHttpCallRequestSetRequestBodyBytes or PFHCHttpCallRequestSetRequestBodyString is ignored making these API operations mutually exclusive.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetRequestBodyReadFunction(  
    PFHCCallHandle call,  
    PFHCHttpCallRequestBodyReadFunction readFunction,  
    size_t bodySize,  
    void* context  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`readFunction`** &nbsp; PFHCHttpCallRequestBodyReadFunction  
  
The request body read function this call should use.  
  
**`bodySize`** &nbsp; size_t  
  
The size of the body.  
  
**`context`** &nbsp; void*  
*optional*  
  
The context associated with this read function.  
  
  
### Return value
Type: HRESULT
  
Result code of this API operation. Possible values are S_OK or E_INVALIDARG.
  
## Remarks  
  
This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
