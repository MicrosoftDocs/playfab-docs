---
author: jasonsandlin
title: "PFHCHttpCallSetTracing"
description: "Enables or disables tracing for this specific HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallSetTracing  

Enables or disables tracing for this specific HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallSetTracing(  
    PFHCCallHandle call,  
    bool traceCall  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`traceCall`** &nbsp; bool  
  
Trace this call.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
