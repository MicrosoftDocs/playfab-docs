---
author: jasonsandlin
title: "PFHCHttpCallRequestSetRetryCacheId"
description: "ID number of this REST endpoint used to cache the Retry-After header for fast fail."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetRetryCacheId  

ID number of this REST endpoint used to cache the Retry-After header for fast fail.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetRetryCacheId(  
    PFHCCallHandle call,  
    uint32_t retryAfterCacheId  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
*optional*  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
**`retryAfterCacheId`** &nbsp; uint32_t  
  
ID number of this REST endpoint used to cache the Retry-After header for fast fail. Must be non-zero. 1-1000 are reserved for XSAPI.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
