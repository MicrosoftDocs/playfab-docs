---
author: jasonsandlin
title: "PFHCHttpCallResponseGetHeader"
description: "Get a response header for the HTTP call for a given header name."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseGetHeader  

Get a response header for the HTTP call for a given header name.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseGetHeader(  
    PFHCCallHandle call,  
    const char* headerName,  
    const char** headerValue  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`headerName`** &nbsp; char*  
*_In_z_*  
  
UTF-8 encoded response header name for the HTTP call. The memory for the returned string pointer remains valid for the life of the PFHCCallHandle object until PFHCHttpCallCloseHandle() is called on it.  
  
**`headerValue`** &nbsp; char**  
*output*  
  
UTF-8 encoded response header value for the HTTP call. Returns nullptr if the header doesn't exist. The memory for the returned string pointer remains valid for the life of the PFHCCallHandle object until PFHCHttpCallCloseHandle() is called on it.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This can only be called after calling PFHCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
