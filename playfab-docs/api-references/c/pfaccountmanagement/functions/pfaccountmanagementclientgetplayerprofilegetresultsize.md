---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayerProfileGetResultSize"
description: "Get the size in bytes needed to store the result of a ClientGetPlayerProfile call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFAccountManagementClientGetPlayerProfileGetResultSize  

Get the size in bytes needed to store the result of a ClientGetPlayerProfile call.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayerProfileGetResultSize(  
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

  
  
