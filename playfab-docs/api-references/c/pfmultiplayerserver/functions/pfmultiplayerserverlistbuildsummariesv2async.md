---
author: jasonsandlin
title: "PFMultiplayerServerListBuildSummariesV2Async"
description: "Lists summarized details of all multiplayer server builds for a title. Accepts tokens for title and if game client access is enabled, allows game client to request list of builds with player entity token."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerListBuildSummariesV2Async  

Lists summarized details of all multiplayer server builds for a title. Accepts tokens for title and if game client access is enabled, allows game client to request list of builds with player entity token.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerServerListBuildSummariesV2Async(  
    PFEntityHandle entityHandle,  
    const PFMultiplayerServerListBuildSummariesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFMultiplayerServerListBuildSummariesRequest*](../../pfmultiplayerservertypes/structs/pfmultiplayerserverlistbuildsummariesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Returns a list of summarized details of all multiplayer server builds for a title. See also MultiplayerServerCreateBuildWithManagedContainerAsync, MultiplayerServerDeleteBuildAsync, MultiplayerServerGetBuildAsync. When the asynchronous task is complete, call [PFMultiplayerServerListBuildSummariesV2GetResultSize](pfmultiplayerserverlistbuildsummariesv2getresultsize.md) and [PFMultiplayerServerListBuildSummariesV2GetResult](pfmultiplayerserverlistbuildsummariesv2getresult.md) to get the result.
  
## Requirements  
  
**Header:** PFMultiplayerServer.h
  
## See also  
[PFMultiplayerServer members](../pfmultiplayerserver_members.md)  

  
  
