---
author: jasonsandlin
title: "PFPlayerDataManagementServerGetUserInternalDataGetResultSize"
description: "Get the size in bytes needed to store the result of a ServerGetUserInternalData call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 09/25/2023
---

# PFPlayerDataManagementServerGetUserInternalDataGetResultSize  

Get the size in bytes needed to store the result of a ServerGetUserInternalData call.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerGetUserInternalDataGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  