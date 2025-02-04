---
author: jasonsandlin
title: "PFAuthenticationAuthenticateGameServerWithCustomIdGetResult"
description: "Get the result from a PFAuthenticationAuthenticateGameServerWithCustomIdAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFAuthenticationAuthenticateGameServerWithCustomIdGetResult  

Get the result from a PFAuthenticationAuthenticateGameServerWithCustomIdAsync call.  

## Syntax  
  
```cpp
HRESULT PFAuthenticationAuthenticateGameServerWithCustomIdGetResult(  
    XAsyncBlock* async,  
    PFEntityHandle* entityHandle,  
    bool* newlyCreated  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`entityHandle`** &nbsp; PFEntityHandle*  
*output*  
  
PFEntityHandle which can be used to authenticate other PlayFab API calls.  
  
**`newlyCreated`** &nbsp; bool*  
*optional output*  
  
Will be set to true if the account was newly created on this authentication and false otherwise  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
If the PFAuthenticationAuthenticateGameServerWithCustomIdAsync call fails, entityHandle with be null. Otherwise, the handle must be closed with PFEntityCloseHandle when it is no longer needed.
  
## Requirements  
  
**Header:** PFAuthentication.h
  
## See also  
[PFAuthentication members](../pfauthentication_members.md)  

  
  
