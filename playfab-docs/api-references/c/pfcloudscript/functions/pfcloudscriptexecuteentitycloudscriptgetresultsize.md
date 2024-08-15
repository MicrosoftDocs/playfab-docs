---
author: jasonsandlin
title: "PFCloudScriptExecuteEntityCloudScriptGetResultSize"
description: "Get the size in bytes needed to store the result of a ExecuteEntityCloudScript call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptExecuteEntityCloudScriptGetResultSize  

Get the size in bytes needed to store the result of a ExecuteEntityCloudScript call.  

## Syntax  
  
```cpp
HRESULT PFCloudScriptExecuteEntityCloudScriptGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_CLOUD_SCRIPT_API_REQUEST_COUNT_EXCEEDED, E_PF_CLOUD_SCRIPT_API_REQUEST_ERROR, E_PF_CLOUD_SCRIPT_FUNCTION_ARGUMENT_SIZE_EXCEEDED, E_PF_CLOUD_SCRIPT_HTTP_REQUEST_ERROR, E_PF_CLOUD_SCRIPT_NOT_FOUND, E_PF_INVALID_ENTITY_TYPE, E_PF_JAVASCRIPT_EXCEPTION, E_PF_TITLE_DELETED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFCloudScript.h
  
## See also  
[PFCloudScript members](../pfcloudscript_members.md)  

  
  
