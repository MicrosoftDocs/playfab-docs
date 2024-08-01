---
author: jasonsandlin
title: "PFHCHttpCallResponseGetNetworkErrorCode"
description: "Get the network error code of the HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseGetNetworkErrorCode  

Get the network error code of the HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseGetNetworkErrorCode(  
    PFHCCallHandle call,  
    HRESULT* networkErrorCode,  
    uint32_t* platformNetworkErrorCode  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`networkErrorCode`** &nbsp; HRESULT*  
*output*  
  
The network error code of the HTTP call. Possible values are S_OK, or E_FAIL.  
  
**`platformNetworkErrorCode`** &nbsp; uint32_t*  
*output*  
  
The platform specific network error code of the HTTP call to be used for tracing / debugging.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling PFHCHttpCallPerformAsync when the HTTP task is completed. On the GDK Platform, HTTP calls that fail due to the title being suspended will have platformNetworkErrorCode set to HRESULT_FROM_WIN32(PROCESS_SUSPEND_RESUME).
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
