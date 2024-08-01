---
author: jasonsandlin
title: "PFCloudScriptExecuteFunctionAsync"
description: "Cloud Script is one of PlayFab's most versatile features. It allows client code to request execution of any kind of custom server-side functionality you can implement, and it can be used in conjunction with virtually anything."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptExecuteFunctionAsync  

Cloud Script is one of PlayFab's most versatile features. It allows client code to request execution of any kind of custom server-side functionality you can implement, and it can be used in conjunction with virtually anything.  

## Syntax  
  
```cpp
HRESULT PFCloudScriptExecuteFunctionAsync(  
    PFEntityHandle entityHandle,  
    const PFCloudScriptExecuteFunctionRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCloudScriptExecuteFunctionRequest*](../../pfcloudscripttypes/structs/pfcloudscriptexecutefunctionrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Executes an Azure Function with the profile of the entity that is defined in the request. See also CloudScriptRegisterHttpFunctionAsync, CloudScriptRegisterQueuedFunctionAsync. When the asynchronous task is complete, call [PFCloudScriptExecuteFunctionGetResultSize](pfcloudscriptexecutefunctiongetresultsize.md) and [PFCloudScriptExecuteFunctionGetResult](pfcloudscriptexecutefunctiongetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCloudScript.h
  
## See also  
[PFCloudScript members](../pfcloudscript_members.md)  

  
  
