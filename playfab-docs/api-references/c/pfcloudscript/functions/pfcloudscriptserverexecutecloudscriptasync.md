---
author: jasonsandlin
title: "PFCloudScriptServerExecuteCloudScriptAsync"
description: "Executes a CloudScript function, with the 'currentPlayerId' set to the PlayFab ID of the authenticated player. The PlayFab ID is the entity ID of the player's master_player_account entity."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptServerExecuteCloudScriptAsync  

Executes a CloudScript function, with the 'currentPlayerId' set to the PlayFab ID of the authenticated player. The PlayFab ID is the entity ID of the player's master_player_account entity.  

## Syntax  
  
```cpp
HRESULT PFCloudScriptServerExecuteCloudScriptAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFCloudScriptExecuteCloudScriptServerRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFCloudScriptExecuteCloudScriptServerRequest*](../../pfcloudscripttypes/structs/pfcloudscriptexecutecloudscriptserverrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFCloudScriptServerExecuteCloudScriptGetResultSize](pfcloudscriptserverexecutecloudscriptgetresultsize.md) and [PFCloudScriptServerExecuteCloudScriptGetResult](pfcloudscriptserverexecutecloudscriptgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCloudScript.h
  
## See also  
[PFCloudScript members](../pfcloudscript_members.md)  

  
  
