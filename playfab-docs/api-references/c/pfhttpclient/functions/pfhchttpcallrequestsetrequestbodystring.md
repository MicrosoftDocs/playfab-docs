---
author: jasonsandlin
title: "PFHCHttpCallRequestSetRequestBodyString"
description: "Set the request body string of the HTTP call. This API operation is mutually exclusive with PFHCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetRequestBodyString  

Set the request body string of the HTTP call. This API operation is mutually exclusive with PFHCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetRequestBodyString(  
    PFHCCallHandle call,  
    const char* requestBodyString  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`requestBodyString`** &nbsp; char*  
*_In_z_*  
  
The UTF-8 encoded request body string of the HTTP call.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
