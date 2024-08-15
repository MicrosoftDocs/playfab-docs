---
author: jasonsandlin
title: "PFAuthenticationGetEntityGetResult"
description: "Gets the result of a successful PFAuthenticationGetEntityAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationGetEntityGetResult  

Gets the result of a successful PFAuthenticationGetEntityAsync call.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationGetEntityGetResult(  
    XAsyncBlock* async,  
    PFEntityHandle* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; PFEntityHandle*  
*output*  
  
TBD    
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ENCRYPTION_KEY_BROKEN, E_PF_NO_VALID_CERTIFICATE_FOR_AAD or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
If the PFAuthenticationGetEntityAsync call fails, entityHandle with be null. Otherwise, the handle must be closed with PFEntityCloseHandle when it is no longer needed.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
