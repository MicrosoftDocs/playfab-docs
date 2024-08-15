---
author: jasonsandlin
title: "PFHCWebSocketGetEventFunctions"
description: "Gets the WebSocket functions to allow callers to respond to incoming messages and WebSocket close events."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCWebSocketGetEventFunctions  

Gets the WebSocket functions to allow callers to respond to incoming messages and WebSocket close events.  

## Syntax  
  
```cpp
HRESULT PFHCWebSocketGetEventFunctions(  
    PFHCWebsocketHandle websocket,  
    PFHCWebSocketMessageFunction* messageFunc,  
    PFHCWebSocketBinaryMessageFunction* binaryMessageFunc,  
    PFHCWebSocketCloseEventFunction* closeFunc,  
    void** functionContext  
)  
```  
  
### Parameters  
  
**`websocket`** &nbsp; PFHCWebsocketHandle  
  
The handle of the websocket.  
  
**`messageFunc`** &nbsp; PFHCWebSocketMessageFunction*  
*optional output*  
  
A pointer to the message handling callback to use, or a null pointer to remove.  
  
**`binaryMessageFunc`** &nbsp; PFHCWebSocketBinaryMessageFunction*  
*optional output*  
  
A pointer to the binary message handling callback to use, or a null pointer to remove.  
  
**`closeFunc`** &nbsp; PFHCWebSocketCloseEventFunction*  
*optional output*  
  
A pointer to the close callback to use, or a null pointer to remove.  
  
**`functionContext`** &nbsp; void**  
*output*  
  
Client context to pass to callback function.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, E_HC_NOT_INITIALISED, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
