---
author: jasonsandlin
title: "PFHCHttpCallGetRequestUrl"
description: "Gets the request url for the HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallGetRequestUrl  

Gets the request url for the HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallGetRequestUrl(  
    PFHCCallHandle call,  
    const char** url  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`url`** &nbsp; char**  
*output*  
  
The UTF-8 encoded url body string of the HTTP call. The memory for the returned string pointer remains valid for the life of the PFHCCallHandle object until PFHCHttpCallCloseHandle() is called on it.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
