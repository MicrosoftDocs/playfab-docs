---
author: jasonsandlin
title: "PFMultiplayerServerRequestMultiplayerServerAsync"
description: "Request a multiplayer server session. Accepts tokens for title and if game client access is enabled, allows game client to request a server with player entity token."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerRequestMultiplayerServerAsync  

Request a multiplayer server session. Accepts tokens for title and if game client access is enabled, allows game client to request a server with player entity token.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerServerRequestMultiplayerServerAsync(  
    PFEntityHandle entityHandle,  
    const PFMultiplayerServerRequestMultiplayerServerRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFMultiplayerServerRequestMultiplayerServerRequest*](../../pfmultiplayerservertypes/structs/pfmultiplayerserverrequestmultiplayerserverrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Requests a multiplayer server session from a particular build in any of the given preferred regions. See also MultiplayerServerGetMultiplayerServerDetailsAsync. When the asynchronous task is complete, call [PFMultiplayerServerRequestMultiplayerServerGetResultSize](pfmultiplayerserverrequestmultiplayerservergetresultsize.md) and [PFMultiplayerServerRequestMultiplayerServerGetResult](pfmultiplayerserverrequestmultiplayerservergetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFMultiplayerServer.h
  
## See also  
[PFMultiplayerServer members](../pfmultiplayerserver_members.md)  

  
  
