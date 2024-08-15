---
author: jasonsandlin
title: "PFHCHttpCallRequestSetTimeoutWindow"
description: "Sets the HTTP timeout window in seconds."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetTimeoutWindow  

Sets the HTTP timeout window in seconds.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetTimeoutWindow(  
    PFHCCallHandle call,  
    uint32_t timeoutWindowInSeconds  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
*optional*  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls  
  
**`timeoutWindowInSeconds`** &nbsp; uint32_t  
  
The timeout window in seconds  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
This controls how long to spend attempting to retry idempotent service calls before failing.<br /> The default is 20 seconds.<br /><br /> Idempotent service calls are retried when a network error occurs or the server responds <br /> with one of these HTTP status codes:<br /> 408 (Request Timeout)<br /> 429 (Too Many Requests)<br /> 500 (Internal Server Error)<br /> 502 (Bad Gateway)<br /> 503 (Service Unavailable)<br /> 504 (Gateway Timeout)<br /><br /> This must be called prior to calling PFHCHttpCallPerformAsync.<br />
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
