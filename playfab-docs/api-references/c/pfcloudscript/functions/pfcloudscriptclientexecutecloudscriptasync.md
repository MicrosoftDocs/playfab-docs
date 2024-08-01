---
author: jasonsandlin
title: "PFCloudScriptClientExecuteCloudScriptAsync"
description: "Executes a CloudScript function, with the 'currentPlayerId' set to the PlayFab ID of the authenticated player. The PlayFab ID is the entity ID of the player's master_player_account entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptClientExecuteCloudScriptAsync  

Executes a CloudScript function, with the 'currentPlayerId' set to the PlayFab ID of the authenticated player. The PlayFab ID is the entity ID of the player's master_player_account entity.  

## Syntax  
  
```cpp
HRESULT PFCloudScriptClientExecuteCloudScriptAsync(  
    PFEntityHandle entityHandle,  
    const PFCloudScriptExecuteCloudScriptRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCloudScriptExecuteCloudScriptRequest*](../../pfcloudscripttypes/structs/pfcloudscriptexecutecloudscriptrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCloudScriptClientExecuteCloudScriptGetResultSize](pfcloudscriptclientexecutecloudscriptgetresultsize.md) and [PFCloudScriptClientExecuteCloudScriptGetResult](pfcloudscriptclientexecutecloudscriptgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCloudScript.h
  
## See also  
[PFCloudScript members](../pfcloudscript_members.md)  

  
  
