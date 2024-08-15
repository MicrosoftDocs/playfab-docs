---
author: jasonsandlin
title: "PFHCHttpCallResponseGetPlatformNetworkErrorMessage"
description: "Get the platform network error message of the HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseGetPlatformNetworkErrorMessage  

Get the platform network error message of the HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseGetPlatformNetworkErrorMessage(  
    PFHCCallHandle call,  
    const char** platformNetworkErrorMessage  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`platformNetworkErrorMessage`** &nbsp; char**  
*output*  
  
The platform specific network error message of the HTTP call to be used for tracing / debugging.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling PFHCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
