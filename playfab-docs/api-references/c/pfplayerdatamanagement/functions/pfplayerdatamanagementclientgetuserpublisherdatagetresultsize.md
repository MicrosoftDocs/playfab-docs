---
author: jasonsandlin
title: "PFPlayerDataManagementClientGetUserPublisherDataGetResultSize"
description: "Get the size in bytes needed to store the result of a ClientGetUserPublisherData call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFPlayerDataManagementClientGetUserPublisherDataGetResultSize  

Get the size in bytes needed to store the result of a ClientGetUserPublisherData call.  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementClientGetUserPublisherDataGetResultSize(  
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
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
