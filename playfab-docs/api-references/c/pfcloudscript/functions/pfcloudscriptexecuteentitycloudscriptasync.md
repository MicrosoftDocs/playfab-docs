---
author: jasonsandlin
title: "PFCloudScriptExecuteEntityCloudScriptAsync"
description: "Cloud Script is one of PlayFab's most versatile features. It allows client code to request execution of any kind of custom server-side functionality you can implement, and it can be used in conjunction with virtually anything."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptExecuteEntityCloudScriptAsync  

Cloud Script is one of PlayFab's most versatile features. It allows client code to request execution of any kind of custom server-side functionality you can implement, and it can be used in conjunction with virtually anything.  

## Syntax  
  
```cpp
HRESULT PFCloudScriptExecuteEntityCloudScriptAsync(  
    PFEntityHandle entityHandle,  
    const PFCloudScriptExecuteEntityCloudScriptRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCloudScriptExecuteEntityCloudScriptRequest*](../../pfcloudscripttypes/structs/pfcloudscriptexecuteentitycloudscriptrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Executes CloudScript with the entity profile that is defined in the request. When the asynchronous task is complete, call [PFCloudScriptExecuteEntityCloudScriptGetResultSize](pfcloudscriptexecuteentitycloudscriptgetresultsize.md) and [PFCloudScriptExecuteEntityCloudScriptGetResult](pfcloudscriptexecuteentitycloudscriptgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCloudScript.h
  
## See also  
[PFCloudScript members](../pfcloudscript_members.md)  

  
  
