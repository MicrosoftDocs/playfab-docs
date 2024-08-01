---
author: jasonsandlin
title: "PFHCHttpCallResponseGetNumHeaders"
description: "Gets the number of response headers in the HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseGetNumHeaders  

Gets the number of response headers in the HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseGetNumHeaders(  
    PFHCCallHandle call,  
    uint32_t* numHeaders  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`numHeaders`** &nbsp; uint32_t*  
*output*  
  
The number of response headers in the HTTP call.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling PFHCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
