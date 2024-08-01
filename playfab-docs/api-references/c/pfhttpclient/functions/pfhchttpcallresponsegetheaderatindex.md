---
author: jasonsandlin
title: "PFHCHttpCallResponseGetHeaderAtIndex"
description: "Gets the response headers at specific zero based index in the HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallResponseGetHeaderAtIndex  

Gets the response headers at specific zero based index in the HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallResponseGetHeaderAtIndex(  
    PFHCCallHandle call,  
    uint32_t headerIndex,  
    const char** headerName,  
    const char** headerValue  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`headerIndex`** &nbsp; uint32_t  
  
Specific zero based index of the response header.  
  
**`headerName`** &nbsp; char**  
*output*  
  
UTF-8 encoded response header name for the HTTP call. The memory for the returned string pointer remains valid for the life of the PFHCCallHandle object until PFHCHttpCallCloseHandle() is called on it.  
  
**`headerValue`** &nbsp; char**  
*output*  
  
UTF-8 encoded response header value for the HTTP call. The memory for the returned string pointer remains valid for the life of the PFHCCallHandle object until PFHCHttpCallCloseHandle() is called on it.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
Use PFHCHttpCallResponseGetNumHeaders() to know how many response headers there are in the HTTP call. This can only be called after calling PFHCHttpCallPerformAsync when the HTTP task is completed.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
