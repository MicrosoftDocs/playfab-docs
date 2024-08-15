---
author: jasonsandlin
title: "PFHCHttpCallRequestSetUrl"
description: "Sets the url and method for the HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetUrl  

Sets the url and method for the HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetUrl(  
    PFHCCallHandle call,  
    const char* method,  
    const char* url  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`method`** &nbsp; char*  
*_In_z_*  
  
UTF-8 encoded method for the HTTP call.  
  
**`url`** &nbsp; char*  
*_In_z_*  
  
UTF-8 encoded URL for the HTTP call.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_OUTOFMEMORY, or E_FAIL.
  
## Remarks  
  
This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
