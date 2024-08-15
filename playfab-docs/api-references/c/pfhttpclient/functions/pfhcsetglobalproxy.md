---
author: jasonsandlin
title: "PFHCSetGlobalProxy"
description: "Manually sets an explicit proxy address."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCSetGlobalProxy  

Manually sets an explicit proxy address.  

## Syntax  
  
```cpp
HRESULT PFHCSetGlobalProxy(  
    const char* proxyUri  
)  
```  
  
### Parameters  
  
**`proxyUri`** &nbsp; char*  
  
The proxy address to use in the "[ip]:[port]" format.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_HC_NOT_INITIALISED, or E_FAIL.
  
## Remarks  
  
If it is passed a null proxy, it will reset to default. Does not include proxying web socket traffic.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
