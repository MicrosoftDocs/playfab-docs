---
author: jasonsandlin
title: "PFHCHttpCallCloseHandle"
description: "Decrements the reference count on the call object."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCHttpCallCloseHandle  

Decrements the reference count on the call object.  

## Syntax  
  
```cpp
HRESULT PFHCHttpCallCloseHandle(  
    PFHCCallHandle call  
)  
```  
  
### Parameters  
  
**`call`** &nbsp; PFHCCallHandle  
  
The handle of the HTTP call  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
When the PFHCCallHandle ref count is 0, PFHCHttpCallCloseHandle() will free the memory associated with the PFHCCallHandle.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
