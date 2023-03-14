---
author: jasonsandlin
title: "PFCloudScriptExecuteFunctionGetResultSize"
description: "Get the size in bytes needed to store the result of a ExecuteFunction call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCloudScriptExecuteFunctionGetResultSize  

Get the size in bytes needed to store the result of a ExecuteFunction call.  

## Syntax  
  
```cpp
HRESULT PFCloudScriptExecuteFunctionGetResultSize(  
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
  
**Header:** PFCloudScript.h
  
## See also  
[PFCloudScript members](../pfcloudscript_members.md)  

  
  
