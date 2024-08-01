---
author: jasonsandlin
title: "PFHCHttpCallRequestSetRequestBodyBytes"
description: "Set the request body bytes of the HTTP call. This API operation is mutually exclusive with PFHCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetRequestBodyBytes  

Set the request body bytes of the HTTP call. This API operation is mutually exclusive with PFHCHttpCallRequestSetRequestBodyReadFunction and will result in any custom read callbacks that were previously set on this call handle to be ignored.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetRequestBodyBytes(  
    PFHCCallHandle call,  
    const uint8_t* requestBodyBytes,  
    uint32_t requestBodySize  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`requestBodyBytes`** &nbsp; uint8_t*  
*_In_reads_bytes_(requestBodySize)*  
  
The request body bytes of the HTTP call.  
  
**`requestBodySize`** &nbsp; uint32_t  
  
The length in bytes of the body being set.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
