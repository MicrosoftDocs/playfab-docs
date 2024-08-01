---
author: jasonsandlin
title: "PFHCHttpCallRequestSetTimeout"
description: "Sets the timeout for this HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetTimeout  

Sets the timeout for this HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetTimeout(  
    PFHCCallHandle call,  
    uint32_t timeoutInSeconds  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
*optional*  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
**`timeoutInSeconds`** &nbsp; uint32_t  
  
The timeout for this HTTP call.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
Defaults to 30 seconds. This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
