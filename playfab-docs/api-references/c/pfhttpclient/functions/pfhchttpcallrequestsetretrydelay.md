---
author: jasonsandlin
title: "PFHCHttpCallRequestSetRetryDelay"
description: "Sets the HTTP retry delay in seconds. The default and minimum delay is 2 seconds."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetRetryDelay  

Sets the HTTP retry delay in seconds. The default and minimum delay is 2 seconds.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetRetryDelay(  
    PFHCCallHandle call,  
    uint32_t retryDelayInSeconds  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
*optional*  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
**`retryDelayInSeconds`** &nbsp; uint32_t  
  
The retry delay in seconds.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
Retries are delayed using a exponential back off. By default, it will delay 2 seconds then the next retry will delay 4 seconds, then 8 seconds, and so on up to a max of 1 min until either the call succeeds or the HTTP timeout window is reached, at which point the call will fail. The delay is also jittered between the current and next delay to spread out service load. The default for the HTTP timeout window is 20 seconds and can be changed using PFHCSettingsSetTimeoutWindow()<br /><br /> If the service returns an HTTP error with a "Retry-After" header and the title had previously called PFHCHttpCallRequestSetRetryCacheId(), then all future calls to that API will immediately fail with the original error without contacting the service until the "Retry-After" time has been reached.<br /><br /> Idempotent service calls are retried when a network error occurs or the server responds with<br /> one of these HTTP status codes:<br /> 408 (Request Timeout)<br /> 429 (Too Many Requests)<br /> 500 (Internal Server Error)<br /> 502 (Bad Gateway)<br /> 503 (Service Unavailable)<br /> 504 (Gateway Timeout)<br /><br /> This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
