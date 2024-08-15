---
author: jasonsandlin
title: "PFHCHttpCallRequestSetRetryAllowed"
description: "Sets if retry is allowed for this HTTP call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallRequestSetRetryAllowed  

Sets if retry is allowed for this HTTP call.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallRequestSetRetryAllowed(  
    PFHCCallHandle call,  
    bool retryAllowed  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
*optional*  
  
The handle of the HTTP call. Pass nullptr to set the default for future calls.  
  
**`retryAllowed`** &nbsp; bool  
  
If retry is allowed for this HTTP call.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_FAIL.
  
## Remarks  
  
Defaults to true. This must be called prior to calling PFHCHttpCallPerformAsync.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
