---
author: jasonsandlin
title: "PFMultiplayerServerListQosServersForTitleGetResultSize"
description: "Get the size in bytes needed to store the result of a ListQosServersForTitle call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMultiplayerServerListQosServersForTitleGetResultSize  

Get the size in bytes needed to store the result of a ListQosServersForTitle call.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerServerListQosServersForTitleGetResultSize(  
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
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_API_NOT_ENABLED_FOR_GAME_CLIENT_ACCESS, E_PF_MULTIPLAYER_SERVER_BAD_REQUEST, E_PF_MULTIPLAYER_SERVER_FORBIDDEN, E_PF_MULTIPLAYER_SERVER_INTERNAL_SERVER_ERROR, E_PF_MULTIPLAYER_SERVER_NOT_FOUND, E_PF_MULTIPLAYER_SERVER_UNAUTHORIZED, E_PF_MULTIPLAYER_SERVER_UNAVAILABLE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFMultiplayerServer.h
  
## See also  
[PFMultiplayerServer members](../pfmultiplayerserver_members.md)  

  
  
