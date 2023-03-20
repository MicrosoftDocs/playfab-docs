---
author: jasonsandlin
title: "PFAccountManagementClientGetAccountInfoGetResultSize"
description: "Get the size in bytes needed to store the result of a ClientGetAccountInfo call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFAccountManagementClientGetAccountInfoGetResultSize  

Get the size in bytes needed to store the result of a ClientGetAccountInfo call.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetAccountInfoGetResultSize(  
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
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
