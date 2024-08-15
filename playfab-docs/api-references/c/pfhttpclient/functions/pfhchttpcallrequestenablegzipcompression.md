---
author: jasonsandlin
title: "PFHCHttpCallRequestEnableGzipCompression"
description: "Enable GZIP compression on the provided body payload."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestEnableGzipCompression  

Enable GZIP compression on the provided body payload.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestEnableGzipCompression(  
    PFHCCallHandle call,  
    PFHCCompressionLevel level  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`level`** &nbsp; [PFHCCompressionLevel](../enums/pfhccompressionlevel.md)  
  
The desired compression level.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling HCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
