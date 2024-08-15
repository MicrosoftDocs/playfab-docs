---
author: jasonsandlin
title: "PFHCWebSocketCreate"
description: "Creates an WebSocket handle."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketCreate  

Creates an WebSocket handle.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketCreate(  
    PFHCWebsocketHandle* websocket,  
    PFHCWebSocketMessageFunction messageFunc,  
    PFHCWebSocketBinaryMessageFunction binaryMessageFunc,  
    PFHCWebSocketCloseEventFunction closeFunc,  
    void* functionContext  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle*  
*output*  
  
The handle of the websocket.  
  
**`messageFunc`** &nbsp; PFHCWebSocketMessageFunction  
*optional*  
  
A pointer to the message handling callback to use, or a null pointer to remove.  
  
**`binaryMessageFunc`** &nbsp; PFHCWebSocketBinaryMessageFunction  
*optional*  
  
A pointer to the binary message handling callback to use, or a null pointer to remove.  
  
**`closeFunc`** &nbsp; PFHCWebSocketCloseEventFunction  
*optional*  
  
A pointer to the close callback to use, or a null pointer to remove.  
  
**`functionContext`** &nbsp; void*  
*optional*  
  
Client context to pass to callback function.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
WebSocket usage:<br /> Create a WebSocket handle using PFHCWebSocketCreate()<br /> Call PFHCWebSocketSetProxyUri() and PFHCWebSocketSetHeader() to prepare the PFHCWebsocketHandle<br /> Call PFHCWebSocketConnectAsync() to connect the WebSocket using the PFHCWebsocketHandle.<br /> Call PFHCWebSocketSendMessageAsync() to send a message to the WebSocket using the PFHCWebsocketHandle.<br /> Call PFHCWebSocketDisconnect() to disconnect the WebSocket using the PFHCWebsocketHandle.<br /> Call PFHCWebSocketCloseHandle() when done with the PFHCWebsocketHandle to free the associated memory<br />
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
