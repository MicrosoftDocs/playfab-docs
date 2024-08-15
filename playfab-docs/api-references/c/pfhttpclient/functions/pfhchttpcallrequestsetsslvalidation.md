---
author: jasonsandlin
title: "PFHCHttpCallRequestSetSSLValidation"
description: "Enables or disables SSL server certificate validation for this specific HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetSSLValidation  

Enables or disables SSL server certificate validation for this specific HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetSSLValidation(  
    PFHCCallHandle call,  
    bool sslValidation  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call.  
  
**`sslValidation`** &nbsp; bool  
  
Boolean indicating whether to enable or disable certificate validation for the HTTP call.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
Only implemented for Win32. The default is true Optional, call prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
